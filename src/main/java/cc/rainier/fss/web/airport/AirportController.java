package cc.rainier.fss.web.airport;

import cc.rainier.fss.entity.Airport;
import cc.rainier.fss.service.airport.AirportService;
import cc.rainier.fss.web.BaseController;
import com.google.common.collect.Maps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springside.modules.web.Servlets;

import javax.servlet.ServletRequest;
import javax.validation.Valid;
import java.util.List;
import java.util.Map;

/**
 * 管理员管理Airport的Controller.
 * 
 * @author zzyang
 */
@Controller
@RequestMapping(value = "/airport")
public class AirportController extends BaseController {

    private static Map<String, String> sortTypes = Maps.newLinkedHashMap();
    static {
        sortTypes.put("auto", "自动");
        sortTypes.put("code", "编码");
        sortTypes.put("name", "标题");
    }

	@Autowired
	private AirportService airportService;

    @RequestMapping(method = RequestMethod.GET)
    public String list(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
                       @RequestParam(value = "page.size", defaultValue = PAGE_SIZE) int pageSize,
                       @RequestParam(value = "sortType", defaultValue = "auto") String sortType, Model model,
                       ServletRequest request) {
        Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
//        Long userId = getCurrentUserId();

        Page<Airport> airports = airportService.getUserAirport(null ,searchParams, pageNumber, pageSize, sortType);

        model.addAttribute("airports", airports);
        model.addAttribute("sortType", sortType);
        model.addAttribute("sortTypes", sortTypes);
        // 将搜索条件编码成字符串，用于排序，分页的URL
        model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));

        return "info/airportList";
    }
    
    
//	@RequestMapping(method = RequestMethod.GET)
//	public String list(Model model) {
//        List<Airport> airports = airportService.getAllAirport();
//        model.addAttribute("airports",airports);
//        return "info/airportList";
//	}

	@RequestMapping(value = "audit/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") Long id, Model model) {
		model.addAttribute("airport", airportService.getAirport(id));
		return "info/airportForm";
	}

	@RequestMapping(value = "audit", method = RequestMethod.POST)
	public String update(@Valid @ModelAttribute("airport") Airport airport, RedirectAttributes redirectAttributes) {
		airportService.saveAirport(airport);
        redirectAttributes.addFlashAttribute("message", "操作成功");
        return "redirect:/info/";
	}

	@RequestMapping(value = "delete/{id}")
	public String delete(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
		Airport airport = airportService.getAirport(id);
        airportService.deleteAirport(id);
		redirectAttributes.addFlashAttribute("message", "删除计划[" + airport.getId() + "]成功");
		return "redirect:/info/";
	}

	/**
	 * 所有RequestMapping方法调用前的Model准备方法, 实现Struts2 Preparable二次部分绑定的效果,先根据form的id从数据库查出User对象,再把Form提交的内容绑定到该对象上。
	 * 因为仅update()方法的form中有id属性，因此仅在update时实际执行.
	 */
	@ModelAttribute
	public void getFightPlan(@RequestParam(value = "id", defaultValue = "-1") Long id, Model model) {
		if (id != -1) {
			model.addAttribute("airport", airportService.getAirport(id));
		}
	}
}

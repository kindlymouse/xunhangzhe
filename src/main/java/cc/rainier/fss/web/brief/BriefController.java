package cc.rainier.fss.web.brief;

import cc.rainier.fss.entity.FlightPlan;
import cc.rainier.fss.entity.Brief;
import cc.rainier.fss.entity.User;
import cc.rainier.fss.service.airport.AirportService;
import cc.rainier.fss.service.brief.BriefService;
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
import java.util.Date;
import java.util.Map;

/**
 * 管理员管理FPL的Controller.
 * 
 * @author zzyang
 */
@Controller
@RequestMapping(value = "/brief")
public class BriefController extends BaseController{

	@Autowired
	private BriefService briefService;
    @Autowired
    private AirportService airportService;
    private static Map<String, String> sortTypes = Maps.newLinkedHashMap();
    static {
        sortTypes.put("auto", "自动");
        sortTypes.put("title", "标题");
    }

	@RequestMapping(method = RequestMethod.GET)
    public String list(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
                       @RequestParam(value = "page.size", defaultValue = PAGE_SIZE) int pageSize,
                       @RequestParam(value = "sortType", defaultValue = "auto") String sortType, Model model,
                       ServletRequest request) {
        Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
//        Long userId = getCurrentUserId();

        Page<Brief> briefs = briefService.getPageBrief(searchParams, pageNumber, pageSize, sortType);

        model.addAttribute("briefs", briefs);
        model.addAttribute("sortType", sortType);
        model.addAttribute("sortTypes", sortTypes);
        // 将搜索条件编码成字符串，用于排序，分页的URL
        model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));

        return "brief/briefList";
    }


    @RequestMapping(value = "create", method = RequestMethod.GET)
    public String createForm(Model model) {
        model.addAttribute("brief", new Brief());
        model.addAttribute("action", "create");
        model.addAttribute("airports",airportService.getAllAirport());
        return "brief/briefForm";
    }

    @RequestMapping(value = "create", method = RequestMethod.POST)
    public String create(@Valid Brief newBrief, RedirectAttributes redirectAttributes) {
        User user = new User(getCurrentUserId());
        newBrief.setSysFillUser(user);
        newBrief.setSysFillTime(new Date());
        briefService.saveBrief(newBrief);
        redirectAttributes.addFlashAttribute("message", "创建任务成功");
        return "redirect:/brief/";
    }

    @RequestMapping(value = "update/{id}", method = RequestMethod.GET)
    public String updateForm(@PathVariable("id") Long id, Model model) {
        model.addAttribute("brief", briefService.get(id));
        model.addAttribute("action", "update");
        model.addAttribute("airports",airportService.getAllAirport());
        return "brief/briefForm";
    }

    @RequestMapping(value = "update", method = RequestMethod.POST)
    public String update(@Valid @ModelAttribute("brief") Brief brief, RedirectAttributes redirectAttributes) {
        brief.setAirport(airportService.getAirport(brief.getAirport().getId()));
        briefService.saveBrief(brief);
        redirectAttributes.addFlashAttribute("message", "更新简报成功");
        return "redirect:/brief/";
    }

	@RequestMapping(value = "delete/{id}")
	public String delete(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
		Brief brief = briefService.get(id);
       briefService.deleteBrief(id);
		redirectAttributes.addFlashAttribute("message", "删除简报[" + brief.getId() + ":" + brief.getTitle() + "]成功");
		return "redirect:/brief/";
	}

	/**
	 * 所有RequestMapping方法调用前的Model准备方法, 实现Struts2 Preparable二次部分绑定的效果,先根据form的id从数据库查出User对象,再把Form提交的内容绑定到该对象上。
	 * 因为仅update()方法的form中有id属性，因此仅在update时实际执行.
	 */
	@ModelAttribute
	public void getBrief(@RequestParam(value = "id", defaultValue = "-1") Long id, @RequestParam(value = "airport.id", defaultValue = "-1") Long aid,
                         @RequestParam(value = "pushed", defaultValue = "N") String pushed, Model model) {
		if (id != -1) {
            Brief b = briefService.get(id);
            if(b.getAirport().getId() != aid){
                b.setAirport(airportService.getAirport(aid));
            }
            //当pushed值为空的时候，不会传进来？！
            b.setPushed(pushed);
            model.addAttribute("brief", b);
		}

        if(pushed.equals("")){
            model.addAttribute("pushed","N");
        }

	}
}

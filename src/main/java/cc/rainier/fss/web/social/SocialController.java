package cc.rainier.fss.web.social;

import cc.rainier.fss.entity.Attach;
import cc.rainier.fss.service.social.AttachService;
import cc.rainier.fss.web.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springside.modules.web.Servlets;

import javax.servlet.ServletRequest;
import javax.validation.Valid;
import java.util.Map;

/**
 * 管理员管理FPL的Controller.
 * 
 * @author zzyang
 */
@Controller
@RequestMapping(value = "/social")
public class SocialController extends BaseController{

    private static final String WF_PAGE_SIZE = "15";         //瀑布流单页图片数量。

	@Autowired
	private AttachService attachService;

	@RequestMapping(method = RequestMethod.GET)
    public String list(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
                       @RequestParam(value = "page.size", defaultValue = WF_PAGE_SIZE) int pageSize,
                       @RequestParam(value = "sortType", defaultValue = "auto") String sortType, Model model,
                       ServletRequest request) {
        Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
//        Long userId = getCurrentUserId();
        Page<Attach> attaches = attachService.getUserAttach(null, searchParams, pageNumber, pageSize, sortType);
        model.addAttribute("attaches", attaches);
        model.addAttribute("sortType", sortType);
        // 将搜索条件编码成字符串，用于排序，分页的URL
        model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));
        return "social/socialList";
    }
    @RequestMapping(value="datapage.htm", method = RequestMethod.GET)
    public String page(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
                       @RequestParam(value = "page.size", defaultValue = WF_PAGE_SIZE) int pageSize,
                       @RequestParam(value = "sortType", defaultValue = "auto") String sortType, Model model,
                       ServletRequest request) {
        Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
//        Long userId = getCurrentUserId();
        Page<Attach> attaches = attachService.getUserAttach(null, searchParams, pageNumber, pageSize, sortType);
        model.addAttribute("attaches", attaches);
        model.addAttribute("sortType", sortType);
        // 将搜索条件编码成字符串，用于排序，分页的URL
        model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));
        return "social/datapage";
    }
    @RequestMapping(value = "update/{id}", method = RequestMethod.GET)
    public String updateForm(@PathVariable("id") Long id, Model model) {
        model.addAttribute("attach", attachService.getAttach(id));
        model.addAttribute("action", "update");
        return "social/attachForm";
    }

    @RequestMapping(value = "update", method = RequestMethod.POST)
    public String update(@Valid @ModelAttribute("attach") Attach attach, RedirectAttributes redirectAttributes) {
        attachService.saveAttach(attach);
        redirectAttributes.addFlashAttribute("message", "更新信息成功");
        return "redirect:/social/";
    }

	@RequestMapping(value = "delete/{id}")
	public String delete(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
		Attach attach = attachService.getAttach(id);
       attachService.deleteAttach(id);
		redirectAttributes.addFlashAttribute("message", "删除信息[" + attach.getId() + "]成功");
		return "redirect:/social/";
	}

	/**
	 * 所有RequestMapping方法调用前的Model准备方法, 实现Struts2 Preparable二次部分绑定的效果,先根据form的id从数据库查出User对象,再把Form提交的内容绑定到该对象上。
	 * 因为仅update()方法的form中有id属性，因此仅在update时实际执行.
	 */
	@ModelAttribute
	public void getFightPlan(@RequestParam(value = "id", defaultValue = "-1") Long id, Model model) {
		if (id != -1) {
			model.addAttribute("attach", attachService.getAttach(id));
		}
	}
}

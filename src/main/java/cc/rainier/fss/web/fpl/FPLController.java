package cc.rainier.fss.web.fpl;

import cc.rainier.fss.entity.FlightPlan;
import cc.rainier.fss.service.fpl.FPLService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.List;

/**
 * 管理员管理FPL的Controller.
 * 
 * @author zzyang
 */
@Controller
@RequestMapping(value = "/plan")
public class FPLController {

	@Autowired
	private FPLService fplService;

	@RequestMapping(method = RequestMethod.GET)
	public String list(Model model) {
        List<FlightPlan> plans = fplService.getAllFlightPlan();
        model.addAttribute("plans",plans);
        return "plan/planList";
	}

	@RequestMapping(value = "audit/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") Long id, Model model) {
		model.addAttribute("plan", fplService.getFlightPlan(id));
		return "plan/planForm";
	}

	@RequestMapping(value = "audit", method = RequestMethod.POST)
	public String update(@Valid @ModelAttribute("plan") FlightPlan plan, RedirectAttributes redirectAttributes) {
		fplService.saveFlightPlan(plan);
        redirectAttributes.addFlashAttribute("message", "操作成功");
        return "redirect:/plan/";
	}

	@RequestMapping(value = "delete/{id}")
	public String delete(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
		FlightPlan plan = fplService.getFlightPlan(id);
        fplService.deleteFlightPlan(id);
		redirectAttributes.addFlashAttribute("message", "删除计划[" + plan.getId() + "]成功");
		return "redirect:/plan/";
	}

	/**
	 * 所有RequestMapping方法调用前的Model准备方法, 实现Struts2 Preparable二次部分绑定的效果,先根据form的id从数据库查出User对象,再把Form提交的内容绑定到该对象上。
	 * 因为仅update()方法的form中有id属性，因此仅在update时实际执行.
	 */
	@ModelAttribute
	public void getFightPlan(@RequestParam(value = "id", defaultValue = "-1") Long id, Model model) {
		if (id != -1) {
			model.addAttribute("plan", fplService.getFlightPlan(id));
		}
	}
}

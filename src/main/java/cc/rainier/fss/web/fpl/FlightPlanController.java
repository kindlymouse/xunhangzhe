package cc.rainier.fss.web.fpl;

import cc.rainier.fss.entity.FlightPlan;
import cc.rainier.fss.entity.User;
import cc.rainier.fss.service.fpl.FPLService;
import cc.rainier.fss.web.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: Alex Zhang
 * Date: 13-8-12
 * Time: 上午10:30
 */
@Controller
@RequestMapping(value = "/fpl")
public class FlightPlanController extends BaseController {

    @Autowired
    private FPLService fplService;

    @RequestMapping(value = "create", method = RequestMethod.POST)
    public String create(RedirectAttributes redirectAttributes) {
        User user = new User(getCurrentUserId());
        FlightPlan flghtPlan = new FlightPlan();
        flghtPlan.setAddressee("CCC");
        flghtPlan.setFilingTime("0323");
        flghtPlan.setSysFillUser(user);
        flghtPlan.setSysFillTime(new Date());

        fplService.saveFlightPlan(flghtPlan);

        return null;
    }
}

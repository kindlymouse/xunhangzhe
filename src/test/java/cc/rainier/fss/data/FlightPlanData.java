package cc.rainier.fss.data;

import cc.rainier.fss.entity.FlightPlan;
import cc.rainier.fss.entity.User;
import org.springside.modules.test.data.RandomData;

/**
 * Created with IntelliJ IDEA.
 * User: Alex Zhang
 * Date: 13-8-10
 * Time: 下午6:20
 */
public class FlightPlanData {
    public static FlightPlan randomFlightPlan(){
        FlightPlan flghtPlan = new FlightPlan();
        flghtPlan.setAddressee(randomAddressee());
        flghtPlan.setFilingTime("0323");
        User user = new User(1L);
        flghtPlan.setSysFillUser(user);
        return flghtPlan;
    }

    public static String randomAddressee() {
        return RandomData.randomName("HFS HSHF");
    }
}

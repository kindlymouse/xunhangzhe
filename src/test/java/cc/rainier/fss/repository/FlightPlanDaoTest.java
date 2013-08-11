package cc.rainier.fss.repository;

import cc.rainier.fss.data.FlightPlanData;
import cc.rainier.fss.entity.FlightPlan;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.test.context.ContextConfiguration;
import org.springside.modules.test.spring.SpringTransactionalTestCase;

import java.util.Date;

import static org.junit.Assert.assertEquals;

/**
 * Created with IntelliJ IDEA.
 * User: Alex Zhang
 * Date: 13-8-11
 * Time: 上午9:44
 */
@ContextConfiguration(locations = { "/applicationContext.xml" })
public class FlightPlanDaoTest extends SpringTransactionalTestCase {

    @Autowired
    private FlightPlanDao fplDao;

    @Test
    public void findBySysFillUserId() throws Exception {
        Page<FlightPlan> fpls = fplDao.findBySysFillUserId(1L, new PageRequest(0, 100, Sort.Direction.ASC, "id"));
        assertEquals(5, fpls.getContent().size());
        assertEquals(new Long(1), fpls.getContent().get(0).getId());

        fpls = fplDao.findBySysFillUserId(99999L, new PageRequest(0, 100, Sort.Direction.ASC, "id"));
        assertEquals(0, fpls.getContent().size());
    }

    @Test
    public void createFPL() throws Exception{
        FlightPlan fpl = FlightPlanData.randomFlightPlan();
        fpl.setSysFillTime(new Date());
        fplDao.save(fpl);
    }
}
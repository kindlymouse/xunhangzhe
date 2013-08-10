package cc.rainier.fss.service.fpl;

import cc.rainier.fss.entity.FlightPlan;
import cc.rainier.fss.repository.FlightPlanDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.modules.persistence.DynamicSpecifications;
import org.springside.modules.persistence.SearchFilter;

import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: Alex Zhang
 * Date: 13-8-10
 * Time: 下午6:13
 */
//Spring Bean的标识.
@Component
// 默认将类中的所有public函数纳入事务管理.
@Transactional
public class FPLService {

    private FlightPlanDao fplDao;

    public FlightPlan getFlightPlan(Long id) {
        return fplDao.findOne(id);
    }

    public void saveFlightPlan(FlightPlan entity) {
        fplDao.save(entity);
    }

    public void deleteFlightPlan(Long id) {
        fplDao.delete(id);
    }

    public List<FlightPlan> getAllFlightPlan() {
        return (List<FlightPlan>) fplDao.findAll();
    }

    public Page<FlightPlan> getUserTask(Long userId, Map<String, Object> searchParams, int pageNumber, int pageSize,
                                  String sortType) {
        PageRequest pageRequest = buildPageRequest(pageNumber, pageSize, sortType);
        Specification<FlightPlan> spec = buildSpecification(userId, searchParams);

        return fplDao.findAll(spec, pageRequest);
    }

    /**
     * 创建分页请求.
     */
    private PageRequest buildPageRequest(int pageNumber, int pagzSize, String sortType) {
        Sort sort = null;
        if ("auto".equals(sortType)) {
            sort = new Sort(Sort.Direction.DESC, "id");
        } else if ("filingTime".equals(sortType)) {
            sort = new Sort(Sort.Direction.ASC, "filingTime");
        }

        return new PageRequest(pageNumber - 1, pagzSize, sort);
    }

    /**
     * 创建动态查询条件组合.
     */
    private Specification<FlightPlan> buildSpecification(Long userId, Map<String, Object> searchParams) {
        Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
        filters.put("user.id", new SearchFilter("user.id", SearchFilter.Operator.EQ, userId));
        Specification<FlightPlan> spec = DynamicSpecifications.bySearchFilter(filters.values(), FlightPlan.class);
        return spec;
    }

    @Autowired
    public void setFlightPlanDao(FlightPlanDao fplDao) {
        this.fplDao = fplDao;
    }
}

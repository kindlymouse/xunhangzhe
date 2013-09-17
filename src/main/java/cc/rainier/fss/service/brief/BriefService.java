package cc.rainier.fss.service.brief;

import cc.rainier.fss.entity.Brief;
import cc.rainier.fss.repository.BriefDao;
import cc.rainier.fss.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.modules.persistence.DynamicSpecifications;
import org.springside.modules.persistence.SearchFilter;
import org.springside.modules.persistence.SearchFilter.Operator;

import java.util.List;
import java.util.Map;

//Spring Bean的标识.
@Component
// 默认将类中的所有public函数纳入事务管理.
@Transactional
public class BriefService extends BaseService {

	private BriefDao briefDao;

	public Brief get(Long id) {
		return briefDao.findOne(id);
	}

	public void saveBrief(Brief entity) {
		briefDao.save(entity);
	}

	public void deleteBrief(Long id) {
		briefDao.delete(id);
	}

	public List<Brief> getAllBrief() {
		return (List<Brief>) briefDao.findAll();
	}

	public Page<Brief> getPageBrief( Map<String, Object> searchParams, int pageNumber, int pageSize,
			String sortType) {
		PageRequest pageRequest = buildPageRequest(pageNumber, pageSize, sortType);
		Specification<Brief> spec = buildSpecification(null, searchParams);

		return briefDao.findAll(spec, pageRequest);
	}

    /**
     * 创建动态查询条件组合.
     */
    protected Specification<Brief> buildSpecification(Long userId, Map<String, Object> searchParams) {
        Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
        Specification<Brief> spec = DynamicSpecifications.bySearchFilter(filters.values(), Brief.class);
        return spec;
    }

	@Autowired
	public void setBriefDao(BriefDao briefDao) {
		this.briefDao = briefDao;
	}
}

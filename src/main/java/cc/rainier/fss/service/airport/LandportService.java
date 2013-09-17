package cc.rainier.fss.service.airport;

import cc.rainier.fss.entity.Landport;
import cc.rainier.fss.repository.LandportDao;
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
public class LandportService {

	private LandportDao landportDao;

	public Landport get(Long id) {
		return landportDao.findOne(id);
	}

	public void saveLandport(Landport entity) {
		landportDao.save(entity);
	}

	public void deleteLandport(Long id) {
		landportDao.delete(id);
	}

	public List<Landport> getAllLandport() {
		return (List<Landport>) landportDao.findAll();
	}

	public Page<Landport> getUserLandport(Long userId, Map<String, Object> searchParams, int pageNumber, int pageSize,
			String sortType) {
		PageRequest pageRequest = buildPageRequest(pageNumber, pageSize, sortType);
		Specification<Landport> spec = buildSpecification(userId, searchParams);

		return landportDao.findAll(spec, pageRequest);
	}

	/**
	 * 创建分页请求.
	 */
	private PageRequest buildPageRequest(int pageNumber, int pagzSize, String sortType) {
		Sort sort = null;
		if ("auto".equals(sortType)) {
			sort = new Sort(Direction.DESC, "id");
		} else if ("title".equals(sortType)) {
			sort = new Sort(Direction.ASC, "title");
		}

		return new PageRequest(pageNumber - 1, pagzSize, sort);
	}

	/**
	 * 创建动态查询条件组合.
	 */
	private Specification<Landport> buildSpecification(Long userId, Map<String, Object> searchParams) {
		Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
		filters.put("user.id", new SearchFilter("user.id", Operator.EQ, userId));
		Specification<Landport> spec = DynamicSpecifications.bySearchFilter(filters.values(), Landport.class);
		return spec;
	}

	@Autowired
	public void setLandportDao(LandportDao landportDao) {
		this.landportDao = landportDao;
	}
}

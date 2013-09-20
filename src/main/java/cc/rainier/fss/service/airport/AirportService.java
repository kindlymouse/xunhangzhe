package cc.rainier.fss.service.airport;

import cc.rainier.fss.entity.Airport;
import cc.rainier.fss.repository.AirportDao;
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
public class AirportService {

	private AirportDao airportDao;

	public Airport getAirport(Long id) {
		return airportDao.findOne(id);
	}

	public void saveAirport(Airport entity) {
		airportDao.save(entity);
	}

	public void deleteAirport(Long id) {
		airportDao.delete(id);
	}

	public List<Airport> getAllAirport() {
		return (List<Airport>) airportDao.findAll();
	}

	public Page<Airport> getUserAirport(Long userId, Map<String, Object> searchParams, int pageNumber, int pageSize,
			String sortType) {
		PageRequest pageRequest = buildPageRequest(pageNumber, pageSize, sortType);
		Specification<Airport> spec = buildSpecification(userId, searchParams);

		return airportDao.findAll(spec, pageRequest);
	}

	/**
	 * 创建分页请求.
	 */
	private PageRequest buildPageRequest(int pageNumber, int pagzSize, String sortType) {
		Sort sort = null;
		if ("auto".equals(sortType)) {
			sort = new Sort(Direction.DESC, "id");
		} else {
			sort = new Sort(Direction.ASC, sortType);
		}

		return new PageRequest(pageNumber - 1, pagzSize, sort);
	}

	/**
	 * 创建动态查询条件组合.
	 */
	private Specification<Airport> buildSpecification(Long userId, Map<String, Object> searchParams) {
        if ( searchParams == null ) return null;
		Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
		if(userId!=null && userId!=0){
            filters.put("sysFillUser.id", new SearchFilter("sysFillUser.id", Operator.EQ, userId));
        }
		Specification<Airport> spec = DynamicSpecifications.bySearchFilter(filters.values(), Airport.class);
		return spec;
	}

	@Autowired
	public void setAirportDao(AirportDao airportDao) {
		this.airportDao = airportDao;
	}
}

package cc.rainier.fss.service.social;

import cc.rainier.fss.entity.Attach;
import cc.rainier.fss.repository.AttachDao;
import cc.rainier.fss.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
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
public class AttachService extends BaseService {

	private AttachDao attachDao;

	public Attach getAttach(Long id) {
		return attachDao.findOne(id);
	}

	public void saveAttach(Attach entity) {
		attachDao.save(entity);
	}

	public void deleteAttach(Long id) {
		attachDao.delete(id);
	}

	public List<Attach> getAllAttach() {
		return (List<Attach>) attachDao.findAll();
	}

	public Page<Attach> getUserAttach(Long userId, Map<String, Object> searchParams, int pageNumber, int pageSize,
			String sortType) {
		PageRequest pageRequest = buildPageRequest(pageNumber, pageSize, sortType);
		Specification<Attach> spec = buildSpecification(userId, searchParams);

		return attachDao.findAll(spec, pageRequest);
	}

    /**
     * 创建动态查询条件组合.
     */
    protected Specification<Attach> buildSpecification(Long userId, Map<String, Object> searchParams) {
        if ( searchParams == null ) return null;
        Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
        if(userId !=null && userId > 0) {
            filters.put("user.id", new SearchFilter("user.id", Operator.EQ, userId));
        }
        Specification<Attach> spec = DynamicSpecifications.bySearchFilter(filters.values(), Attach.class);
        return spec;
    }
    @Autowired
	public void setAttachDao(AttachDao attachDao) {
		this.attachDao = attachDao;
	}
}

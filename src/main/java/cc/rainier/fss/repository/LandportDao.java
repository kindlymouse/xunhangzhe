package cc.rainier.fss.repository;

import cc.rainier.fss.entity.Landport;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * Created with IntelliJ IDEA.
 * User: zzyang
 * Date: 13-8-10
 * Time: 下午6:08
 */
public interface LandportDao extends PagingAndSortingRepository<Landport, Long>,JpaSpecificationExecutor<Landport> {
    Page<Landport> findBySysFillUserId(Long id, Pageable pageRequest);
}

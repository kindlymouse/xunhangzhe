package cc.rainier.fss.repository;

import cc.rainier.fss.entity.Attach;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface AttachDao extends PagingAndSortingRepository<Attach, Long>, JpaSpecificationExecutor<Attach> {
	Page<Attach> findByUserId(Long id, Pageable pageRequest);
}

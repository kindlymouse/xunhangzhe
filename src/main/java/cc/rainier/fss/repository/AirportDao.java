package cc.rainier.fss.repository;

import cc.rainier.fss.entity.Airport;
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
public interface AirportDao extends PagingAndSortingRepository<Airport, Long>,JpaSpecificationExecutor<Airport> {
    Page<Airport> findBySysFillUserId(Long id, Pageable pageRequest);

}

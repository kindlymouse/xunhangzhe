package cc.rainier.fss.repository;

import org.springframework.data.repository.PagingAndSortingRepository;
import cc.rainier.fss.entity.User;

public interface UserDao extends PagingAndSortingRepository<User, Long> {
	User findByLoginName(String loginName);
}

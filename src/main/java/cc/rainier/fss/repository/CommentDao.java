package cc.rainier.fss.repository;

import cc.rainier.fss.entity.Comment;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface CommentDao extends PagingAndSortingRepository<Comment, Long>, JpaSpecificationExecutor<Comment> {
	Page<Comment> findByUserId(Long id, Pageable pageRequest);
    Page<Comment> findByAttachId(Long id, Pageable pageRequest);
}

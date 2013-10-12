package cc.rainier.fss.service.social;

import cc.rainier.fss.entity.Comment;
import cc.rainier.fss.repository.CommentDao;
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
public class CommentService extends BaseService {

	private CommentDao commentDao;

	public Comment getComment(Long id) {
		return commentDao.findOne(id);
	}

	public void saveComment(Comment entity) {
        commentDao.save(entity);
	}

	public void deleteComment(Long id) {
        commentDao.delete(id);
	}

	public List<Comment> getAllComment() {
		return (List<Comment>) commentDao.findAll();
	}

    /**
     * 获取指定附件的评论
     * @param attachId
     * @param searchParams
     * @param pageNumber
     * @param pageSize
     * @param sortType
     * @return
     */
    public  Page<Comment> getAttachComment(Long attachId, Map<String, Object> searchParams, int pageNumber, int pageSize,
            String sortType) {
        PageRequest pageRequest = buildPageRequest(pageNumber, pageSize, sortType);
        Specification<Comment> spec = buildSpecification4Attach(attachId, searchParams);

        return commentDao.findAll(spec, pageRequest);
    }

    /**
     * 获取指定用户发表的评论
     * @param userId
     * @param searchParams
     * @param pageNumber
     * @param pageSize
     * @param sortType
     * @return
     */
	public Page<Comment> getUserComment(Long userId, Map<String, Object> searchParams, int pageNumber, int pageSize,
			String sortType) {
		PageRequest pageRequest = buildPageRequest(pageNumber, pageSize, sortType);
		Specification<Comment> spec = buildSpecification(userId, searchParams);

		return commentDao.findAll(spec, pageRequest);
	}

    /**
     * 创建动态查询条件组合 for Attach.
     */
    protected Specification<Comment> buildSpecification4Attach(Long attachId, Map<String, Object> searchParams) {
        if ( searchParams == null ) return null;
        Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
        if(attachId !=null && attachId > 0) {
            filters.put("attach.id", new SearchFilter("attach.id", Operator.EQ, attachId));
        }
        Specification<Comment> spec = DynamicSpecifications.bySearchFilter(filters.values(), Comment.class);
        return spec;
    }

    /**
     * 创建动态查询条件组合.
     */
    protected Specification<Comment> buildSpecification(Long userId, Map<String, Object> searchParams) {
        if ( searchParams == null ) return null;
        Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
        if(userId !=null && userId > 0) {
            filters.put("user.id", new SearchFilter("user.id", Operator.EQ, userId));
        }
        Specification<Comment> spec = DynamicSpecifications.bySearchFilter(filters.values(), Comment.class);
        return spec;
    }
    @Autowired
	public void setCommentDao(CommentDao commentDao) {
		this.commentDao = commentDao;
	}
}

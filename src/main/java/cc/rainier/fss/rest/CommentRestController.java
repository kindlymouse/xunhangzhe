package cc.rainier.fss.rest;

import cc.rainier.fss.entity.Attach;
import cc.rainier.fss.entity.Comment;
import cc.rainier.fss.entity.User;
import cc.rainier.fss.service.social.AttachService;
import cc.rainier.fss.service.social.CommentService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

/**
 * Created with IntelliJ IDEA.
 * User: Alex Zhang
 * Date: 13-9-26
 * Time: 上午5:20
 */

@Controller
@RequestMapping(value = "/api/v1/comment")
public class CommentRestController extends BaseJsonpController{

    private static Logger logger = LoggerFactory.getLogger(CommentRestController.class);

    @Autowired
    private CommentService commentService;

    @RequestMapping(value = "attach/{id}" ,method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> get(@PathVariable("id") Long id,@RequestParam("page") String pageNum,@RequestParam("limit") String pageLimit,@RequestParam("callback") String callback) {
        Page<Comment> commentPage = commentService.getAttachComment(id,null,Integer.parseInt(pageNum),Integer.parseInt(pageLimit),"auto");
        if (commentPage == null) {
            logger.warn("Flight Plan with id {} not found", id);
            return new ResponseEntity(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity(getReturnByJson(callback,toJson(commentPage.getContent())), HttpStatus.OK);
    }

    @RequestMapping(value = "create", method = RequestMethod.GET)
    public ResponseEntity<?> comment(@RequestParam("params") String commentStr,@RequestParam("userId") String userId, @RequestParam("callback") String callback) {

        Map paramsMap = jsonToMap(commentStr);
        Comment comment = new Comment();
        comment.setAttach(new Attach(Long.valueOf((String)paramsMap.get("attachId"))));
        comment.setContent((String) paramsMap.get("content"));
        comment.setUser(new User(Long.valueOf(userId)));
        comment.setFlagDel(0);
        comment.setCtime(new Date());

        // 保存评论
        commentService.saveComment(comment);

        Long id = comment.getId();


        return new ResponseEntity(getReturnByJson(callback,"{sucess:'true', formId:"+ id +"}" ), HttpStatus.CREATED);
    }
}

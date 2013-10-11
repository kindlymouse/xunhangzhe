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
    private AttachService attachService;
    @Autowired
    private CommentService commentService;

     @RequestMapping(value = "comment", method = RequestMethod.POST)
    public ResponseEntity<?> comment(@RequestParam("params") String commentStr,@RequestParam("userId") String userId, @RequestParam("callback") String callback) {

        Map paramsMap = jsonToMap(commentStr);
        Comment comment = new Comment();
         comment.setAttach(new Attach(Long.valueOf((String)paramsMap.get("attachId"))));
        comment.setContent((String) paramsMap.get("content"));
         comment.setUser(new User(Long.valueOf(userId)));
         comment.setCtime(new Date());

        // 保存评论
        commentService.saveComment(comment);

        Long id = comment.getId();
        /**
         URI uri = uriBuilder.path("/api/v1/fpl/" + id).build().toUri();
         HttpHeaders headers = new HttpHeaders();
         headers.setLocation(uri);
         **/

        return new ResponseEntity(getReturnByJson(callback,"{sucess:'true', formId:"+ id +"}" ), HttpStatus.CREATED);
    }
}

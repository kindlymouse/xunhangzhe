package cc.rainier.fss.rest;

import cc.rainier.fss.entity.Attach;
import cc.rainier.fss.service.social.AttachService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/**
 * Created with IntelliJ IDEA.
 * User: Alex Zhang
 * Date: 13-9-26
 * Time: 上午5:20
 */

@Controller
@RequestMapping(value = "/api/v1/attach")
public class AttachRestController extends BaseJsonpController{

    private static Logger logger = LoggerFactory.getLogger(AttachRestController.class);

    @Autowired
    private AttachService attachService;


    /**
     * 获取Attach列表，支持分页
     * @param userId
     * @param pageNum
     * @return
     */
    @RequestMapping(value = "/user/{user_id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<String> queryFPL(@PathVariable("user_id") Long userId,@RequestParam("page") String pageNum,@RequestParam("limit") String pageLimit,@RequestParam("callback") String callback) {


        Page<Attach> attachPage = attachService.getUserAttach(userId,null,Integer.parseInt(pageNum),Integer.parseInt(pageLimit),"auto");
        if (attachPage == null || attachPage.getSize()==0) {
            logger.warn("Attach with user_id {} not found", userId);
            return null;
        }

        if(attachPage.getContent().size()==0){
            return new ResponseEntity(getReturnByJson(callback,"{'success' : true,'total' : 0,'data' : []}"),HttpStatus.OK);
        }
        return new ResponseEntity(getReturnByJson(callback,toJson(attachPage.getContent())),HttpStatus.OK);
    }

    /**
     * 通过Attach的ID获取单个实体
     * @param id
     * @return
     */
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<?> get(@PathVariable("id") Long id,@RequestParam("callback") String callback) {
        Attach attach = attachService.getAttach(id);
        if (attach == null) {
            logger.warn("Attach with id {} not found", id);
            return new ResponseEntity(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity(getReturnByJson(callback,toJson(attach)), HttpStatus.OK);
    }
}

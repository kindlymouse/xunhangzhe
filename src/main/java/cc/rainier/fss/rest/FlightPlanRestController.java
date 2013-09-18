package cc.rainier.fss.rest;

import cc.rainier.fss.entity.FlightPlan;
import cc.rainier.fss.entity.User;
import cc.rainier.fss.service.account.AccountService;
import cc.rainier.fss.service.fpl.FPLService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;
import org.springside.modules.beanvalidator.BeanValidators;
import org.springside.modules.mapper.JsonMapper;

import javax.validation.Validator;
import java.net.URI;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 飞行计划Flight Plan的Restful API的Controller.
 * User: Alex Zhang
 * Date: 13-8-10
 * Time: 下午8:27
 */
@Controller
@RequestMapping(value = "/api/v1/fpl")
public class FlightPlanRestController extends BaseJsonpController{

    private static Logger logger = LoggerFactory.getLogger(FlightPlanRestController.class);
    private static final int PAGE_SIZE = 7;

    @Autowired
    private FPLService fplService;

    @Autowired
    private AccountService accountService;

    @Autowired
    private Validator validator;

    /**
     * 通过用户ID获取Flight Plan列表，支持分页
     * @param userId
     * @param pageNum
     * @return
     */
    @RequestMapping(value = "/user/{user_id}/page/{pageNum}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<String> queryFPL(@PathVariable("user_id") Long userId,@PathVariable("pageNum") Long pageNum,@RequestParam("callback") String callback) {


        Page<FlightPlan> fplPage = fplService.getUserFPL(userId,null,pageNum.intValue(),PAGE_SIZE,"auto");
        if (fplPage == null || fplPage.getSize()==0) {
            logger.warn("FlightPlan with user_id {} not found", userId);
            return null;
        }

        return new ResponseEntity(getReturnByJson(callback,toJson(fplPage.getContent())),HttpStatus.OK);
    }

    /**
     * 通过Flight Plan的ID获取单个实体
     * @param id
     * @return
     */
    @RequestMapping(value = "/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<?> get(@PathVariable("id") Long id) {
        FlightPlan fpl = fplService.getFlightPlan(id);
        if (fpl == null) {
            logger.warn("Flight Plan with id {} not found", id);
            return new ResponseEntity(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity(fpl, HttpStatus.OK);
    }

    /**
     * 新增Flight Plan
     * @return
     */
    @RequestMapping(value = "/newPlan",method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<?> create(@RequestParam("params") String fplStr,@RequestParam("userId") String userId, @RequestParam("callback") String callback) {

        Map paramsMap = jsonToMap(fplStr);
        FlightPlan fpl = new FlightPlan();

        fpl.setAddressee((String) paramsMap.get("addressee"));
        fpl.setFilingTime((String) paramsMap.get("filingTime"));
        fpl.setOriginator((String) paramsMap.get("originator"));
        fpl.setAircraftIdentification((String) paramsMap.get("aircraftIdentification"));
        fpl.setFlightRules((String) paramsMap.get("flightRules"));
        fpl.setTypeOfFlight((String) paramsMap.get("typeOfFlight"));
        fpl.setFlightNumber((Integer) paramsMap.get("flightNumber"));
        fpl.setTypeOfAircraft((String) paramsMap.get("typeOfAircraft"));
        fpl.setWakeTurbulenceCat((String) paramsMap.get("wakeTurbulenceCat"));
        fpl.setEquipment(paramsMap.get("equipment_first")+"/"+paramsMap.get("equipment_last"));
        fpl.setDepartureAerodrome((String) paramsMap.get("departureAerodrome"));
        fpl.setDepartureTime((String) paramsMap.get("departureTime"));
        fpl.setCruisingSpeed((String) paramsMap.get("cruisingSpeed"));
        fpl.setFlightLevel((String) paramsMap.get("flightLevel"));
        fpl.setRoute((String) paramsMap.get("route"));

        fpl.setDestinationAerodrome((String) paramsMap.get("destinationAerodrome"));
        fpl.setTotalEet((String) paramsMap.get("totalEet"));
        fpl.setAltnAerodrome((String) paramsMap.get("altnAerodrome"));
        fpl.setAltn2rdAerodrome((String) paramsMap.get("altn2rdAerodrome"));
        fpl.setOtherInformation((String) paramsMap.get("otherInformation"));

        fpl.setSysFillUser(accountService.findUserByLoginName(userId));
        fpl.setSysFillTime(new Date());

        //调用JSR303 Bean Validator进行校验, 异常将由RestExceptionHandler统一处理.
        BeanValidators.validateWithException(validator, fpl);

        // 保存任务
        fplService.saveFlightPlan(fpl);

        // 按照Restful风格约定，创建指向新任务的url, 也可以直接返回id或对象.

        Long id = fpl.getId();
        /**
        URI uri = uriBuilder.path("/api/v1/fpl/" + id).build().toUri();
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(uri);
        **/

        return new ResponseEntity(getReturnByJson(callback,"{sucess:'true', formId:"+ id +"}" ), HttpStatus.CREATED);
    }
}

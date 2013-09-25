package cc.rainier.fss.rest;

import cc.rainier.fss.entity.Airport;
import cc.rainier.fss.entity.Brief;
import cc.rainier.fss.service.airport.AirportService;
import cc.rainier.fss.service.brief.BriefService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 飞行计划Flight Plan的Restful API的Controller.
 * User: Alex Zhang
 * Date: 13-8-10
 * Time: 下午8:27
 */
@Controller
@RequestMapping(value = "/api/v1/station")
public class StationRestController extends BaseJsonpController{

    private static Logger logger = LoggerFactory.getLogger(StationRestController.class);

    @Autowired
    private AirportService airportService;

    @Autowired
    private BriefService briefService;

    /**
     * 通过用户ID获取Flight Plan列表，支持分页
     * @param userId
     * @return
     */
    @RequestMapping(value = "/user/{user_id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<String> queryFPL(@PathVariable("user_id") Long userId,@RequestParam("page") String pageNum,@RequestParam("limit") String pageLimit,@RequestParam("callback") String callback) {


        List<Airport> airports = airportService.getAllAirport();
        if (airports == null || airports.size()==0) {
            logger.warn("Airport with user_id {} not found", userId);
            return null;
        }

        if(airports.size()==0){
            return new ResponseEntity(getReturnByJson(callback,"{'success' : true,'total' : 0,'data' : []}"),HttpStatus.OK);
        }

        return new ResponseEntity(getReturnByJson(callback,toJson(airports)),HttpStatus.OK);
    }

    /**
     * 通过Flight Plan的ID获取单个实体
     * @param id
     * @return
     */
    @RequestMapping(value = "/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<String> get(@PathVariable("id") Long id,@RequestParam("callback") String callback) {
        Airport airport = airportService.getAirport(id);
        if (airport == null) {
            logger.warn("Airport with id {} not found", id);
            return new ResponseEntity(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity(getReturnByJson(callback,toJson(airport)), HttpStatus.OK);
    }

    @RequestMapping(value = "weather/{id}", method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<String> getWeather(@PathVariable("id") Long id,@RequestParam("callback") String callback){
        DateFormat df = new SimpleDateFormat("M-d");
        DateFormat dfh = new SimpleDateFormat("HH:00");
        Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        String jsonStr = "";
        cal.add(Calendar.DAY_OF_MONTH,-3);
        jsonStr += "{'date':'"+df.format(cal.getTime())+"','weather':'duoyun', 'temp': '32.3℃', 'windspeed': '2.4m/s', 'winddir': 'NW'},";
        cal.add(Calendar.DAY_OF_MONTH,1);
        jsonStr += "{'date':'"+df.format(cal.getTime())+"','weather':'yu', 'temp': '36℃', 'windspeed': '3.4m/s', 'winddir': 'NNW'},";
        cal.add(Calendar.DAY_OF_MONTH,1);
        jsonStr += "{'date':'"+df.format(cal.getTime())+"','weather':'yu', 'temp': '32.3℃', 'windspeed': '2.4m/s', 'winddir': 'NW'},";
        cal.add(Calendar.DAY_OF_MONTH,1);
        cal.add(Calendar.HOUR_OF_DAY,-2);
        jsonStr += "{'date':'"+dfh.format(cal.getTime())+"','weather':'qing', 'temp': '36℃', 'windspeed': '3.4m/s', 'winddir': 'NNW'},";
        cal.add(Calendar.HOUR_OF_DAY,2);
        jsonStr += "{'date':'"+dfh.format(cal.getTime())+"','weather':'qing', 'temp': '32.3℃', 'windspeed': '4.4m/s', 'winddir': 'NE'},";
        cal.add(Calendar.HOUR_OF_DAY,2);
        jsonStr += "{'date':'"+dfh.format(cal.getTime())+"','weather':'qing', 'temp': '35.3℃', 'windspeed': '1.4m/s', 'winddir': 'SE' },";
        cal.add(Calendar.DAY_OF_MONTH,1);
        jsonStr += "{'date':'"+df.format(cal.getTime())+"','weather':'duoyun', 'temp': '32.3℃', 'windspeed': '2.4m/s', 'winddir': 'NW'},";
        cal.add(Calendar.DAY_OF_MONTH,1);
        jsonStr += "{'date':'"+df.format(cal.getTime())+"','weather':'yu', 'temp': '32.3℃', 'windspeed': '2.4m/s', 'winddir': 'NW'}";

        return new ResponseEntity(getReturnByJson(callback,"["+jsonStr+"]"), HttpStatus.OK);
    }

    @RequestMapping(value = "brief/{id}", method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<String> getBrief(@PathVariable("id") Long airportId,@RequestParam("page") String pageNum,@RequestParam("limit") String pageLimit,@RequestParam("callback") String callback){

        //Map<String, Object> searchParams =  new HashMap<String, Object>();
        //searchParams.put("EQ_airport_id",airportId.toString());
        Page<Brief> BriefPage = briefService.getPageBrief(null, Integer.parseInt(pageNum),Integer.parseInt(pageLimit), "auto");
        if (BriefPage == null || BriefPage.getSize()==0) {
            logger.warn("Airport with user_id {} not found", airportId);
            return null;
        }

        if(BriefPage.getContent().size()==0){
            return new ResponseEntity(getReturnByJson(callback,"{'success' : true,'total' : 0,'data' : []}"),HttpStatus.OK);
        }

        return new ResponseEntity(getReturnByJson(callback,toJson(BriefPage.getContent())),HttpStatus.OK);

    }
}

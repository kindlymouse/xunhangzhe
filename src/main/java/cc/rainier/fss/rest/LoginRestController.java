package cc.rainier.fss.rest;

import cc.rainier.fss.entity.User;
import cc.rainier.fss.service.account.AccountService;
import cc.rainier.fss.service.account.ShiroDbRealm;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.util.ByteSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springside.modules.utils.Encodes;


/**
 * Created with IntelliJ IDEA.
 * User: Alex Zhang
 * Date: 13-9-12
 * Time: 下午2:30
 */
@Controller
@RequestMapping(value = "/api/v1/login")
public class LoginRestController extends BaseJsonpController{
    private static Logger logger = LoggerFactory.getLogger(LoginRestController.class);

    @Autowired
    private AccountService accountService;

    @RequestMapping(method = RequestMethod.GET)
    @ResponseBody
    public String login(@RequestParam("userId") String userId,@RequestParam("password") String password,@RequestParam("callback") String callback) {

        logger.debug("Login From API");
        User user = accountService.findUserByLoginName(userId);
        return getReturnByJson(callback,"{result:'sucess', userId:'"+ user.getLoginName() +"', userName:'"+user.getName()+"', userCode: '"+user.getId()+"'}" );
    }

    @RequestMapping(value = "test",method = RequestMethod.GET)
    @ResponseBody
    public String test(@RequestParam("callback") String callback) {

        logger.debug("Login From API");

        return getReturnByJson(callback,"[{'id':4,'addressee':'HFS HSHF9918','filingTime':'0323','originator':null,'aircraftIdentification':null,'flightRules':null,'typeOfFlight':null,'flightNumber':null,'typeOfAircraft':null,'wakeTurbulenceCat':null,'equipment':null,'departureAerodrome':null,'departureTime':null,'cruisingSpeed':null,'flightLevel':null,'route':null,'destinationAerodrome':null,'totalEet':null,'altnAerodrome':null,'altn2rdAerodrome':null,'otherInformation':null,'endurance':null,'personsOnBoard':null,'emergencyRadio':null,'survivalEquipment':null,'survivalJackets':null,'dingiesNumber':null,'dingiesCapacity':null,'dingiesCover':null,'dingiesColour':null,'aircraftColourAndMarkings':null,'remarks':null,'pilotInCommand':null,'filedBy':null,'telephone':null,'sysFillUser':{'id':1,'loginName':'admin','name':'Admin','password':'691b14d79bf0fa2215f155235df5e670b64394cc','salt':'7efbd59d9741d34f','roles':'admin','registerDate':'2012-06-04 01:00:00'},'sysFillTime':'2013-08-12 10:52:10','auditStatus':'YES','auditNote':'#4','auditTime':'2013-08-22 20:28:52'},{'id':6,'addressee':'HFS HSHF6251','filingTime':'0323','originator':null,'aircraftIdentification':null,'flightRules':null,'typeOfFlight':null,'flightNumber':null,'typeOfAircraft':null,'wakeTurbulenceCat':null,'equipment':null,'departureAerodrome':null,'departureTime':null,'cruisingSpeed':null,'flightLevel':null,'route':null,'destinationAerodrome':null,'totalEet':null,'altnAerodrome':null,'altn2rdAerodrome':null,'otherInformation':null,'endurance':null,'personsOnBoard':null,'emergencyRadio':null,'survivalEquipment':null,'survivalJackets':null,'dingiesNumber':null,'dingiesCapacity':null,'dingiesCover':null,'dingiesColour':null,'aircraftColourAndMarkings':null,'remarks':null,'pilotInCommand':null,'filedBy':null,'telephone':null,'sysFillUser':{'id':1,'loginName':'admin','name':'Admin','password':'691b14d79bf0fa2215f155235df5e670b64394cc','salt':'7efbd59d9741d34f','roles':'admin','registerDate':'2012-06-04 01:00:00'},'sysFillTime':'2013-08-12 10:53:17','auditStatus':'NO','auditNote':'#44','auditTime':'2013-08-22 20:28:55'}]" );
    }
}

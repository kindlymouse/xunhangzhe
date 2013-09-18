package cc.rainier.fss.rest;

import org.springside.modules.mapper.JsonMapper;

import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: Alex Zhang
 * Date: 13-9-14
 * Time: 上午11:36
 */
public class BaseJsonpController {

    private static JsonMapper jsonMapper = new JsonMapper();

    protected String getReturnByJson( String callback, String json ) {
        return callback + "(" + json + ")";
    }

    protected String toJson(Object object){
        return jsonMapper.toJson(object);
    }

    protected Map jsonToMap(String jsonStr){
        return jsonMapper.fromJson(jsonStr, Map.class);
    }
}

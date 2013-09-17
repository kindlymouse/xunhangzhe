package cc.rainier.fss.entity;

/**
 * Created with IntelliJ IDEA.
 * User: zzyang
 * Date: 13-9-12
 * Time: 下午4:59
 * To change this template use File | Settings | File Templates.
 */

public class Landport extends Airport {
    private String type;
    public String getType(){
        return "L";
    }

    public void setType(String type){
        this.type = type;
    }
}

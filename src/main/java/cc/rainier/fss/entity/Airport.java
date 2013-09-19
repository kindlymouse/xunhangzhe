package cc.rainier.fss.entity;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.sql.Timestamp;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: zzyang
 * Date: 13-9-12
 * Time: 下午4:59
 * To change this template use File | Settings | File Templates.
 */
@javax.persistence.Table(name = "fs_airport")
@Entity
public class Airport extends IdEntity {
    private String type;
    private String code;
    private String name;
    private String owner;
    private String address;
    private String telephone;
    private String fax;
    private String postcode;
    private String longitude;
    private String latitude;
    private String altitude;
    private String magneticVariation;
    private Integer baseTemperature;
    private String maxModel;
    private String airportUse;
    private String airfieldLevel;
    private String sizeOfLiftingBelt;
    private String stopway;
    private String clearway;
    private String sizeOfResa;
    private String sizeOfBlastPad;
    private String runwaySize;
    private String runwayId;
    private String runwayDirection;
    private String runwayPcn;
    private String runwayShoulder;
    private String runwayGradient;
    private String runwayCrossfall;
    private String runwayTaxi;
    private String runwayFly;
    private String runwaySpeedup;
    private String runwayLand;
    private String taxiwaySize;
    private String taxiwayPcn;
    private String taxiwayShoulder;
    private String rampSize;
    private String rampPcn;
    private String rampCode;
    private String navaidSymbol;
    private String navaidLamp;
    private String deviceWeather;
    private String deviceSafety;
    private String roadblock;
    private Integer attachId;
    private String attachName;
    private String attachPath;
    private User sysFillUser;
    private Date sysFillTime;



    public String getType() {
        return this.type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

   public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

     public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

      public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

     public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

     public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

     public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    public String getAltitude() {
        return altitude;
    }

    public void setAltitude(String altitude) {
        this.altitude = altitude;
    }

    public String getMagneticVariation() {
        return magneticVariation;
    }

    public void setMagneticVariation(String magneticVariation) {
        this.magneticVariation = magneticVariation;
    }

    public Integer getBaseTemperature() {
        return baseTemperature;
    }

    public void setBaseTemperature(Integer baseTemperature) {
        this.baseTemperature = baseTemperature;
    }

    public String getMaxModel() {
        return maxModel;
    }

    public void setMaxModel(String maxModel) {
        this.maxModel = maxModel;
    }

    public String getAirportUse() {
        return airportUse;
    }

    public void setAirportUse(String airportUse) {
        this.airportUse = airportUse;
    }

    public String getAirfieldLevel() {
        return airfieldLevel;
    }

    public void setAirfieldLevel(String airfieldLevel) {
        this.airfieldLevel = airfieldLevel;
    }

    public String getSizeOfLiftingBelt() {
        return sizeOfLiftingBelt;
    }

    public void setSizeOfLiftingBelt(String sizeOfLiftingBelt) {
        this.sizeOfLiftingBelt = sizeOfLiftingBelt;
    }

    public String getStopway() {
        return stopway;
    }

    public void setStopway(String stopway) {
        this.stopway = stopway;
    }

    public String getClearway() {
        return clearway;
    }

    public void setClearway(String clearway) {
        this.clearway = clearway;
    }

    public String getSizeOfResa() {
        return sizeOfResa;
    }

    public void setSizeOfResa(String sizeOfResa) {
        this.sizeOfResa = sizeOfResa;
    }

    public String getSizeOfBlastPad() {
        return sizeOfBlastPad;
    }

    public void setSizeOfBlastPad(String sizeOfBlastPad) {
        this.sizeOfBlastPad = sizeOfBlastPad;
    }

    public String getRunwaySize() {
        return runwaySize;
    }

    public void setRunwaySize(String runwaySize) {
        this.runwaySize = runwaySize;
    }

    public String getRunwayId() {
        return runwayId;
    }

    public void setRunwayId(String runwayId) {
        this.runwayId = runwayId;
    }

    public String getRunwayDirection() {
        return runwayDirection;
    }

    public void setRunwayDirection(String runwayDirection) {
        this.runwayDirection = runwayDirection;
    }

    public String getRunwayPcn() {
        return runwayPcn;
    }

    public void setRunwayPcn(String runwayPcn) {
        this.runwayPcn = runwayPcn;
    }

    public String getRunwayShoulder() {
        return runwayShoulder;
    }

    public void setRunwayShoulder(String runwayShoulder) {
        this.runwayShoulder = runwayShoulder;
    }

    public String getRunwayGradient() {
        return runwayGradient;
    }

    public void setRunwayGradient(String runwayGradient) {
        this.runwayGradient = runwayGradient;
    }

    public String getRunwayCrossfall() {
        return runwayCrossfall;
    }

    public void setRunwayCrossfall(String runwayCrossfall) {
        this.runwayCrossfall = runwayCrossfall;
    }

    public String getRunwayTaxi() {
        return runwayTaxi;
    }

    public void setRunwayTaxi(String runwayTaxi) {
        this.runwayTaxi = runwayTaxi;
    }

    public String getRunwayFly() {
        return runwayFly;
    }

    public void setRunwayFly(String runwayFly) {
        this.runwayFly = runwayFly;
    }

    public String getRunwaySpeedup() {
        return runwaySpeedup;
    }

    public void setRunwaySpeedup(String runwaySpeedup) {
        this.runwaySpeedup = runwaySpeedup;
    }

    public String getRunwayLand() {
        return runwayLand;
    }

    public void setRunwayLand(String runwayLand) {
        this.runwayLand = runwayLand;
    }

    public String getTaxiwaySize() {
        return taxiwaySize;
    }

    public void setTaxiwaySize(String taxiwaySize) {
        this.taxiwaySize = taxiwaySize;
    }

    public String getTaxiwayPcn() {
        return taxiwayPcn;
    }

    public void setTaxiwayPcn(String taxiwayPcn) {
        this.taxiwayPcn = taxiwayPcn;
    }

    public String getTaxiwayShoulder() {
        return taxiwayShoulder;
    }

    public void setTaxiwayShoulder(String taxiwayShoulder) {
        this.taxiwayShoulder = taxiwayShoulder;
    }

    public String getRampSize() {
        return rampSize;
    }

    public void setRampSize(String rampSize) {
        this.rampSize = rampSize;
    }


    public String getRampPcn() {
        return rampPcn;
    }

    public void setRampPcn(String rampPcn) {
        this.rampPcn = rampPcn;
    }

    public String getRampCode() {
        return rampCode;
    }

    public void setRampCode(String rampCode) {
        this.rampCode = rampCode;
    }

    public String getNavaidSymbol() {
        return navaidSymbol;
    }

    public void setNavaidSymbol(String navaidSymbol) {
        this.navaidSymbol = navaidSymbol;
    }


    public String getNavaidLamp() {
        return navaidLamp;
    }

    public void setNavaidLamp(String navaidLamp) {
        this.navaidLamp = navaidLamp;
    }


    public String getDeviceWeather() {
        return deviceWeather;
    }

    public void setDeviceWeather(String deviceWeather) {
        this.deviceWeather = deviceWeather;
    }


    public String getDeviceSafety() {
        return deviceSafety;
    }

    public void setDeviceSafety(String deviceSafety) {
        this.deviceSafety = deviceSafety;
    }


    public String getRoadblock() {
        return roadblock;
    }

    public void setRoadblock(String roadblock) {
        this.roadblock = roadblock;
    }


    public Integer getAttachId() {
        return attachId;
    }

    public void setAttachId(Integer attachId) {
        this.attachId = attachId;
    }


    public String getAttachName() {
        return attachName;
    }

    public void setAttachName(String attachName) {
        this.attachName = attachName;
    }


    public String getAttachPath() {
        return attachPath;
    }

    public void setAttachPath(String attachPath) {
        this.attachPath = attachPath;
    }

    @ManyToOne
    @JoinColumn(name = "sys_fill_user_id")
    public User getSysFillUser() {
        return sysFillUser;
    }

    public void setSysFillUser(User sysFillUser) {
        this.sysFillUser = sysFillUser;
    }


    public Date getSysFillTime() {
        return sysFillTime;
    }

    public void setSysFillTime(Date sysFillTime) {
        this.sysFillTime = sysFillTime;
    }
}

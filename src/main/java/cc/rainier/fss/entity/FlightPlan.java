package cc.rainier.fss.entity;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Created with IntelliJ IDEA.
 * User: Alex Zhang
 * Date: 13-8-10
 * Time: 下午5:37
 */
@Entity
@Table(name = "fs_flight_plan")
public class FlightPlan extends IdEntity{

    private String addressee;
    private String filingTime;
    private String originator;
    private String aircraftIdentification;
    private String flightRules;
    private String typeOfFlight;
    private Integer flightNumber;
    private String typeOfAircraft;
    private String wakeTurbulenceCat;
    private String equipment;
    private String departureAerodrome;
    private String departureTime;
    private String cruisingSpeed;
    private String flightLevel;
    private String route;
    private String destinationAerodrome;
    private String totalEet;
    private String altnAerodrome;
    private String altn2rdAerodrome;
    private String otherInformation;
    private String endurance;
    private Integer personsOnBoard;
    private String emergencyRadio;
    private String survivalEquipment;
    private String survivalJackets;
    private Integer dingiesNumber;
    private Integer dingiesCapacity;
    private String dingiesCover;
    private String dingiesColour;
    private String aircraftColourAndMarkings;
    private String remarks;
    private String pilotInCommand;
    private String filedBy;
    private String telephone;
    private User sysFillUser;
    private Date sysFillTime;

    public FlightPlan(){
    }

    public FlightPlan(Long id){
        this.id = id;
    }

    @NotBlank
    public String getAddressee() {
        return addressee;
    }

    public void setAddressee(String addressee) {
        this.addressee = addressee;
    }

    @NotBlank
    public String getFilingTime() {
        return filingTime;
    }

    public void setFilingTime(String filingTime) {
        this.filingTime = filingTime;
    }

    public String getOriginator() {
        return originator;
    }

    public void setOriginator(String originator) {
        this.originator = originator;
    }

    public String getAircraftIdentification() {
        return aircraftIdentification;
    }

    public void setAircraftIdentification(String aircraftIdentification) {
        this.aircraftIdentification = aircraftIdentification;
    }

    public String getFlightRules() {
        return flightRules;
    }

    public void setFlightRules(String flightRules) {
        this.flightRules = flightRules;
    }

    public String getTypeOfFlight() {
        return typeOfFlight;
    }

    public void setTypeOfFlight(String typeOfFlight) {
        this.typeOfFlight = typeOfFlight;
    }

    public Integer getFlightNumber() {
        return flightNumber;
    }

    public void setFlightNumber(Integer flightNumber) {
        this.flightNumber = flightNumber;
    }

    public String getTypeOfAircraft() {
        return typeOfAircraft;
    }

    public void setTypeOfAircraft(String typeOfAircraft) {
        this.typeOfAircraft = typeOfAircraft;
    }

    public String getWakeTurbulenceCat() {
        return wakeTurbulenceCat;
    }

    public void setWakeTurbulenceCat(String wakeTurbulenceCat) {
        this.wakeTurbulenceCat = wakeTurbulenceCat;
    }

    public String getEquipment() {
        return equipment;
    }

    public void setEquipment(String equipment) {
        this.equipment = equipment;
    }

    public String getDepartureAerodrome() {
        return departureAerodrome;
    }

    public void setDepartureAerodrome(String departureAerodrome) {
        this.departureAerodrome = departureAerodrome;
    }

    public String getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(String departureTime) {
        this.departureTime = departureTime;
    }

    public String getCruisingSpeed() {
        return cruisingSpeed;
    }

    public void setCruisingSpeed(String cruisingSpeed) {
        this.cruisingSpeed = cruisingSpeed;
    }

    public String getFlightLevel() {
        return flightLevel;
    }

    public void setFlightLevel(String flightLevel) {
        this.flightLevel = flightLevel;
    }

    public String getRoute() {
        return route;
    }

    public void setRoute(String route) {
        this.route = route;
    }

    public String getDestinationAerodrome() {
        return destinationAerodrome;
    }

    public void setDestinationAerodrome(String destinationAerodrome) {
        this.destinationAerodrome = destinationAerodrome;
    }

    public String getTotalEet() {
        return totalEet;
    }

    public void setTotalEet(String totalEet) {
        this.totalEet = totalEet;
    }

    public String getAltnAerodrome() {
        return altnAerodrome;
    }

    public void setAltnAerodrome(String altnAerodrome) {
        this.altnAerodrome = altnAerodrome;
    }

    public String getAltn2rdAerodrome() {
        return altn2rdAerodrome;
    }

    public void setAltn2rdAerodrome(String altn2rdAerodrome) {
        this.altn2rdAerodrome = altn2rdAerodrome;
    }

    public String getOtherInformation() {
        return otherInformation;
    }

    public void setOtherInformation(String otherInformation) {
        this.otherInformation = otherInformation;
    }

    public String getEndurance() {
        return endurance;
    }

    public void setEndurance(String endurance) {
        this.endurance = endurance;
    }

    public Integer getPersonsOnBoard() {
        return personsOnBoard;
    }

    public void setPersonsOnBoard(Integer personsOnBoard) {
        this.personsOnBoard = personsOnBoard;
    }

    public String getEmergencyRadio() {
        return emergencyRadio;
    }

    public void setEmergencyRadio(String emergencyRadio) {
        this.emergencyRadio = emergencyRadio;
    }

    public String getSurvivalEquipment() {
        return survivalEquipment;
    }

    public void setSurvivalEquipment(String survivalEquipment) {
        this.survivalEquipment = survivalEquipment;
    }

    public String getSurvivalJackets() {
        return survivalJackets;
    }

    public void setSurvivalJackets(String survivalJackets) {
        this.survivalJackets = survivalJackets;
    }

    public Integer getDingiesNumber() {
        return dingiesNumber;
    }

    public void setDingiesNumber(Integer dingiesNumber) {
        this.dingiesNumber = dingiesNumber;
    }

    public Integer getDingiesCapacity() {
        return dingiesCapacity;
    }

    public void setDingiesCapacity(Integer dingiesCapacity) {
        this.dingiesCapacity = dingiesCapacity;
    }

    public String getDingiesCover() {
        return dingiesCover;
    }

    public void setDingiesCover(String dingiesCover) {
        this.dingiesCover = dingiesCover;
    }

    public String getDingiesColour() {
        return dingiesColour;
    }

    public void setDingiesColour(String dingiesColour) {
        this.dingiesColour = dingiesColour;
    }

    public String getAircraftColourAndMarkings() {
        return aircraftColourAndMarkings;
    }

    public void setAircraftColourAndMarkings(String aircraftColourAndMarkings) {
        this.aircraftColourAndMarkings = aircraftColourAndMarkings;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getPilotInCommand() {
        return pilotInCommand;
    }

    public void setPilotInCommand(String pilotInCommand) {
        this.pilotInCommand = pilotInCommand;
    }

    public String getFiledBy() {
        return filedBy;
    }

    public void setFiledBy(String filedBy) {
        this.filedBy = filedBy;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    @ManyToOne
    @JoinColumn(name = "sys_fill_user_id")
    public User getSysFillUser() {
        return sysFillUser;
    }

    public void setSysFillUser(User sysFillUser) {
        this.sysFillUser = sysFillUser;
    }

    // 设定JSON序列化时的日期格式
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+08:00")
    public Date getSysFillTime() {
        return sysFillTime;
    }

    public void setSysFillTime(Date sysFillTime) {
        this.sysFillTime = sysFillTime;
    }
}

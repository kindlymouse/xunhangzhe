<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>计划审核</title>
    <style>
        #pm{
            line-height:30px; font-size:18px;
        }
        #pm label{
            line-height:25px;
            font-weight:bold;
        }
        #pm .s_char{
            border:1px solid #000;
            height:30px;
            padding-left:8px;
            padding-right:8px;
            display: inline-block;
        }

        #pm span.s_char span{
            font-size:25px;
            letter-spacing: 3px;
            display: inline-block;
        }

        #pm .c_1{width:20px;}
        #pm .c_2{width:40px;}
        #pm .c_3{width:60px;}
        #pm .c_4{width:80px;}
        #pm .c_5{width:100px;}
        #pm .c_6{width:120px;}
        #pm .c_7{width:140px;}
        #pm .c_8{width:160px;}
        #pm .mt10{margin-top:10px;}
        #pm .ml10{margin-left:10px;}
        #pm .txt_r{text-align: right;}

    </style>
</head>

<body>
    <form id="inputForm" action="${ctx}/plan/audit" method="post" class="form-horizontal">
    <input type="hidden" name="id" value="${id}"/>
    <fieldset>
    <legend><small>计划审核</small></legend>
    <div id="pm" class="container" style="border:1px solid #000;width:980px;height:1650px;">
    <!-- plan header -->
    <div class="row-fluid">
        <div class="span12 text-center" style="border:1px solid #000;">
            <h3 style="margin-top:0px;margin-bottom:0px;">FIGHT PLAN</h3>
        </div>
    </div>
    <!-- plan group 1 -->
    <div class="row-fluid">
        <div class="span12">
            <div class="row-fluid mt10" style="">
                <div class="span2">
                    <div class="span2"></div>
                    <div class="span10">
                        <label class="plan_til_label">PRIORITY</label>
                        <div class="row-fluid">
                            << ≡ FF →
                        </div>
                    </div>
                </div>
                <div class="span10">
                    <div class="row-fluid">
                        <label class="plan_til_label">ADDRESSEE(S)</label>
                    </div>
                    <div class="row-fluid">
                        <div class="span12" style="height:90px;padding-left:5px;border-top:1px solid #000;border-bottom:1px solid #000;border-left:1px solid #000;">
                            <div style="float:left;">${plan.addressee}
                            This is a test.
                            This is a test.</div>
                            <div style="position:relative;float:right;top:60px;width:60px;display: inline;"><< ≡</div>
                        </div>
                    </div>
                </div>
            </div>
            <div style="clear:both;"></div>
            <div class="row-fluid mt10" style="padding-top:10px;height:80px;">
                <div class="span1"></div>
                <div class="span2">
                    <label class="plan_til_label">FILING TIME</label>
                    <div>
                        <span class="s_char"><span class="c_5">${plan.filingTime}</span></span>
                    </div>
                </div>
                <div class="span1">
                    <div>&nbsp;</div>
                    <div style="text-align: center;">→</div>
                </div>
                <div class="span3">
                    <label class="plan_til_label">ORIGINATOR</label>
                    <div>
                        <span class="s_char"><span class="c_8">${plan.originator}</span></span>
                    </div>
                </div>
                <div class="span1">
                    <label>&nbsp;</label>
                    <div><< ≡</div>
                </div>
                <div class="span4"></div>
            </div>
            <div class="row-fluid ">
                <h5 style="margin-left:15px;">SPECIFIC IDENTIFICATION OF ADDRESSEE(S) AND/OR ORIGINATOR</h5>
            </div>
        </div>
    </div>
    <div style="height:3px;background-color:#000;"></div>
    <!-- plan group 2 -->
    <div class="row-fluid">
        <div class="span12">
            <div class="row-fluid mt10">
                <div class="span3">
                    <label class="ml10">3 MESSAGE TYPE</label>
                    <div class="ml10">
                        <<≡(FPL
                    </div>
                </div>
                <div class="span3">
                    <label  class="plan_til_label">7 AIRCRAFT IDENTIFICATION</label>
                    <div>
                        - <span class="s_char"><span class="c_7">${plan.aircraftIdentification}</span>
                    </div>
                </div>
                <div class="span3">
                    <label  class="plan_til_label">8 FLIGHT RULES</label>
                    <div>
                        - <span class="s_char"><span class="c_1">${plan.flightRules}</span>
                    </div>
                </div>
                <div class="span2">
                    <label  class="plan_til_label">TYPE OF FLIGHT</label>
                    <div><span class="s_char"><span class="c_1">${plan.typeOfFlight}</span></div>
                </div>
                <div class="span1">
                    <label  class="plan_til_label"></label>
                    <div><<≡</div>
                </div>
            </div>
            <div class="row-fluid mt10">
                <div class="span2">
                    <label  class="ml10">9 NUMBER</label>
                    <div  class="ml10">
                        - <span class="s_char"><span class="c_2">${plan.flightNumber}</span></span>
                    </div>
                </div>
                <div class="span3">
                    <label  class="plan_til_label">TYPE OF AIRCARAFT</label>
                    <div>
                        <span class="s_char"><span class="c_4">${plan.typeOfAircraft}</span></span>
                    </div>
                </div>
                <div class="span3">
                    <label>WAKE TURBULENCE CAT</label>
                    <div>
                        / <span class="s_char"><span class="c_1">${plan.wakeTurbulenceCat}</span></span>
                    </div>
                </div>
                <div class="span3">
                    <label>10 EQUIPMENT</label>
                    <div>
                        - <span class="s_char"><span class="c_4">${plan.equipment}</span></span>
                    </div>
                </div>
                <div class="span1">
                    <label>&nbsp;</label>
                    <div><<≡</div>
                </div>
            </div>
            <div class="row-fluid mt10">
                <div class="span4">
                    <label  class="ml10">13 DEPARTURE AERODROME</label>
                    <div  class="ml10">
                        - <span class="s_char"><span class="c_4">${plan.departureAerodrome}</span></span>
                    </div>
                </div>
                <div class="span3">
                    <label>TIME</label>
                    <div><span class="s_char"><span class="c_4">${plan.departureTime}</span></span></div>
                </div>
                <div class="span1">
                    <label>&nbsp;</label>
                    <div><<≡</div>
                </div>
                <div class="span4"></div>
            </div>
            <div class="row-fluid mt10">
                <div class="span2">
                    <label  class="ml10">15 CRUISING SPEED</label>
                    <div  class="ml10">- <span class="s_char"><span class="c_5">${plan.cruisingSpeed}</span></span></div>
                </div>
                <div class="span2">
                    <label><br/>LEVEL</label>
                    <div><span class="s_char"><span class="c_5">${plan.flightLevel}</span></span></div>
                </div>
                <div class="span8">
                    <label><br/>ROUTE</label>
                    <div style="height:90px; border:1px solid #000;border-right:0px;">
                       ${plan.route}
                        <div style="position:relative;float:right;top:60px;width:60px;"><< ≡</div>
                    </div>
                </div>
            </div>
            <div class="row-fluid mt10">
                <div class="span3">
                    <label  class="ml10">16 DESTINATION <br/>AERODROME</label>
                    <div  class="ml10">- <span class="s_char"> <span class="c_4">${plan.destinationAerodrome}</span></span></div>
                </div>
                <div class="span2">
                    <label>TOTAL EET<br/>HR. MIN</label>
                    <div><span class="s_char"><span class="c_4"> ${plan.totalEet}</span></span></div>
                </div>
                <div class="span3">
                    <label><br/>ALTN AERODROME</label>
                    <div>-> <span class="s_char"> <span class="c_4">${plan.altnAerodrome}</span></span></div>
                </div>
                <div class="span3">
                    <label><br/>2ND ALTN AERODROME</label>
                    <div>-> <span class="s_char"><span class="c_4">${plan.altn2rdAerodrome}</span></span></div>
                </div>
                <div class="span1">
                    <label>&nbsp;<br/>&nbsp;</label>
                    <div><<≡</div>
                </div>
            </div>
            <div class="row-fluid mt10">
                <label  class="ml10">18 OTHER INFORMATION</label>
                <div  class="ml10" style="height:90px;border:1px solid #000;">
                   ${plan.otherInformation}
                    <div style="position:relative;float:right;top:60px;width:90px;">) <<≡</div>
                </div>
            </div>
        </div>
    </div>
    <div style="height:5px;background-color:#000;"></div>
    <!-- plan group 3 -->
    <div class="row-fluid">
        <div class="span12">
            <div class="row-fluid mt10" style="text-align: center">SUPPLEMENTARY INFORMATION (NOT TO BE TRANSMITTED IN FPL MESSAGES)</div>
            <div class="row-fluid mt10">
                <div class="span6">
                    <label class="ml10">19 ENDURANCE</label>
                    <div class="row-fluid">
                        <div class="span6">
                            <label class="ml10">HR MIN</label>
                            <div class="ml10">- E / <span class="s_char"><span class="c_4">${plan.endurance}</span></span></div>
                        </div>
                        <div class="span6">
                            <label>PERSONS ON BOARD</label>
                            <div>-> P / <span class="s_char"><span class="c_3">${plan.personsOnBoard}</span></span></div>
                        </div>
                    </div>
                </div>
                <div class="span6">
                    <label>EMERGENCY RADIO</label>
                    <div class="span4">
                        <label>UHF</label>
                        <div>-> R / <span class="s_char"><span class="c_1"><c:if test="${fn:contains(plan.emergencyRadio,'U')}">U</c:if> </span></span></div>
                    </div>
                    <div class="span4">
                        <label>VHF</label>
                        <div><span class="s_char"><span class="c_1"><c:if test="${fn:contains(plan.emergencyRadio,'V')}">V </c:if></span></span></div>
                    </div>
                    <div class="span3">
                        <label>ELT</label>
                        <div><span class="s_char"><span class="c_1"><c:if test="${fn:contains(plan.emergencyRadio,'E')}">E </c:if></span></span></div>
                    </div>
                </div>
            </div>
            <div class="row-fluid mt10">
                <div class="span2">
                    <label class="ml10">SURIVIVAL EQUIPMENT</label>
                    <div class="ml10">-> <span class="s_char">S</span></div>
                </div>
                <div class="span1">
                    <label><br/>POLAR</label>
                    <div>/ <span class="s_char"><span class="c_1"><c:if test="${fn:contains(plan.survivalEquipment,'P')}">P </c:if></span></span></div>
                </div>
                <div class="span1">
                    <label><br/>DESERT</label>
                    <div><span class="s_char"><span class="c_1"><c:if test="${fn:contains(plan.survivalEquipment,'D')}">D </c:if></span></span></div>
                </div>
                <div class="span1">
                    <label><br/>MARITIME</label>
                    <div><span class="s_char"><span class="c_1"><c:if test="${fn:contains(plan.survivalEquipment,'M')}">M </c:if></span></span></div>
                </div>
                <div class="span1">
                    <label><br/>JUNGLE</label>
                    <div><span class="s_char"><span class="c_1"><c:if test="${fn:contains(plan.survivalEquipment,'J')}">J </c:if></span></span></div>
                </div>
                <div class="span1">
                    <label><br/>JACKETS</label>
                    <div><span class="s_char"><span class="c_1">J</span></span></div>
                </div>
                <div class="span1">
                    <label><br/>LIGHT</label>
                    <div>/ <span class="s_char"><span class="c_1"><c:if test="${fn:contains(plan.survivalJackets,'L')}">L </c:if></span></span></div>
                </div>
                <div class="span1">
                    <label><br/>FLUORES</label>
                    <div><span class="s_char"><span class="c_1"><c:if test="${fn:contains(plan.survivalJackets,'F')}">F </c:if></span></span></div>
                </div>
                <div class="span1">
                    <label><br/>UHF</label>
                    <div><span class="s_char"><span class="c_1"><c:if test="${fn:contains(plan.survivalJackets,'U')}">U </c:if></span></span></div>
                </div>
                <div class="span1">
                    <label><br/>VHF</label>
                    <div><span class="s_char"><span class="c_1"><c:if test="${fn:contains(plan.survivalJackets,'V')}">V</c:if></span></span></div>
                </div>
                <div class="span1"></div>
            </div>
            <div class="row-fluid mt10">
                <div class="span2">
                    <label class="ml10">NUMBER</label>
                    <div class="ml10">
                        -> <span class="s_char"><span class="c_1">D</span></span>
                        / <span class="s_char"><span class="c_2"><fmt:formatNumber value="${plan.dingiesNumber}" pattern="##"/></span></span>
                    </div>
                </div>
                <div class="span2">
                    <label>CAPACITY</label>
                    <div> -> <span class="s_char"><span class="c_3">${plan.dingiesCapacity}</span></span></div>
                </div>
                <div class="span1">
                    <label>COVER</label>
                    <div> -> <span class="s_char"><span class="c_1">${plan.dingiesCover}</span></span></div>
                </div>
                <div class="span3">
                    <label>COLOUR</label>
                    <div> -><span class="s_char"><span class="c_9">${plan.dingiesColour}</span></span></div>
                </div>
                <div class="span1">
                    <label>&nbsp;</label>
                    <div> <<≡ </div>
                </div>
                <div class="span3"></div>
            </div>
            <div class="row-fluid mt10">
                <div class="span1">
                    <label>&nbsp;</label>
                    <div class="ml10 txt_r"> A/ </div>
                </div>
                <div class="span11">
                    <label>AIRCRAFT COLOUR AND MARKINGS</label>
                    <div class="s_char span12" style="margin-left:0px;"> ${plan.aircraftColourAndMarkings}</div>
                </div>
            </div>
            <div class="row-fluid mt10">
                <div class="span1">
                    <label>&nbsp;</label>
                    <div class="ml10 txt_r"> -> N /</div>
                </div>
                <div class="span10">
                    <label>REMARKS</label>
                    <div class="s_char span12" style="margin-left:0px;"> ${plan.remarks}</div>
                </div>
                <div class="span1">
                    <label>&nbsp;</label>
                    <div> <<≡ </div>
                </div>
            </div>
            <div class="row-fluid mt10">
                <div class="span1">
                    <label>&nbsp;</label>
                    <div class="ml10 txt_r"> C /</div>
                </div>
                <div class="span7">
                    <label>PILOT IN COMMAND</label>
                    <div class="s_char span12"  style="margin-left:0px;"> ${plan.pilotInCommand} </div>
                </div>
                <div class="span1">
                    <label>&nbsp;</label>
                    <div> ）<<≡ </div>
                </div>
                <div class="span3"></div>
            </div>

            <div class="row-fluid mt10">
                <div class="span5" style="font-size:16px;">FIELD BY</div>
                <div class="span7" style="font-size:16px;">SPACE RESERVED FOR ADDITIONAL REQUIREMENTS</div>
            </div>
            <div class="row-fluid" style="border-top:1px solid #000;border-bottom:1px solid #000;">
                <div class="span5">
                    ${plan.filedBy}
                </div>
                <div class="span7" style="border-left:1px solid #000;">
                    <div class="row-fluid">
                        <div class="span12" style="margin-left:5px;font-size:14px;">Please provide a telephone number so our operators can contact you if needed.</div>
                        <div class="span12" style="margin-left:5px;">${plan.telephone}</div>
                    </div>
                </div>

            </div>
        </div>

        <div style="clear:both;"></div>
        <!-- plan group 4 -->
        <div class="row-fluid mt10">
            <label class="span1 ml10">回复意见:</label>
            <div class="span6">
                <textarea name="auditNote" rows="4" style="width:96%;">${plan.auditNote}</textarea>
            </div>
            <div class="span2">
                <label class="radio ml10"><input type="radio" <c:if test="${plan.auditStatus=='YES'}">checked="checked"</c:if> name="auditStatus"  value="YES">Yes</label>
                <label class="radio ml10"><input type="radio"  <c:if test="${plan.auditStatus=='NO'}">checked="checked"</c:if>name="auditStatus"  value="NO">No</label>
            </div>
            <div class="span2">
                <br/>
                <input id="submit_btn" class="btn btn-primary" type="submit" value="提交"/>
                <input id="cancel_btn" class="btn" type="button" value="返回" onclick="history.back()"/>
            </div>
            <div class="span12" style="height:10px;"></div>
        </div>
    </div>
 </div>
    </fieldset>

    </form>

	
	<script>
		$(document).ready(function() {
			//聚焦第一个输入框
			//$("#name").focus();
			//为inputForm注册validate函数
			$("#inputForm").validate();
		});
	</script>
</body>
</html>

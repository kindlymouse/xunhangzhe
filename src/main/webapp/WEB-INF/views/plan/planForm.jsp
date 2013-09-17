<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            font-size:25px;
            letter-spacing: 2px;
            border:1px solid #000;
            padding-left:5px;
            padding-right:5px;
            height:30px;
        }

        #pm .c_1{
            width:30px;
        }
        #pm .c_2{
            width:50px;
        }
        #pm .c_3{
            width:70px;
        }

        #pm .mt10{
            margin-top:10px;
        }
        #pm .ml10{
            margin-left:10px;
        }
        #pm .txt_r{
            text-align: right;
        }

    </style>
</head>

<body>
    <form id="inputForm" action="${ctx}/plan/audit" method="post" class="form-horizontal">
    <input type="hidden" name="id" value="${id}"/>
    <fieldset>
    <legend><small>计划审核</small></legend>
    <div id="pm" class="container" style="border:1px solid #000;width:980px;height:1650px;">
    <!--<div><img src="pf.png"/></div>-->
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
                            ${plan.addressee}
                            This is a test.
                            This is a test.
                            <div style="position:relative;float:right;top:60px;width:60px;"><< ≡</div>
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
                        <span class="s_char">&nbsp;${plan.filingTime}</span>
                    </div>
                </div>
                <div class="span2">
                    <label>&nbsp;</label>
                    <div style="text-align: center;">→</div>
                </div>
                <div class="span2">
                    <label class="plan_til_label">ORIGINATOR</label>
                    <div>
                        <span class="s_char">&nbsp;${plan.originator}</span>
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
                        - <span class="s_char">&nbsp;${plan.aircraftIdentification}</span>
                    </div>
                </div>
                <div class="span3">
                    <label  class="plan_til_label">8 FLIGHT RULES</label>
                    <div>
                        - <span class="s_char">&nbsp;${plan.flightRules}</span>
                    </div>
                </div>
                <div class="span2">
                    <label  class="plan_til_label">TYPE OF FLIGHT</label>
                    <div><span class="s_char">&nbsp;${plan.typeOfFlight}</span></div>
                </div>
                <div class="span1">
                    <label  class="plan_til_label">&nbsp;</label>
                    <div><<≡</div>
                </div>
            </div>
            <div class="row-fluid mt10">
                <div class="span2">
                    <label  class="ml10">9 NUMBER</label>
                    <div  class="ml10">
                        - <span class="s_char">&nbsp;${plan.flightNumber}</span>
                    </div>
                </div>
                <div class="span3">
                    <label  class="plan_til_label">TYPE OF AIRCARAFT</label>
                    <div>
                        <span class="s_char">&nbsp;${plan.typeOfAircraft}</span>
                    </div>
                </div>
                <div class="span3">
                    <label>WAKE TURBULENCE CAT</label>
                    <div>
                        / <span class="s_char">&nbsp;${plan.wakeTurbulenceCat}</span>
                    </div>
                </div>
                <div class="span3">
                    <label>10 EQUIPMENT</label>
                    <div>
                        - <span class="s_char">&nbsp;${plan.equipment}</span>
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
                        - <span class="s_char">&nbsp;${plan.departureAerodrome}</span>
                    </div>
                </div>
                <div class="span3">
                    <label>TIME</label>
                    <div><span class="s_char">&nbsp;${plan.departureTime}</span></div>
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
                    <div  class="ml10">- <span class="s_char">&nbsp;${plan.cruisingSpeed}</span></div>
                </div>
                <div class="span2">
                    <label><br/>LEVEL</label>
                    <div><span class="s_char">&nbsp;${plan.flightLevel}</span></div>
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
                    <div  class="ml10">- <span class="s_char"> ${plan.destinationAerodrome}</span></div>
                </div>
                <div class="span2">
                    <label>TOTAL EET<br/>HR. MIN</label>
                    <div><span class="s_char"> ${plan.totalEet}</span></div>
                </div>
                <div class="span3">
                    <label><br/>ALTN AERODROME</label>
                    <div>-> <span class="s_char"> ${plan.altnAerodrome}</span></div>
                </div>
                <div class="span3">
                    <label><br/>2ND ALTN AERODROME</label>
                    <div>-> <span class="s_char"> ${plan.altn2rdAerodrome}</span></div>
                </div>
                <div class="span1">
                    <label><br/>&nbsp;</label>
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
                            <div class="ml10">- E / <span class="s_char"> ${plan.endurance}</span></div>
                        </div>
                        <div class="span6">
                            <label>PERSONS ON BOARD</label>
                            <div>-> P / <span class="s_char"> ${plan.personsOnBoard}</span></div>
                        </div>
                    </div>
                </div>
                <div class="span6">
                    <label>EMERGENCY RADIO</label>
                    <div class="span4">
                        <label>UHF</label>
                        <div>-> R / <span class="s_char">${plan.emergencyRadio}</span></div>
                    </div>
                    <div class="span4">
                        <label>VHF</label>
                        <div><span class="s_char">V</span></div>
                    </div>
                    <div class="span3">
                        <label>ELT</label>
                        <div><span class="s_char">E</span></div>
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
                    <div>/ <span class="s_char">P</span></div>
                </div>
                <div class="span1">
                    <label><br/>DESERT</label>
                    <div><span class="s_char">D</span></div>
                </div>
                <div class="span1">
                    <label><br/>MARITIME</label>
                    <div><span class="s_char">M</span></div>
                </div>
                <div class="span1">
                    <label><br/>JUNGLE</label>
                    <div><span class="s_char">J</span></div>
                </div>
                <div class="span1">
                    <label><br/>JACKETS</label>
                    <div><span class="s_char">J</span></div>
                </div>
                <div class="span1">
                    <label><br/>LIGHT</label>
                    <div>/ <span class="s_char">L</span></div>
                </div>
                <div class="span1">
                    <label><br/>FLUORES</label>
                    <div><span class="s_char">F</span></div>
                </div>
                <div class="span1">
                    <label><br/>UHF</label>
                    <div><span class="s_char">U</span></div>
                </div>
                <div class="span1">
                    <label><br/>VHF</label>
                    <div><span class="s_char">V</span></div>
                </div>
                <div class="span1"></div>
            </div>
            <div class="row-fluid mt10">
                <div class="span2">
                    <label class="ml10">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NUMBER</label>
                    <div class="ml10">
                        -> <span class="s_char">D</span>
                        / <span class="s_char">XX</span>
                    </div>
                </div>
                <div class="span2">
                    <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CAPACITY</label>
                    <div> -> <span class="s_char">XXX</span></div>
                </div>
                <div class="span1">
                    <label>&nbsp;&nbsp;&nbsp;&nbsp;COVER</label>
                    <div> -> <span class="s_char">C</span></div>
                </div>
                <div class="span3">
                    <label>&nbsp;&nbsp;&nbsp;&nbsp;COLOUR</label>
                    <div> -><span class="s_char">${plan.dingiesColour}</span> </div>
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
                    <div class="s_char"> ${plan.aircraftColourAndMarkings}</div>
                </div>
            </div>
            <div class="row-fluid mt10">
                <div class="span1">
                    <label>&nbsp;</label>
                    <div class="ml10 txt_r"> -> N /</div>
                </div>
                <div class="span10">
                    <label>REMARKS</label>
                    <div class="s_char"> ${plan.remarks}</div>
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
                    <div class="s_char"> ${plan.pilotInCommand} </div>
                </div>
                <div class="span1">
                    <label>&nbsp;</label>
                    <div> ）<<≡ </div>
                </div>
                <div class="span3"></div>
            </div>

            <div class="row-fluid mt10">
                <div class="span5" style="font-size:16px;">&nbsp;&nbsp;&nbsp;&nbsp;FIELD BY</div>
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
                <input id="submit_btn" class="btn btn-primary" type="submit" value="提交"/>&nbsp;
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

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>计划审核</title>
    <style>
        .c_1{width:27.7px;text-align: center;background-image: url("${ctx}/static/images/b_char.gif");}
        .c_1:last-child{background:none;}
        .c_12{width:319px;display:inline-block;}

        table{margin-left:auto;margin-right:auto;}
        .tbl-plan{width:980px;font-size:18px;color:#555;}
        .tbl-plan table{width:98%;margin-left:2%;}
        .tbl-plan label{margin-bottom:0px;font-weight:bold;}
        .tbl-plan .tr_cap td{vertical-align: middle;height:30px;}
        .tbl-plan .tr_val td{vertical-align: middle; height:32px;}
        .tbl-plan .s_char{
            border:1px solid #999;
            display:inline-block;
        }
        .tbl-plan span.s_char span{
            display: inline-block;
            line-height:27px;
        }


        .tbl-audit{width:980px;margin-top:10px;}

        .bordered{border:1px solid #999;}
        .bordered-bottom{border-bottom:1px solid #ddd;}
    </style>
</head>

<body>
    <form id="inputForm" action="${ctx}/plan/audit" method="post" class="form-horizontal">
    <input type="hidden" name="id" value="${id}"/>
    <fieldset>
    <legend><small>计划审核</small></legend>
    <table class="tbl-plan bordered">
        <tbody><tr>
            <td class="bordered-bottom text-center"><h3 style="margin-top:0px;margin-bottom:0px;">飞行计划</h3></td></tr></tbody>
        <tbody>
            <tr><td>
                <table>
                    <tr class="tr_cap">
                        <td width="15%"><label>电报等级</label></td>
                        <td><label>收电地点和单位</label></td></tr>
                    <tr class="tr_val">
                        <td style="vertical-align: top;"><< ≡ FF →</td>
                        <td class="bordered" style="height:90px; vertical-align: top;">
                            <div style="float:left;">${plan.addressee}<br/>${plan.addressee}<br/>${plan.addressee}<br/>${plan.addressee}</div>
                            <div style="position:relative;float:right;top:60px;width:60px;display: inline;"><< ≡</div>
                            <div style="clear:both;"></div></td></tr>
                </table>
            </td></tr>
            <tr><td class="bordered-bottom">
                <table>
                    <tr class="tr_cap">
                        <td width="10">&nbsp;</td>
                        <td width="18%"><label>申报时间</label></td>
                        <td width="5%">&nbsp;</td>
                        <td width="25%"><label>发电地点和单位</label></td>
                        <td></td></tr>
                    <tr class="tr_val">
                        <td></td>
                        <td><span class="s_char"><tags:printchars var="${plan.filingTime}" /></span></td>
                        <td><div style="text-align: center;">→</div></td>
                        <td><span class="s_char"><tags:printchars var="${plan.originator}" /></span></td>
                        <td><< ≡</td></tr>
                    <tr>
                        <td colspan="5" style="height:35px;"><label>SPECIFIC IDENTIFICATION OF ADDRESSEE(S) AND/OR ORIGINATOR</label></td></tr>
                </table>
            </td></tr>
        </tbody>
        <tbody>
            <tr><td>
                <table>
                    <tr  class="tr_cap">
                        <td width="27%"><label>&nbsp;&nbsp;&nbsp;&nbsp;报类</label></td>
                        <td width="32%"><label>&nbsp;&nbsp;航空器识别标志</label></td>
                        <td width="20%"><label>飞行规则</label></td>
                        <td width="13%"><label>飞行种类</label></td>
                        <td></td></tr>
                    <tr class="tr_val">
                        <td><<≡(FPL</td>
                        <td>- <span class="s_char"><tags:printchars var="${plan.aircraftIdentification}" /></span></td>
                        <td>- <span class="s_char"><span class="c_1">${plan.flightRules}</span></span></td>
                        <td><span class="s_char"><span class="c_1">${plan.typeOfFlight}</span></span></td>
                        <td><<≡</td></tr>
                </table>
            </td></tr>
            <tr><td>
                <table>
                    <tr  class="tr_cap">
                        <td width="22%"><label>&nbsp;&nbsp;架数</label></td>
                        <td width="24%"><label>航空器型别</label></td>
                        <td  width="29%"><label>按尾流分类</label></td>
                        <td width="15%"><label>&nbsp;&nbsp;设备</label></td>
                        <td></td></tr>
                    <tr class="tr_val">
                        <td>- <span class="s_char"><fmt:formatNumber var="s_flightNumber" value="${plan.flightNumber}" pattern="00"/><tags:printchars var="${s_flightNumber}"/></span></td>
                        <td><span class="s_char"><tags:printchars var="${plan.typeOfAircraft}"/></span></td>
                        <td>/ <span class="s_char"><span class="c_1">${plan.wakeTurbulenceCat}</span></span></td>
                        <td>- <span class="s_char"><tags:printchars var="${plan.equipment}"/></span></td>
                        <td><<≡</td></tr>
                </table>
            </td></tr>
            <tr><td>
                <table>
                    <tr  class="tr_cap">
                        <td width="23%"><label  class="ml10">&nbsp;&nbsp;起飞机场</label></td>
                        <td width="15%">&nbsp;</td>
                        <td width="13%" class="text-center"><label>时间</label></td>
                        <td></td></tr>
                    <tr class="tr_val">
                        <td> - <span class="s_char"><tags:printchars var="${plan.departureAerodrome}"/></span></td>
                        <td></td>
                        <td><span class="s_char"><tags:printchars var="${plan.departureTime}"/></span></td>
                        <td style="padding-left:20px;"><<≡</td></tr>
                </table>
            </td></tr>
            <tr><td>
                <table>
                    <tr class="tr_cap">
                        <td width="1%">&nbsp;</td>
                        <td width="15%"><label>巡航速度</label></td>
                        <td width="4%">&nbsp;</td>
                        <td width="16%"><label>高度层</label></td>
                        <td width="3%">&nbsp;</td>
                        <td><label>航路</label></td></tr>
                    <tr class="tr_val" >
                        <td style="vertical-align: top;">-</td>
                        <td style="vertical-align: top;"><span class="s_char"><tags:printchars var="${plan.cruisingSpeed}"/></span></td>
                        <td style="vertical-align: top;"></td>
                        <td style="vertical-align: top;"><span class="s_char"><tags:printchars var="${plan.flightLevel}"/></span></td>
                        <td style="vertical-align: top;">→</td>
                        <td class="bordered" style="height:120px;vertical-align: top;">${plan.route}
                            <div style="position:relative;float:right;top:90px;width:60px;"><< ≡</div></td>
                    </tr>
                    </table>
            </td></tr>
            <tr><td>
                <table>
                    <tr class="tr_cap">
                        <td></td>
                        <td><label  class="ml10"><br/>目的机场</label></td>
                        <td></td>
                        <td><label>预计经过总时间<br/>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;时.分</label></td>
                        <td><label><br/>&nbsp;&nbsp;&nbsp;&nbsp;备降机场</label></td>
                        <td><label><br/>&nbsp;&nbsp;&nbsp;&nbsp;第二备降机场</label></td>
                        <td></td></tr>
                    <tr class="tr_val">
                        <td></td>
                        <td>- <span class="s_char"><tags:printchars var="${plan.destinationAerodrome}"/></span></td>
                        <td></td>
                        <td><span class="s_char"><tags:printchars var="${plan.totalEet}"/></span></td>
                        <td>-> <span class="s_char"><tags:printchars var="${plan.altnAerodrome}"/></span></td>
                        <td>-> <span class="s_char"><tags:printchars var="${plan.altn2rdAerodrome}"/></span></td>
                        <td><<≡</td></tr>
                </table>
            </td></tr>
            <tr><td class="bordered-bottom">
                <table>
                    <tr class="tr_cap"><td><label  class="ml10">其它情报</label></td></tr>
                    <tr class="tr_val"><td class="bordered" style="height:90px; vertical-align: top;">${plan.otherInformation}
                        <div style="position:relative;float:right;top:60px;width:90px;">) <<≡</div></td></tr>
                </table>
            </td></tr>
        </tbody>
        <tbody>
            <tr  class="tr_cap"><td class="text-center">
                <%--<label>SUPPLEMENTARY INFORMATION (NOT TO BE TRANSMITTED IN FPL MESSAGES)</label>--%>
            </td></tr>
            <tr><td>
                <table>
                    <tr>
                        <td colspan="2" style="height:20px;text-align: center;"><label>续航能力</label></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td colspan="5" class="text-center"><label>应急无线电</label></td>
                        <td></td></tr>
                    <tr>
                        <td width="5%">&nbsp;</td>
                        <td width="13%" class="text-center"><label>时 分</label></td>
                        <td width="6%">&nbsp;</td>
                        <td width="18%" class="text-center"><label>机上人数</label></td>
                        <td width="25%">&nbsp;</td>
                        <td width="5%">&nbsp;</td>
                        <td width="3%"><label>UHF</label></td>
                        <td width="6%">&nbsp;</td>
                        <td width="3%"><label>VHF</label></td>
                        <td width="6%">&nbsp;</td>
                        <td width="3%"><label>ELT</label></td>
                        <td>&nbsp;</td></tr>
                    <tr class="tr_val">
                        <td>- E / </td>
                        <td><span class="s_char"><tags:printchars var="${plan.endurance}"/></span></td>
                        <td></td>
                        <td>-> P / <span class="s_char"><fmt:formatNumber var="s_personsOnBoard" value="${plan.personsOnBoard}" pattern="000"/><tags:printchars var="${s_personsOnBoard}"/></span></td>
                        <td></td>
                        <td>-> R / </td>
                        <td>
                            <c:choose>
                                <c:when test="${fn:contains(plan.emergencyRadio,'U')}"><span class="s_char"><span class="c_1">U </span></span></c:when>
                                <c:otherwise><img src="${ctx}/static/images/char_no_selected.gif"/></c:otherwise>
                            </c:choose>
                        </td>

                        <td></td>
                        <td>
                            <c:choose>
                                <c:when test="${fn:contains(plan.emergencyRadio,'V')}"><span class="s_char"><span class="c_1">V </span></span></c:when>
                                <c:otherwise><img src="${ctx}/static/images/char_no_selected.gif"/></c:otherwise>
                            </c:choose>
                            </td>
                        <td></td>
                        <td>
                            <c:choose>
                                <c:when test="${fn:contains(plan.emergencyRadio,'E')}"><span class="s_char"><span class="c_1">E </span></span></c:when>
                                <c:otherwise><img src="${ctx}/static/images/char_no_selected.gif"/></c:otherwise>
                            </c:choose>
                            </td>
                        <td></td></tr>
                </table>
            </td></tr>
            <tr><td>
                <table>
                    <tr class="tr_cap text-center">
                        <td width="1%">&nbsp;</td>
                        <td width="12%"><label><br/>救生设备</label></td>
                        <td width="9%"><label><br/>极地</label></td>
                        <td width="9%"><label><br/>沙漠</label></td>
                        <td width="9%"><label><br/>海洋</label></td>
                        <td width="9%"><label><br/>森林</label></td>
                        <td width="9%"><label><br/>救生衣</label></td>
                        <td width="9%"><label><br/>灯光</label></td>
                        <td width="9%"><label><br/>荧光</label></td>
                        <td width="9%"><label><br/>UHF</label></td>
                        <td width="9%"><label><br/>VHF</label></td>
                        <td></td></tr>
                    <tr class="tr_val text-center">
                        <td></td>
                        <td>->
                            <c:choose>
                                <c:when test="${plan.survivalEquipment==null||plan.survivalEquipment==''}"><img src="${ctx}/static/images/char_no_selected.gif"/></c:when>
                                <c:otherwise> <span class="s_char"><span class="c_1">S</span></span></c:otherwise>
                            </c:choose>
                        </td>
                        <td>/
                            <c:choose>
                                <c:when test="${fn:contains(plan.survivalEquipment,'P')}"><span class="s_char"><span class="c_1">P </span></span></c:when>
                                <c:otherwise><img src="${ctx}/static/images/char_no_selected.gif"/></c:otherwise>
                            </c:choose>
                       </td>
                        <td>
                            <c:choose>
                                <c:when test="${fn:contains(plan.survivalEquipment,'D')}"><span class="s_char"><span class="c_1">D </span></span></c:when>
                                <c:otherwise><img src="${ctx}/static/images/char_no_selected.gif"/></c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${fn:contains(plan.survivalEquipment,'M')}"><span class="s_char"><span class="c_1">M </span></span></c:when>
                                <c:otherwise><img src="${ctx}/static/images/char_no_selected.gif"/></c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${fn:contains(plan.survivalEquipment,'J')}"><span class="s_char"><span class="c_1">J </span></span></c:when>
                                <c:otherwise><img src="${ctx}/static/images/char_no_selected.gif"/></c:otherwise>
                            </c:choose></td>
                        <td>
                            <c:choose>
                                <c:when test="${(plan.survivalJackets==null)||plan.survivalJackets==''}"><img src="${ctx}/static/images/char_no_selected.gif"/></c:when>
                                <c:otherwise>-> <span class="s_char"><span class="c_1">J</span></span></c:otherwise>
                            </c:choose>
                        </td>
                        <td>/
                            <c:choose>
                                <c:when test="${fn:contains(plan.survivalJackets,'L')}"><span class="s_char"><span class="c_1">L </span></span></c:when>
                                <c:otherwise><img src="${ctx}/static/images/char_no_selected.gif"/></c:otherwise>
                            </c:choose>
                            </td>
                        <td>
                            <c:choose>
                                <c:when test="${fn:contains(plan.survivalJackets,'F')}"><span class="s_char"><span class="c_1">F </span></span></c:when>
                                <c:otherwise><img src="${ctx}/static/images/char_no_selected.gif"/></c:otherwise>
                            </c:choose>
                        </td>

                        <td>
                            <c:choose>
                                <c:when test="${fn:contains(plan.survivalJackets,'U')}"><span class="s_char"><span class="c_1">U </span></span></c:when>
                                <c:otherwise><img src="${ctx}/static/images/char_no_selected.gif"/></c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${fn:contains(plan.survivalJackets,'V')}"><span class="s_char"><span class="c_1">V </span></span></c:when>
                                <c:otherwise><img src="${ctx}/static/images/char_no_selected.gif"/></c:otherwise>
                            </c:choose>
                        </td>
                        <td></td></tr>
                </table>
            </td></tr>
            <tr><td><table>
                <tr class="tr_cap">
                    <td width="16%" colspan="2" class="text-center"><label>救生船数量</label></td>
                    <td width="3%"></td>
                    <td width="10%"><label>载量</label></td>
                    <td width="3%"></td>
                    <td width="6%"><label>篷</label></td>
                    <td width="3%"></td>
                    <td width="40%"><label>颜色</label></td>
                    <td></td>
                    <td></td></tr>
                <tr class="tr_val">
                    <td>->
                        <c:choose>
                            <c:when test="${plan.dingiesNumber==0 && plan.dingiesCapacity==0 && (plan.dingiesCover == null || plan.dingiesCover=='')}">
                                <img src="${ctx}/static/images/char_no_selected.gif"/></c:when>
                            <c:otherwise><span class="s_char"><span class="c_1">D</span></span></c:otherwise>
                        </c:choose>
                       </td>
                    <td>/ <span class="s_char"><fmt:formatNumber var="s_dingiesNumber" value="${plan.dingiesNumber}" pattern="00"/><tags:printchars var="${s_dingiesNumber}"/></span></td>
                    <td>-></td>
                    <td><span class="s_char"><fmt:formatNumber var="s_dingiesCapacity" value="${plan.dingiesCapacity}" pattern="000"/><tags:printchars var="${s_dingiesCapacity}"/></span></td>
                    <td>-></td>
                    <td>
                        <c:choose>
                            <c:when test="${fn:contains(plan.dingiesCover,'C')}"><span class="s_char"><span class="c_1">C</span></span></c:when>
                            <c:otherwise><img src="${ctx}/static/images/char_no_selected.gif"/></c:otherwise>
                        </c:choose>></td>
                    <td>-></td>
                    <td><span class="s_char" style="background:none;;"><span class="c_12">${plan.dingiesColour}</span></span></td>
                    <td><<≡</td>
                    <td></td></tr>
            </table></td></tr>
            <tr><td>
                <table>
                    <tr class="tr_cap">
                        <td width="3%"></td>
                        <td><label>航空器颜色和标志</label></td></tr>
                    <tr class="tr_val">
                        <td> A/ </td>
                        <td class="bordered">${plan.aircraftColourAndMarkings}</td></tr>
                </table>
            </td></tr>
            <tr><td>
                <table>
                    <tr class="tr_cap">
                        <td width="7%"></td>
                        <td><label>备注</label></td>
                        <td></td></tr>
                    <tr class="tr_val">
                        <td> ->
                            <c:choose>
                                <c:when test="${plan.remarks == null || plan.remarks==''}">
                                    <img src="${ctx}/static/images/char_no_selected.gif"/></c:when>
                                <c:otherwise><span class="s_char"><span class="c_1">N</span></span></c:otherwise>
                            </c:choose>
                            /</td>
                        <td class="bordered">${plan.remarks}</td>
                        <td><<≡</td></tr>
                </table>
            </td></tr>
            <tr><td><table>
                <tr class="tr_cap">
                    <td width="6%"></td>
                    <td><label>待命飞行员</label></td>
                    <td></td>
                    <td></td></tr>
                <tr class="tr_val">
                    <td> C /</td>
                    <td class="bordered"> ${plan.pilotInCommand} </td>
                    <td> ）<<≡ </td>
                    <td></td></tr>
            </table></td></tr>
            <tr>
                <td class="bordered-bottom"><table>
                    <tr class="tr_cap">
                        <td width="40%" style="vertical-align: bottom;"><label>填写人</label></td>
                        <td  style="vertical-align: bottom;">
                            <%--<label>SPACE RESERVED FOR ADDITIONAL REQUIREMENTS</label>--%>
                        </td></tr>
                    </table></td></tr>
            <tr><td>
                    <table>
                    <tr class="tr_val">
                        <td style="width:40%;height:60px;border-right:1px solid #ddd;font-size:24px;text-align: center;vertical-align: middle;">${plan.filedBy}</td>
                        <td style="vertical-align: top;">
                            <div style="line-height:25px;font-weight:normal;font-size:14px;">请提供您的手机号码以便联系:</div>
                            <div style="font-size:20px;text-align:center;margin-top:5px;">${plan.telephone}</div>
                        </td></tr>
                </table></td>
            </tr>
        </tbody>
    </table>
   <div class="bordered" style="background-color:#EEE;margin-top:5px;padding:10px;">
    <table class="tbl-audit">
        <tbody>
            <tr>
                <td>
                    <label style="float:left;width:200px;display:inline-block;font-weight:bold;" >审核意见:</label>
                    <label class="radio" style="float:right;width:80px;display:inline-block;"><input type="radio" <c:if test="${plan.auditStatus=='YES'}">checked="checked"</c:if> name="auditStatus"  value="YES">通过</label>
                    <label class="radio" style="float:right;width:80px;display:inline-block"><input type="radio"  <c:if test="${plan.auditStatus=='NO'}">checked="checked"</c:if>name="auditStatus"  value="NO">驳回</label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <textarea name="auditNote" rows="4" style="width:95%;">${plan.auditNote}</textarea></td>
                    <td style="width:120px;vertical-align:top;">
                        <input id="submit_btn" class="btn btn-primary" type="submit" value="提交"/>
                        <input id="cancel_btn" class="btn" type="button" value="返回" onclick="history.back()"/>
                    </td></tr>
        </tbody>
    </table>
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

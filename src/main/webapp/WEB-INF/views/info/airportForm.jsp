<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>机场管理</title>
</head>

<body>
<div id="content">
    <form id="inputForm" action="${ctx}/airport/${action}" method="post" class="form-horizontal">
        <input type="hidden" name="id" value="${airport.id}"/>
        <fieldset>
            <legend><small>编辑机场</small></legend>
            <!--<div class="container" style="border:1px solid #000;width:980px;height:1600px;"></div>-->
            <style>
                .table td.field-label{
                    text-align: center;
                    vertical-align: middle;
                }
                input.colspan3{
                    width:98%;
                }
                input.colspan2{
                    width:97%;
                }
                input.colspan1{
                    width:94%;
                }
            </style>
            <table class="table table-bordered" style="margin-left:auto;margin-right:auto;width:960px;"><tbody>
            <tr class="success">
                <td width="25%" style="vertical-align: middle;text-align: center;">机场名称</td>
                <td colspan="3"><input class="colspan3 required" type="text" id="airport_name" name="name" value="${airport.name}" minlength="2"/></td>
            </tr>
            <tr>
                <td class="field-label">地址</td>
                <td colspan="3"><input class="colspan3" type="text" name="address" value="${airport.address}" /></td>
            </tr>
            <tr>
                <td width="25%" class="field-label">所有者/法人代表</td>
                <td width="25%" ><input class="colspan1" type="text" name="owner" value="${airport.owner}" /></td>
                <td width="25%" class="field-label">联系电话</td>
                <td width="25%"><input class="colspan1" type="text" name="telephone" value="${airport.telephone}" /></td>
            </tr>
            <tr>
                <td class="field-label">传真</td>
                <td><input class="colspan1" type="text" name="fax" value="${airport.fax}" /></td>
                <td class="field-label">邮编</td>
                <td><input class="colspan1" type="text" name="postcode" value="${airport.postcode}" /></td>
            </tr>
            <tr>
                <td class="field-label">机场基准点</td>
                <td class="field-label">东经</td>
                <td colspan="2" style="padding:0px;">
                    <table style="width:100%;">
                        <tr>
                            <td><input class="colspan1" type="text" name="longitude" value="${airport.longitude}" /></td>
                            <td style="width:30%;" class="field-label">北纬</td>
                            <td><input class="colspan1" type="text" name="latitude" value="${airport.latitude}" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="field-label">机场标高</td>
                <td><input class="colspan1" type="text" name="altitude" value="${airport.altitude}" /></td>
                <td class="field-label">磁差</td>
                <td><input class="colspan1" type="text" name="magneticVariation" value="${airport.magneticVariation}" /></td>
            </tr>
            <tr>
                <td class="field-label">基准温度</td>
                <td><input class="colspan1" type="text" name="baseTemperature" value="${airport.baseTemperature}" /></td>
                <td class="field-label">最大可使用机型</td>
                <td><input class="colspan1" type="text" name="maxModel" value="${airport.maxModel}" /></td>
            </tr>
            <tr>
                <td class="field-label">机场用途</td>
                <td colspan="3"><input class="colspan3" type="text" name="airportUse" value="${airport.airportUse}" /></td>
            </tr>
            <tr>
                <td class="field-label">飞行区等级</td>
                <td><input class="colspan1" type="text" name="airfieldLevel" value="${airport.airfieldLevel}" /></td>
                <td class="field-label">升降带尺寸(米)(长＊宽)</td>
                <td><input class="colspan1" type="text" name="sizeOfLiftingBelt" value="${airport.sizeOfLiftingBelt}" /></td>
            </tr>
            <tr>
                <td class="field-label">停止道</td>
                <td><input class="colspan1" type="text" name="stopway" value="${airport.stopway}" /></td>
                <td class="field-label">净空道</td>
                <td><input class="colspan1" type="text" name="clearway" value="${airport.clearway}" /></td>
            </tr>
            <tr>
                <td class="field-label">端安全区尺寸(米)(长＊宽)</td>
                <td><input class="colspan1" type="text" name="sizeOfResa" value="${airport.sizeOfResa}" /></td>
                <td class="field-label">防吹坪尺寸(米)(长＊宽)</td>
                <td><input class="colspan1" type="text" name="sizeOfBlastPad" value="${airport.sizeOfBlastPad}" /></td>
            </tr>
            <tr>
                <td class="field-label" rowspan="6">跑道</td>
                <td class="field-label">尺寸(米)(长＊宽＊面层厚度)</td>
                <td colspan="2"><input class="colspan2" type="text" name="runwaySize" value="${airport.runwaySize}" /></td>
            </tr>
            <tr>
                <td class="field-label">识别号码及运行类别</td>
                <td colspan="2"><input class="colspan2" type="text" name="runwayId" value="${airport.runwayId}" /></td>
            </tr>
            <tr>
                <td class="field-label">跑道方位</td>
                <td colspan="2"><input class="colspan2" type="text" name="runwayDirection" value="${airport.runwayDirection}" /></td>
            </tr>
            <tr>
                <td class="field-label">PCN值</td>
                <td colspan="2" style="padding:0px;">
                    <table style="width:100%;">
                        <tr>
                            <td><input class="colspan1" type="text" name="runwayPcn" value="${airport.runwayPcn}" /></td>
                            <td style="width:30%;" class="field-label">道肩(米)</td>
                            <td><input class="colspan1" type="text" name="runwayShoulder" value="${airport.runwayShoulder}" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="field-label">跑道坡度</td>
                <td colspan="3">有效坡度：<input style="width:22%;" type="text" name="runwayGradient" value="${airport.runwayGradient}" />　　
                    横向坡度：<input style="width:22%;" type="text" name="runwayCrossfall" value="${airport.runwayCrossfall}" /></td>
            </tr>
            <tr>
                <td class="field-label">公布的距离</td>
                <td colspan="3">
                    <label style="width:130px;display:inline-block;">可用起飞滑跑距离：</label><input  type="text" name="runwayTaxi" value="${airport.runwayTaxi}" />　　　　　<br/>
                    <label style="width:130px;display:inline-block;">可用起飞距离：　   </label><input  type="text" name="runwayFly" value="${airport.runwayFly}" />　　      <br/>
                    <label style="width:130px;display:inline-block;">可用加速停止距离：</label><input  type="text" name="runwaySpeedup" value="${airport.runwaySpeedup}" />　　　　　<br/>
                    <label style="width:130px;display:inline-block;">可用着陆距离：       </label><input  type="text" name="runwayLand" value="${airport.runwayLand}" />
                </td>
            </tr>
            <tr>
                <td rowspan="3" class="field-label">滑行道</td>
                <td class="field-label">长＊宽＊面层厚度(米)</td>
                <td colspan="2"><input class="colspan2" type="text" name="taxiwaySize" value="${airport.taxiwaySize}" /></td>
            </tr>
            <tr>
                <td class="field-label">PCN值</td>
                <td colspan="2"><input class="colspan2" type="text" name="taxiwayPcn" value="${airport.taxiwayPcn}" /></td>
            </tr>
            <tr>
                <td class="field-label">道肩宽＊面层厚度</td>
                <td colspan="2"><input class="colspan2" type="text" name="taxiwayShoulder" value="${airport.taxiwayShoulder}" /></td>
            </tr>
            <tr>
                <td rowspan="3" class="field-label">机坪</td>
                <td class="field-label">长＊宽(米)</td>
                <td colspan="2"><input class="colspan2" type="text" name="rampSize" value="${airport.rampSize}" /></td>
            </tr>
            <tr>
                <td class="field-label">机位编号及停放机型</td>
                <td colspan="2"><input class="colspan2" type="text" name="rampCode" value="${airport.rampCode}" /></td>
            </tr>
            <tr>
                <td class="field-label">PCN值</td>
                <td colspan="2"><input class="colspan2" type="text" name="rampPcn" value="${airport.rampPcn}" /></td>
            </tr>
            <tr>
                <td class="field-label" rowspan="2">目视助助航设施</td>
                <td class="field-label">地面标志</td>
                <td colspan="2"><input class="colspan2" type="text" name="navaidSymbol" value="${airport.navaidSymbol}" /></td>
            </tr>
            <tr>
                <td class="field-label">助航灯光</td>
                <td colspan="2"><input class="colspan2" type="text" name="navaidLamp" value="${airport.navaidLamp}" /></td>
            </tr>
            <tr>
                <td class="field-label">通导气象设施</td>
                <td colspan="3"><input class="colspan3" type="text" name="deviceWeather" value="${airport.deviceWeather}" /></td>
            </tr>
            <tr>
                <td class="field-label">消防及安保设施</td>
                <td colspan="3"><input class="colspan3" type="text" name="deviceSafety" value="${airport.deviceSafety}" /></td>
            </tr>
            <tr>
                <td class="field-label">主要障碍物<br/>(机场内)</td>
                <td colspan="3"><input class="colspan3" type="text" name="roadblock" value="${airport.roadblock}" /></td>
            </tr>
            <tr>
                <%--<td colspan="4">附：机场飞行区位置图、平面图。</td>--%>
            </tr>
            </tbody></table>
        </fieldset>
        <div class="form-actions">
            <input id="submit_btn" class="btn btn-primary" type="submit" value="提交"/>&nbsp;
            <input id="cancel_btn" class="btn" type="button" value="返回" onclick="history.back()"/>
        </div>
	</form>
</div><!-- content end-->
	<script>
        $(document).ready(function() {
            //聚焦第一个输入框
            $("#airport_name").focus();
            //为inputForm注册validate函数
            $("#inputForm").validate();
        });
    </script>
</body>
</html>

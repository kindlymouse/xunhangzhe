<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>计划管理</title>
</head>

<body>
	<c:if test="${not empty message}">
		<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
	</c:if>
    <div class="row">
        <div class="span5">
            <form class="form-search" action="#">
                <label>收电地点和单位：</label> <input type="text" name="search_LIKE_ADDRESSEE" class="input-medium" value="${param.search_LIKE_ADDRESSEE}">
                <button type="submit" class="btn" id="search_btn">查询</button>
            </form>
        </div>
        <tags:sort/>
    </div>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead><tr>
            <th>#</th>
            <th>收电地点和单位</th>
            <th>申报时间</th>
            <th>发电地点和单位</th>
            <th>航空器识别标志</th>
            <th>飞行规则</th>
            <th>飞行种类</th>
            <th>审核状态</th>
            <th>管理</th></tr></thead>
		<tbody>
		<c:forEach items="${plans.content}" var="plan" varStatus="status">
			<tr>
				<td>${status.index + 1}</td>
                <td>${plan.addressee}</td>
                <td>${plan.filingTime}</td>
                <td>${plan.originator}</td>
                <td>${plan.aircraftIdentification}</td>
                <td>${plan.flightRules}</td>
                <td>${plan.typeOfFlight}</td>
                <c:choose>
                    <c:when test="${'YES' == plan.auditStatus}">
                        <td  style="background-color:rgb(70, 136, 71);color:#FFF;">${plan.auditStatus} </td>
                    </c:when>
                    <c:when test="${'NO' == plan.auditStatus}">
                        <td style="background-color:#333;color:#FFF;">${plan.auditStatus}</td>
                   </c:when>
                    <c:otherwise>
                        <td>${plan.auditStatus} </td>
                    </c:otherwise>
                </c:choose>
                <td><a href="${ctx}/plan/audit/${plan.id}">审核</a>&nbsp;&nbsp;<a href="${ctx}/plan/delete/${plan.id}">删除</a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
    <tags:pagination page="${plans}" paginationSize="5"/>
</body>
</html>

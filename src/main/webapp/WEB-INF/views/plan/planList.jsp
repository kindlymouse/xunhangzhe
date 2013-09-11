<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>计划管理</title>
</head>

<body>
	<c:if test="${not empty message}">
		<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
	</c:if>
	
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead><tr>
            <th>ADDRESSEE(S)</th>
            <th>FILING TIME</th>
            <th>ORIGINATOR</th>
            <th>AIRCRAFT IDENTIFICATION</th>
            <th>FLIGHT RULES</th>
            <th>TYPE OF FLIGHT</th>
            <th>AUDIT STATUS</th>
            <th>管理</th></tr></thead>
		<tbody>
		<c:forEach items="${plans}" var="plan">
			<tr>
				<td>${plan.addressee}</td>
                <td>${plan.filingTime}</td>
                <td>${plan.originator}</td>
                <td>${plan.aircraftIdentification}</td>
                <td>${plan.flightRules}</td>
                <td>${plan.typeOfFlight}</td>
                <td>${plan.auditStatus}</td>
                <td><a href="${ctx}/plan/audit/${plan.id}">审核</a>&nbsp;&nbsp;<a href="${ctx}/plan/delete/${plan.id}">删除</a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</body>
</html>

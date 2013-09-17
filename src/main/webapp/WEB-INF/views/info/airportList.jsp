<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>机场管理</title>
</head>

<body>
	<c:if test="${not empty message}">
		<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
	</c:if>
	<div class="row">
		<div class="span4 offset3">
			<form class="form-search" action="#">
				<label>名称：</label> <input type="text" name="search_LIKE_title" class="input-medium" value="${param.search_LIKE_title}">
				<button type="submit" class="btn" id="search_btn">Search</button>
		    </form>
	    </div>
        <div><a class="btn" href="${ctx}/msg/create">创建机场</a></div>
        <tags:sort/>
	</div>

	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead><tr><th width="20">#</th><th width="60">编码</th><th  width="240">机场名称</th><th>地址</th><th  width="60">所有者</th><th  width="120">联系电话</th><th  width="120">用途</th><th  width="80">管理</th></tr></thead>
		<tbody>
		<c:forEach items="${airports.content}" var="airport"  varStatus="status">
			<tr>
                <td> ${status.index +1}</td>
                <td><a href="${ctx}/airport/update/${airport.id}"><tags:substr var="${airport.code}" strlen="20"/></a></td>
                <td><tags:substr var="${airport.name}" strlen="50"/> </td>
                <td>${airport.address}</td>
                <td>${airport.owner}</td>
                <td>${airport.telephone}</td>
                <td>${airport.airportUse}</td>
                <td><a href="${ctx}/airport/delete/${airport.id}">删除</a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>

	<tags:pagination page="${airports}" paginationSize="5"/>

</body>
</html>

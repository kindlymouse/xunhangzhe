<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>起落点管理</title>
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
        <div><a class="btn" href="${ctx}/msg/create">创建起落点</a></div> <tags:sort/>
	</div>

	<table id="contentTable" class="table table-striped table-bordered table-condensed">
        <thead><tr><th width="20">#</th><th>编码</th><th  width="240">起落点名称</th><th>地址</th><th  width="60">所有者</th><th  width="120">联系电话</th><th  width="120">用途</th><th  width="80">管理</th></tr></thead>
		<tbody>
		<c:forEach items="${landports.content}" var="landport"  varStatus="status">
			<tr>
                <td> ${status.index +1}</td>
                <td><a href="${ctx}/landport/update/${landport.id}"><tags:substr var="${landport.code}" strlen="20"/></a></td>
                <td><tags:substr var="${landport.name}" strlen="50"/> </td>
                <td>${landport.address}</td>
                <td>${landport.owner}</td>
                <td>${landport.telephone}</td>
                <td>${landport.landportUse}</td>
                <td><a href="${ctx}/landport/delete/${landport.id}" onclick="return confirm('你确定要删除？')">删除</a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>

	<tags:pagination page="${landports}" paginationSize="5"/>

</body>
</html>

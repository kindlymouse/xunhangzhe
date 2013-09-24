<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>简报管理</title>
</head>

<body>
	<c:if test="${not empty message}">
		<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
	</c:if>
	<div class="row">
		<div class="span4">
			<form class="form-search" action="#">
				<label>标题：</label> <input type="text" name="search_LIKE_title" class="input-medium" value="${param.search_LIKE_title}">
				<button type="submit" class="btn" id="search_btn">查询</button>
		    </form>
	    </div>
        <div class="span2"><a class="btn" href="${ctx}/brief/create">创建简报</a></div> <tags:sort/>
	</div>

	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead><tr>
            <th width="20">#</th>
            <th  width="300">标题</th>
            <th>内容</th>
            <th  width="120">发布人</th>
            <th  width="120">发布日期</th>
            <th width="60">?推送</th>
            <th  width="80">管理</th></tr></thead>
		<tbody>
		<c:forEach items="${briefs.content}" var="brief"  varStatus="status">
			<tr>
                <td> ${status.index +1}</td>
                <td><a href="${ctx}/brief/update/${brief.id}"><tags:substr var="${brief.title}" strlen="20"/></a></td>
                <td><tags:substr var="${brief.content}" strlen="50"/> </td>
                <td>${brief.sysFillUser.name}</td>
                <td><fmt:formatDate value="${brief.sysFillTime}" pattern="yyyy-MM-dd  HH:mm" /></td>
				<td style="text-align: center;">${brief.pushed}</td>
                <td><a href="${ctx}/brief/delete/${brief.id}">删除</a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>

	<tags:pagination page="${briefs}" paginationSize="5"/>

</body>
</html>

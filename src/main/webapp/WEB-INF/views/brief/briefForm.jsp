<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>简报管理</title>
    <script type="text/javascript" src="${ctx}/static/ueditor/umeditor.config.js"></script>
    <script type="text/javascript" src="${ctx}/static/ueditor/umeditor.js"></script>
    <link type="text/css" href="${ctx}/static/ueditor/themes/default/css/umeditor.css"/>
</head>

<body>
	<form id="inputForm" action="${ctx}/brief/${action}" method="post" class="form-horizontal">
		<input type="hidden" name="id" value="${brief.id}"/>
		<fieldset>
			<legend><small>编辑简报</small></legend>
			<div class="control-group">
				<label for="brief_title" class="control-label">标题:</label>
				<div class="controls">
					<input type="text" id="brief_title" name="title"  value="${brief.title}" class="input-large required span8" minlength="3"/>
				</div>
			</div>
            <div class="control-group">
                <label for="brief_title" class="control-label">机场:</label>
                <div class="controls">
                    <select class="" name="airport.id">
                        <c:forEach items="${airports}" var="ap">
                            <option value="${ap.id}" <c:if test="${ap.id == brief.airport.id}">selected="selected"</c:if>>${ap.name}</option>
                        </c:forEach>
                        <option value="11">成都双流机场x</option>
                        <option value="21">绵阳机场x</option>
                    </select>
                </div>
            </div>
            <div class="control-group">
				<label for="brief_content" class="control-label">内容:</label>
				<div class="controls">
					<textarea id="brief_content" name="content" class="span8" rows="10">${brief.content}</textarea>
				</div>
			</div>	
			<div class="form-actions">
				<input id="submit_btn" class="btn btn-primary" type="submit" value="提交"/>&nbsp;	
				<input id="cancel_btn" class="btn" type="button" value="返回" onclick="history.back()"/>
			</div>
		</fieldset>
	</form>
	<script>
		$(document).ready(function() {
			//聚焦第一个输入框
			$("#brief_title").focus();
			//为inputForm注册validate函数
			$("#inputForm").validate();
		});
	</script>
</body>
</html>

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
					<input type="text" id="brief_title" name="title"  value="${brief.title}" class="input-large required" minlength="3"/>
				</div>
			</div>	
			<div class="control-group">
				<label for="brief_content" class="control-label">内容:</label>
				<div class="controls">
					<%--<textarea id="brief_content" name="content" class="input-large">${brief.content}</textarea>--%>
                   <div id="brief_contentxx"></div>
                    <script type="text/javascript" charset="utf-8">
                        var editor = new baidu.editor.ui.Editor();
                        editor.render('brief_contentxx');  //editor为编辑器容器的id
                    </script>
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

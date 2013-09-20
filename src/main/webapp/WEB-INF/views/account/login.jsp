<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ page import="org.apache.shiro.authc.ExcessiveAttemptsException"%>
<%@ page import="org.apache.shiro.authc.IncorrectCredentialsException"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>巡航者 - 综合飞行服务应用</title>
    <style>
        body{background:#e7e7e7;
            margin:0px;
            padding:0px;}
        .bg{background:url(${ctx}/static/login/images/bg.jpg);
            height:600px;
            width:100%;
            background-repeat:repeat-x;
            padding-top:4%}
        .center{margin:0px auto;
            width:634px;
            height:600px;}
        .textfield{border:none;
            background:transparent;
            line-height:22px;
            width:180px;}
    </style>
</head>
<body>
<form id="loginForm" action="${ctx}/login" method="post" class="form-horizontal">
        <%
	String error = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
	if(error != null){
	%>
    <div class="alert alert-error input-medium controls">
        <button class="close" data-dismiss="alert">×</button>登录失败，请重试.
    </div>
        <%
	}
	%>
<div class="bg">
    <div class="center">
        <table id="__01" width="634" height="600" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td><img src="${ctx}/static/login/images/2_01.jpg" width="634" height="227" alt="" /></td>
            </tr>
            <tr>
                <td width="634" height="154" background="${ctx}/static/login/images/2_02.jpg"><table id="__" width="634" height="154" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td colspan="5"><img src="${ctx}/static/login/images/22_01.jpg" width="634" height="4" alt="" /></td>
                    </tr>
                    <tr>
                        <td colspan="2" rowspan="4"><img src="${ctx}/static/login/images/22_02.jpg" width="253" height="111" alt="" /></td>
                        <td width="188"  height="28" background="${ctx}/static/login/images/22_03.jpg">
                            <input type="text" id="username" name="username"  value="${username}" class="textfield required"/>
                             </td>
                        <td colspan="2" rowspan="4"><img src="${ctx}/static/login/images/22_04.jpg" width="193" height="111" alt="" /></td>
                    </tr>
                    <tr>
                        <td><img src="${ctx}/static/login/images/22_05.jpg" width="188" height="29" alt="" /></td>
                    </tr>
                    <tr>
                        <td width="188" height="28" background="${ctx}/static/login/images/22_03.jpg">
                            <input type="password" id="password" name="password" class="textfield required"/>
                            </td>
                    </tr>
                    <tr>
                        <td><img src="${ctx}/static/login/images/22_07.jpg" width="188" height="26" alt="" /></td>
                    </tr>
                    <tr>
                        <td><img src="${ctx}/static/login/images/22_08.jpg" width="188" height="38" alt="" /></td>
                        <td colspan="3"><input type="image"  src="${ctx}/static/login/images/22_09.jpg" width="253" height="34" alt="" /></td>
                        <td><img src="${ctx}/static/login/images/22_10.jpg" width="188" height="38" alt="" /></td>
                    </tr>
                    <tr>
                        <td><img src="${ctx}/static/login/images/split.gif" width="188" height="1" alt="" /></td>
                        <td><img src="${ctx}/static/login/images/split.gif" width="65" height="1" alt="" /></td>
                        <td><img src="${ctx}/static/login/images/split.gif" width="188" height="1" alt="" /></td>
                        <td><img src="${ctx}/static/login/images/split.gif" width="5" height="1" alt="" /></td>
                        <td><img src="${ctx}/static/login/images/split.gif" width="188" height="1" alt="" /></td>
                    </tr>
                </table></td>
            </tr>
            <tr>
                <td><img src="${ctx}/static/login/images/2_03.jpg" width="634" height="219" alt="" /></td>
            </tr>
        </table>
    </div></div>
</form>

<script>
    $(document).ready(function() {
        $("#loginForm").validate();
    });
</script>
</body>
</html>





<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
    <%--<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />--%>
    <%--<meta http-equiv="Cache-Control" content="no-store" />--%>
    <%--<meta http-equiv="Pragma" content="no-cache" />--%>
    <%--<meta http-equiv="Expires" content="0" />--%>

    <%--<link type="image/x-icon" href="${ctx}/static/${ctx}/static/login/images/favicon.ico" rel="shortcut icon">--%>
    <%--<link href="${ctx}/static/bootstrap/2.3.2/css/bootstrap.min.css" type="text/css" rel="stylesheet" />--%>
    <%--<link href="${ctx}/static/jquery-validation/1.11.1/validate.css" type="text/css" rel="stylesheet" />--%>
    <%--<link href="${ctx}/static/styles/default.css" type="text/css" rel="stylesheet" />--%>
    <%--<script src="${ctx}/static/jquery/jquery-1.9.1.min.js" type="text/javascript"></script>--%>
    <%--<script src="${ctx}/static/jquery-validation/1.11.1/jquery.validate.min.js" type="text/javascript"></script>--%>
    <%--<script src="${ctx}/static/jquery-validation/1.11.1/messages_bs_zh.js" type="text/javascript"></script>--%>
	<%--<title>登录页</title>--%>
<%--</head>--%>

<%--<body>--%>
	<%--<form id="loginForm" action="${ctx}/login" method="post" class="form-horizontal">--%>
	<%--<%--%>
	<%--String error = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);--%>
	<%--if(error != null){--%>
	<%--%>--%>
		<%--<div class="alert alert-error input-medium controls">--%>
			<%--<button class="close" data-dismiss="alert">×</button>登录失败，请重试.--%>
		<%--</div>--%>
	<%--<%--%>
	<%--}--%>
	<%--%>--%>
		<%--<div class="control-group">--%>
			<%--<label for="username" class="control-label">名称:</label>--%>
			<%--<div class="controls">--%>
				<%--<input type="text" id="username" name="username"  value="${username}" class="input-medium required"/>--%>
			<%--</div>--%>
		<%--</div>--%>
		<%--<div class="control-group">--%>
			<%--<label for="password" class="control-label">密码:</label>--%>
			<%--<div class="controls">--%>
				<%--<input type="password" id="password" name="password" class="input-medium required"/>--%>
			<%--</div>--%>
		<%--</div>--%>

		<%--<div class="control-group">--%>
			<%--<div class="controls">--%>
				<%--<label class="checkbox" for="rememberMe"><input type="checkbox" id="rememberMe" name="rememberMe"/> 记住我</label>--%>
				<%--<input id="submit_btn" class="btn btn-primary" type="submit" value="登录"/> <a class="btn" href="${ctx}/register">注册</a>--%>
			 	<%--<span class="help-block">(管理员: <b>admin/admin</b>, 普通用户: <b>user/user</b>)</span>--%>
			<%--</div>--%>
		<%--</div>--%>
	<%--</form>--%>

	<%--<script>--%>
		<%--$(document).ready(function() {--%>
			<%--$("#loginForm").validate();--%>
		<%--});--%>
	<%--</script>--%>
<%--</body>--%>
<%--</html>--%>

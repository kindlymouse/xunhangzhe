<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<div id="header">
    <div class="navbar">
        <div class="navbar-inner">
            <div class="container">
                <a class="brand" href="#"><span>九洲FSS</span></a>
                <div class="nav-collapse">
                    <ul class="nav">
                        <li id="nav_home"><a href="#">首页</a></li>
                        <li id="nav_info"><a href="${ctx}/airport">基础信息</a></li>
                        <li id="nav_brief"><a href="${ctx}/brief">简报管理</a></li>
                        <li id="nav_plan"><a href="${ctx}/plan">计划管理</a></li>
                        <li id="nav_social"><a href="${ctx}/social">分享管理</a>
                        </li>
                    </ul>
                </div>
                <ul class="nav pull-right"><shiro:user>

                    <shiro:hasRole name="admin"><li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="icon-wrench"></i>系统设置<i class="caret"></i>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="${ctx}/admin/user">用户管理</a></li>
                            <li><a href="${ctx}/admin/profile">系统参数</a></li>
                            <li><a href="${ctx}/admin/interface">接口设置</a></li>
                        </ul>
                    </li></shiro:hasRole>


                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="icon-user"></i> <shiro:principal property="name" />
                            <i class="caret"></i>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="${ctx}/profile">个人信息</a></li>
                            <li><a href="${ctx}/logout">注销</a></li>
                        </ul>
                    </li>
                </shiro:user></ul>
            </div><!-- /.nav-container -->
        </div><!--/navbar-inner-->
    </div>
</div>
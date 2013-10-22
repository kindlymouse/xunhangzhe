<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>图片查看</title>
</head>

<body>
<style>
    .main{
        width:890px;
        float:left;
        border:0px solid black;
    }
    .side{
        width:260px;
        float:right;
        border:0px solid black;
        background-color:#f7f7f7;
    }
    li{
        list-style: none;
        font-size:12px;
    }

    .mod18 {
                     WIDTH: 890px;
                     BACKGROUND: #f7f7f7; POSITION: relative;
                 }
    .mod18 .img_btn {
        CURSOR: pointer;
        POSITION: absolute;
        TOP: 213px;
        HEIGHT: 48px; WIDTH: 46px;
        Z-INDEX: 99;
    }
    .mod18 #prevTop {
        BACKGROUND: url(${ctx}/static/social/images/prevBtnTop.png) no-repeat 0px 0px;LEFT: 0px
    }
    .mod18 #nextTop {
        BACKGROUND: url(${ctx}/static/social/images/nextBtnTop.png) no-repeat 0px 0px;RIGHT: 0px
    }
    .mod18 .picBox {
        OVERFLOW: hidden; POSITION: relative;text-align: center;vertical-align: middle;
        min-height:320px;
    }
    .mod18 .picText{
        padding:5px ;
    }
    .mod18 .picText p{
        line-height: 24px;
    }
    .globalNav{
        height:40px;
        line-height:40px;
        padding-bottom:0px;
        border-bottom:2px solid #999;
    }
    .globalNav .commentTitle{
        padding-left:5px;
        font-family: "Microsoft Yahei";
        font-size:16px;
        font-weight:normal;
        float:left;
    }
    .globalNav .commentTotleNum{
        width:200px;
        line-height:28px;
        float:right;
        text-align: right;
        padding-right:5px;
        margin-top:12px;
    }

    #allComment ul{
        font-size:14px;
        margin-left:0px;
    }

    #allComment li.post{
        word-break:normal;
        word-wrap:break-word;
        line-height:1.8em;
        padding:15px 0px 2px 10px;
        border-bottom:1px solid #E6E6E6;
    }

    #allComment .post-header{
        padding-bottom:2px;
        line-height:1.5em;
        position:relative;
    }
    #allComment .post-header a{
        color:#333;
        cursor:pointer;
        font-size:12px;
        padding-left:14px;
        position:absolute;
        top:0;
        right:0;
    }

    #allComment .post-header .publisher{
        color:#455e85;
        font-size:12px;
        font-weight:600;
        padding-right:8px;
    }
    #allComment  .post-header .uptime{
        color:#999;
        font-size:12px;margin-left:5px;display: inline-block;padding-left:8px;
    }

</style>
<div class="clearfix" style="background-color:#f7f7f7">
    <div class="main">
        <div class="clearfix">

            <DIV class=mod18>
                <SPAN id=prevTop class="img_btn" onclick="javascript:<c:if test="${attachPre==null}">alert('已经是第一张了！');</c:if><c:if test="${attachPre!=null}">location.href='${ctx}/social/view/${attachPre.id}';</c:if>"></SPAN>
                <SPAN id=nextTop class="img_btn" onclick="javascript:<c:if test="${attachNext==null}">alert('已经是最后一张了！');</c:if><c:if test="${attachNext!=null}">location.href='${ctx}/social/view/${attachNext.id}';</c:if>"></SPAN>
                <DIV id=picBox class=picBox>
                    <IMG alt="" src="${ctx}/${attach.savePath}${attach.saveName}" style="margin:0px;max-width:890px;">
                </DIV>
                <DIV class="picText">
                    <p>${attach.description}<br/></p>
                </DIV>
            </DIV>
        </DIV>
    </div>
    <div class="side">
        <div id="product-secondary">
            <div class="clearfix" style="position: relative;">
                <div style="height:30px;line-height:30px;margin-top:10px;margin-right:5px;font-weight:600;font-size:14px;text-align: left;border-bottom:2px solid #999;">图片信息</div>
                <div>
                    <ul style="margin-left:5px;">
                        <li>图片名称：${attach.saveName}</li>
                        <li> 作者 ：${attach.user.name}
                        </li>
                        <li>发布时间：<fmt:formatDate value="${attach.ctime}" pattern="yyyy-MM-dd  HH:mm" /> </li>
                        <li class="current">
                            图片大小：${attach.size}  Bytes
                        </li>
                        <li>图片格式：${attach.attachType}</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

</div>
<div class="main clearfix">

    <div class="globalNav" id="globalNav">
        <div class="commentTotleNum">
            共 <span>${commentsCount}</span>条评论
        </div>
        <span class="commentTitle">网友评论</span>
    </div>
    <div id="allComment">
        <ul class="post-list">
            <c:if  test="${commentsCount == 0}">
                <li class="post">
                    <div class="post-content">
                        <div class="post-body">
                            <div class="post-message-container">
                                <div>评论为空！ <br/>
                                   </div>
                            </div>
                        </div>
                    </div>
                </li>
            </c:if>
<c:forEach items="${comments}" var="comment">
            <li class="post">
                <div class="post-content">
                    <div class="post-body">
                        <div class="post-header">
                            <a class="report" style="" href="${ctx}/social/delcomment/${comment.id}">删除</a>
                            <span class="publisher">${comment.user.name}</span>
                            <span class="uptime">发表于 <fmt:formatDate value="${comment.ctime}" pattern="yyyy-MM-dd  HH:mm" /></span></div>
                        <div class="post-message-container">
                            <div>${comment.content} <br/>
                                </div>
                        </div>
                    </div>
                </div>
            </li>
</c:forEach>
        </ul>
    </div>
</div>
</body>
</html>

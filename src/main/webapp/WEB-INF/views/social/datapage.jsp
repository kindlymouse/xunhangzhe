<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:forEach items="${attaches.content}" var="attach"  varStatus="status">
    <div class="item masonry_brick">
        <div class="item_t">
            <div class="img">
                <a href="#"><img width="210" height="164" alt="${attach.description}" src="${ctx}/static/social/images/pic/03.jpg" /></a>
            </div>
            <div class="title"><span>${attach.description}</span></div>
        </div>
        <div class="item_b clearfix">
            <div class="items_author fl">
                发布by ${attach.user.name} ${attach.id}
            </div>
            <div class="items_createtime fr"><em class="bold"><fmt:formatDate value="${attach.ctime}" pattern="yyyy-MM-dd  HH:mm"/></em></div>
        </div>
    </div><!--item end-->
</c:forEach>

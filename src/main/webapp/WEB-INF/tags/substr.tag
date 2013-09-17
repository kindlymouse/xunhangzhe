<%@tag pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ attribute name="var" type="java.lang.String" required="true"%>
<%@ attribute name="strlen" type="java.lang.Integer" required="true"%>

<c:choose>
    <c:when test="${fn:length(var) > strlen}">
        <c:out value="${fn:substring(var, 0, strlen)}..." />
    </c:when>
    <c:otherwise>
        <c:out value="${var}" />
    </c:otherwise>
</c:choose>

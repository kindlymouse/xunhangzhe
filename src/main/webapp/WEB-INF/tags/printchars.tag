<%@tag pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ attribute name="var" type="java.lang.String" required="true"%>

<%
    char[] chars = var.toCharArray();
    request.setAttribute("chars", chars);
%>
<c:forEach items="${chars}" var="mychar"><span class="c_1">${mychar}</span></c:forEach>

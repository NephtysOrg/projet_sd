<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <c:if test="${not empty users}">
        <c:forEach var="user" items="${users}">
            <c:out value="${user.getId()}"/>
            <c:out value="${user.getLogin()}"/>
        </c:forEach>
    </c:if>
    <c:if test="${empty users}">
        No users!
    </c:if>
    </body>
</html>

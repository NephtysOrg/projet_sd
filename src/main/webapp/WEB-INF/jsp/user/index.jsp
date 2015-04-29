<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:layout>
    <jsp:attribute name="header">
        Tous les utilisateurs
    </jsp:attribute>
    <jsp:body>
        <c:if test="${not empty users}">
            <div class="row">
                <c:forEach var="user" items="${users}">
                    <div class="col-lg-4">
                        <div class="contact-box">
                            <a href="<c:url value="/user/show/${user.getId()}"/>">
                                <div class="col-sm-8">
                                    <h3><strong>${user.getLogin()}</strong></h3>
                                    <p><i class="fa fa-map-marker"></i> ${user.getLocation().getLabel()}</p>
                                </div>
                                <div class="clearfix"></div>
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:if>
    </jsp:body>
</t:layout>
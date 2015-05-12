<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:layout>
    <jsp:attribute name="header">
        <h2>Tous les utilisateurs</h2>
        <ol class="breadcrumb">
           <li class="active"><strong>Utilisateurs</strong></li>
           <li></li>
        </ol>
    </jsp:attribute>
    <jsp:body>
        <c:if test="${not empty users}">
            <div class="row">
                <c:forEach var="user" items="${users}">
                    <a href="<c:url value="/user/show/${user.getId()}"/>">
                        <div class="col-sm-4">
                            <div class="widget-head-color-box navy-bg p-lg text-center">
                                <div class="m-b-md">
                                    <h2 class="font-bold no-margins">
                                        ${user.getLogin()}
                                    </h2>
                                    <small><i class="fa fa-map-marker"></i> ${user.getLocation().getLabel()}</small>
                                </div>
                            </div>
                        </div>
                    </a>
                </c:forEach>
            </div>
        </c:if>
    </jsp:body>
</t:layout>
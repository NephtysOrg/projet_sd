<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html><head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Chat++ | Nouveau compte</title>


        <link href="<c:url value="/assets/css/bootstrap.min.css"/>" rel="stylesheet">
        <link href="<c:url value="/assets/ont-awesome/css/font-awesome.css"/>" rel="stylesheet">
        <link href="<c:url value="/assets/css/animate.css"/>" rel="stylesheet">
        <link href="<c:url value="/assets/css/style.css"/>" rel="stylesheet">

        <style type="text/css"></style></head>

    <body class="gray-bg" cz-shortcut-listen="true">

        <div class="middle-box text-center loginscreen animated fadeInDown">
            <div>
                <div>

                    <h1 class="logo-name">C++</h1>

                </div>
                <h3>Bienvenue sur Chat++</h3>
                <p>Creez un compte.</p>
                <c:if test="${not empty callout}">
                    <div class="alert alert-${callout.getType()} alert-dismissable">
                        <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
                        <c:choose>
                            <c:when test="${callout.getType() eq \"warning\"}">
                                <i class="fa fa-warning"></i>
                            </c:when>
                            <c:when test="${callout.getType() eq 'success'}">
                                <i class="fa fa-check"></i>
                            </c:when>
                            <c:when test="${callout.getType() eq 'danger'}">
                                <i class="fa fa-ban"></i>
                            </c:when>
                        </c:choose>
                        <b><c:out value="${callout.getTitle()}"/>. </b>
                        <c:out value="${callout.getContent()}"/>
                    </div>
                </c:if>
                <form:form action="create" commandName="user" cssClass="m-t">
                    <div class="form-group">
                        <form:input path="login" cssClass="form-control" placeholder="Login"/>
                        <form:errors path="login" cssClass="text-danger"/>
                    </div>
                    <div class="form-group">
                        <form:password  path="password" cssClass="form-control" placeholder="Password"/>
                        <form:errors path="password" cssClass="text-danger"/>
                    </div>
                    <div class="form-group">
                        <form:input path="location.label" cssClass="form-control" placeholder="Localisation" />
                        <form:errors path="location.label" cssClass="text-danger"/>
                    </div>
                    <button type="submit" class="btn btn-primary block full-width m-b">Valider</button>

                    <p class="text-muted text-center"><small>Déja un compte?</small></p>
                    <a class="btn btn-sm btn-white btn-block" href="<c:url value="/user/login"/>">Se connecter</a>
                </form:form>

            </div>
        </div>

        <!-- Mainly scripts -->
        <script src="<c:url value="/assets/js/jquery-2.1.1.js"/>"></script>
        <script src="<c:url value="/assets/js/bootstrap.min.js"/>"></script>




    </body></html>
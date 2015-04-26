<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:layout>
    <jsp:attribute name="header">
        Détails de l'utilisateur
    </jsp:attribute>
    <jsp:body>
        <div class="row">
            <div class="col-lg-9">
                <div class="ibox">
                    <div class="ibox-content">
                        <div class="m-b-md">
                            <c:if test="${usr.getId() eq user.getId()}">
                                <c:url var="edit_url" value="/user/edit/${user.getId()}"/>
                                <a href="${edit_url}" class="btn btn-white btn-xs pull-right">Editer</a>
                            </c:if>
                            <h2>${usr.getLogin()}</h2>
                        </div>
                        <dl class="dl-horizontal">
                            <dt>Localisation</dt> <dd>${usr.getLocation().getLabel()}</dd>
                        </dl>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6">
                <div class="ibox">
                    <div class="ibox-title">
                        <h5>Les groupes</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">

                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Nom</th>
                                    <th>Statut</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="user_group" items="${usr.getUserGroups()}">
                                    <c:set var="group" value="${user_group.getGroup()}"/>
                                    <tr>
                                        <td>
                                            ${group.getName()}
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${group.getUser().getId() eq usr.getId()}">
                                                    <span class="badge badge-primary">Administrateur</span>
                                                </c:when>
                                                <c:when test="${user_group.getSubscribed() eq 1}">
                                                    <span class="badge badge-warning">Veut rejoindre</span>
                                                </c:when>
                                                <c:when test="${user_group.getInvited() eq 1}">
                                                    <span class="badge badge-warning">Invité</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge badge-success">Membre</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <a href="<c:url value="/group/show/${group.getId()}"/>" class="btn btn-info btn-xs">
                                                <i class="fa fa-eye"></i> Details
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</t:layout>

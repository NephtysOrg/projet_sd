<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:layout>
    <jsp:attribute name="header">
        Détails de groupe
    </jsp:attribute>
    <jsp:body>
        <div class="row">
            <div class="col-lg-9">
                <div class="ibox">
                    <div class="ibox-content">
                        <div class="m-b-md">
                            <c:if test="${group.getUser().getId() eq user.getId()}">
                                <c:url var="edit_url" value="/group/edit/${group.getId()}"/>
                                <a href="${edit_url}" class="btn btn-white btn-xs pull-right">Editer</a>
                            </c:if>
                            <h2>${group.getName()}</h2>
                        </div>
                        <dl class="dl-horizontal">
                            <dt>Description</dt> <dd>${group.getDescription()}</dd>
                            <c:url var="admin_url" value="/user/show/${group.getUser().getId()}"/>
                            <dt>Créé par :</dt> <dd><a href="${admin_url}">${group.getUser().getLogin()}</a></dd>
                        </dl>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Utilisateurs</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">

                        <table class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>Nom</th>
                                    <th>Statut</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="user_group" items="${group.getUserGroups()}">
                                    <c:set var="usr" value="${user_group.getUser()}"/>
                                    <tr>
                                        <td>
                                            ${usr.getLogin()}
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
                                            <a href="<c:url value="/user/show/${usr.getId()}"/>" class="btn btn-info btn-xs">
                                                <i class="fa fa-eye"></i> Details
                                            </a>
                                            <br/>
                                            <c:if test="${(group.getUser().getId() eq user.getId()) and (user_group.getSubscribed() eq 1)}">
                                                
                                                <a href="<c:url value="/user_group/accept/${group.getId()}/${usr.getId()}"/>" class="btn btn-warning btn-xs">
                                                    <i class="fa fa-check"></i> Accepter
                                                </a>
                                                <a href="<c:url value="/user_group/discard/${group.getId()}/${usr.getId()}"/>" class="btn btn-danger btn-xs">
                                                    <i class="fa fa-ban"></i> Refuser
                                                </a>
                                            </c:if>
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

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:layout>
    <jsp:attribute name="header">
        <h2>Détails de l'utilisateur</h2>
        <ol class="breadcrumb">
            <li><a href="<c:url value="/user/index"/>">Utilisateurs</a></li>
            <li class="active"><strong>Details de l'utilisateur</strong></li>
        </ol>
    </jsp:attribute>
    <jsp:body>
        <div class="row">
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading text-center">
                        <h5>Détails</h5>
                    </div>
                    <div class="panel-body">
                        <dl class="dl-horizontal">
                            <dt>Nom</dt> <dd>${usr.getLogin()}</dd>
                            <dt>Localisation</dt> <dd>${usr.getLocation().getLabel()}</dd>
                        </dl>
                    </div>
                    <div class="panel-footer text-center">
                        <c:if test="${usr.getId() eq user.getId()}">
                            <c:url var="edit_url" value="/user/edit/${user.getId()}"/>
                            <a href="${edit_url}" class="btn btn-warning btn-xs">Editer</a>
                        </c:if>
                    </div>
                </div>
            </div>

            <div class="col-md-8">
                <c:if test="${usr.getMemberGroup().size() + usr.getGroups().size() != 0}">
                    <div class="panel panel-default float-e-margins">
                        <div class="panel-heading text-center">
                            <h5>Les groupes</h5>
                        </div>
                        <div class="panel-body">

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
                </c:if>
                <c:if test="${usr.getMemberGroup().size() + usr.getGroups().size() == 0}">
                    <div class="widget  p-lg text-center">
                        <div class="m-b-md">
                            <i class="fa fa-info fa-4x"></i>
                            <h1 class="m-xs"></h1>
                            <h3 class="font-bold no-margins">
                                Aucun groupe à afficher pour cet utilisateur
                            </h3>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
    </jsp:body>
</t:layout>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<t:layout>
    <jsp:attribute name="header">
        <h2>Détails de groupe</h2>
        <ol class="breadcrumb">
            <li>
                <a href="<c:url value="/group/index"/>">Groupes</a>
            </li>
            <li class="active">
                <strong>Détails de groupe</strong>
            </li>
        </ol>
    </jsp:attribute>
    <jsp:attribute name="footer">
        <script>

            $(document).ready(function () {
                var config = {
                    '.chosen-select': {},
                    '.chosen-select-deselect': {allow_single_deselect: true},
                    '.chosen-select-no-single': {disable_search_threshold: 10},
                    '.chosen-select-no-results': {no_results_text: 'Oops, nothing found!'},
                    '.chosen-select-width': {width: "95%"}
                }
                for (var selector in config) {
                    $(selector).chosen(config[selector]);
                }

            });




        </script>
    </jsp:attribute>
    <jsp:body>
        <div class="row">
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading text-center">
                        <h3>Détails</h3>
                    </div>
                    <div class="panel-body">
                        <dl class="dl-horizontal">
                            <dt>Nom : </dt> <dd>${group.getName()}</dd>

                            <dt>Description : </dt> <dd>${group.getDescription()}</dd>
                            <c:url var="admin_url" value="/user/show/${group.getUser().getId()}"/>
                            <dt>Créé par :</dt> <dd><a href="${admin_url}">${group.getUser().getLogin()}</a></dd>
                            <dt>Membres : </dt>
                            <dd>
                                <c:if test="${group.getMembersNumber() > 0}">
                                    <span class="animated badge badge-info"><c:out value="${group.getMembersNumber()}"></c:out></span>
                                </c:if>
                                <c:if test="${group.getMembersNumber() eq 0}">
                                    <span class="badge"> <c:out value="${group.getMembersNumber()}"></c:out></span>
                                </c:if>
                            </dd>
                            <c:forEach items="${group.getMembers()}" var="group_member">
                                <dd>
                                    ${group_member.getLogin()}
                                    <c:if test="${group.getUser().getId() eq user.getId()}">
                                        <button class="text-danger btn btn-xs btn-link" data-toggle="modal" data-target="#modal-${group_member.getId()}">
                                            <i class="fa fa-ban"></i> 
                                        </button>
                                        <div class="modal inmodal fade" id="modal-${group_member.getId()}" tabindex="-1" role="dialog"  aria-hidden="true">
                                            <div class="modal-dialog modal-sm">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                                        <h4 class="modal-title">Confirmation</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <p>Vous êtes sur le point d'expulser <strong>${group_member.getLogin()}</strong> du groupe <strong>${group.getName()}</strong>.</p>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-white" data-dismiss="modal">Annuler</button>
                                                        <a href="<c:url value="/user_group/discard/${group.getId()}/${group_member.getId()}"/>" class="btn btn-primary">
                                                            Valider
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </dd>                                                        


                            </c:forEach>
                        </dl>

                    </div>
                    <c:if test="${group.getUser().getId() eq user.getId()}">
                        <div class="panel-footer text-center">
                            <c:url var="edit_url" value="/group/edit/${group.getId()}"/>
                            <a href="${edit_url}" class="btn btn-warning btn-xs">Editer</a>

                        </div>
                    </c:if>

                    <c:if test="${group.getMembers().contains(user)}">
                        <div class="panel-footer text-center">
                         <button type="submit" class="btn btn-warning btn-xs disabled"> <i class="fa fa-check"></i> Postuler</button>
                        </div>
                        </c:if>  
                    <c:if test="${!group.getMembers().contains(user) and group.getUser().getId() != user.getId()}">
                        <div class="panel-footer text-center">
                            <c:url var="url_join" value="/group/join"/>
                            <form:form action="${url_join}" commandName="group">
                                <input type="hidden" name="id" value="${group.getId()}"/>
                                <button type="submit" class="btn btn-warning btn-xs"> <i class="fa fa-check"></i> Postuler</button>
                            </form:form>
                        </div>
                    </c:if>

                </div>
            </div>

            <c:if test="${group.getUser().getId() eq user.getId()}">
                <div class="col-md-3">
                    <form action="<c:url value="/group/invite"/>" method="POST">
                        <div class="panel panel-default">
                            <div class="panel-heading text-center">
                                <h3>Envoyez des invitations</h3>
                            </div>
                            <div class="panel-body">
                                <div class="form-group">
                                    <label class="font-normal">Nom des invités</label>
                                    <div class="input-group">
                                        <input type="hidden" name="group_id" value="${group.getId()}"/>
                                        <select name="users" data-placeholder="Saisisez un nom" class="chosen-select" multiple style="width:200px;" tabindex="4">
                                            <c:forEach var="usr_invite" items="${users}">
                                                <option value="${usr_invite.getId()}"><c:out value="${usr_invite.getLogin()}"/></option>
                                            </c:forEach> 
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-footer text-center">
                                <button type="submit" class="btn btn-primary btn-xs">Valider</button>
                            </div>
                        </div>
                    </form>
                </div>

                <c:if test="${group.getSubscriptionNumber()+ group.getInvitedNumber() != 0}">                
                    <div class="col-md-5">
                        <div class="panel panel-default float-e-margins">
                            <div class="panel-heading text-center">
                                <h3>Invitations & Demandes en attente</h3>
                            </div>
                            <div class="panel-body">
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
                                            <c:if test="${user_group.getSubscribed()+user_group.getInvited() eq 1}">
                                                <tr>
                                                    <td>
                                                        ${usr.getLogin()}
                                                    </td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${user_group.getSubscribed() eq 1}">
                                                                <span class="badge badge-warning">Veut rejoindre</span>
                                                            </c:when>
                                                            <c:when test="${user_group.getInvited() eq 1}">
                                                                <span class="badge badge-warning">Invité</span>
                                                            </c:when>
                                                        </c:choose>
                                                    </td>
                                                    <td>
                                                        <a href="<c:url value="/user/show/${usr.getId()}"/>" class="btn btn-info btn-xs">
                                                            <i class="fa fa-eye"></i> Details
                                                        </a>
                                                        <br/>
                                                        <c:if test="${(group.getUser().getId() eq user.getId()) and (user_group.getSubscribed() eq 1)}">

                                                            <a href="<c:url value="/user_group/accept/${group.getId()}/${usr.getId()}"/>" class="btn btn-primary btn-xs">
                                                                <i class="fa fa-check"></i> Accepter
                                                            </a>
                                                            <a href="<c:url value="/user_group/discard/${group.getId()}/${usr.getId()}"/>" class="btn btn-danger btn-xs">
                                                                <i class="fa fa-ban"></i> Refuser
                                                            </a>
                                                        </c:if>
                                                        <c:if test="${(group.getUser().getId() eq user.getId()) and (user_group.getInvited() eq 1)}">
                                                            <a href="<c:url value="/user_group/discard/${group.getId()}/${usr.getId()}"/>" class="btn btn-danger btn-xs">
                                                                <i class="fa fa-ban"></i> Annuler
                                                            </a>
                                                        </c:if>
                                                        <c:if test="${(group.getUser().getId() eq user.getId()) and (user_group.getInvited()+user_group.getSubscribed() eq 0) and (user.getId() != user_group.getUser().getId())}">
                                                            <a href="<c:url value="/user_group/discard/${group.getId()}/${usr.getId()}"/>" class="btn btn-danger btn-xs">
                                                                <i class="fa fa-ban"></i> Expulser
                                                            </a>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                            </c:if>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </c:if>
                <c:if test="${group.getSubscriptionNumber()+ group.getInvitedNumber() == 0}">
                    <div class="widget  p-lg text-center">
                        <div class="m-b-md">
                            <i class="fa fa-info fa-4x"></i>
                            <h1 class="m-xs"></h1>
                            <h3 class="font-bold no-margins">
                                Aucune invitation et demande.
                            </h3>
                        </div>
                    </div>
                </c:if>
            </c:if>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox  panel-default float-e-margins">
                    <div class="ibox-title text-center">
                        Historique
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>

                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="panel-body ibox-content">

                        <div id="vertical-timeline" class="vertical-container dark-timeline center-orientation">
                            <c:forEach var="user_group" items="${group.getUserGroupsList()}">
                                <c:set var="usr" value="${user_group.getUser()}"/>
                                <c:if test="${user_group.getSubscribed()+user_group.getInvited() eq 0}">
                                    <div class="vertical-timeline-block">
                                        <div class="vertical-timeline-icon navy-bg">

                                            <c:choose>
                                                <c:when test="${group.getUser().getId() eq usr.getId()}">
                                                    <i class="fa fa-smile-o"></i>
                                                </c:when>
                                                <c:otherwise>
                                                    <i class="fa fa-user-plus"></i>
                                                </c:otherwise>

                                            </c:choose>
                                        </div>

                                        <div class="vertical-timeline-content">

                                            <c:choose>
                                                <c:when test="${group.getUser().getId() eq usr.getId()}">
                                                    <h2>${usr.getLogin()}</h2>
                                                    <p>A crée le groupe !</p>
                                                </c:when>
                                                <c:otherwise>
                                                    <h2>
                                                        ${usr.getLogin()}
                                                    </h2>
                                                    <p>A joint le groupe !</p>
                                                </c:otherwise>

                                            </c:choose>

                                            <span class="vertical-date">
                                                <small><fmt:formatDate value="${user_group.getMember_since()}" pattern="dd-MM-yyyy" /></small>
                                            </span>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>

</t:layout>

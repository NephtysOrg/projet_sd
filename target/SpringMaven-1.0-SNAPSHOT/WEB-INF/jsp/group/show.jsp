<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:layout>
    <jsp:attribute name="header">
        Détails de groupe
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
            <div class="col-lg-7">
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

            <c:if test="${group.getUser().getId() eq user.getId()}">
                <div class="col-lg-5">
                    <div class="panel">
                        <form action="<c:url value="/group/invite"/>" method="POST">
                            <div class="panel-heading">
                                <h4>Inviter des utilisateurs</h4>
                            </div>
                            <div class="panel-body">
                                <div class="form-group">
                                    <label class="font-normal">Invitez des utilisateurs</label>
                                    <div class="input-group">
                                        <input type="hidden" name="group_id" value="${group.getId()}"/>
                                        <select name="users" data-placeholder="Saisisez un nom" class="chosen-select" multiple style="width:350px;" tabindex="4">
                                            <c:forEach var="usr_invite" items="${users}">
                                                <option value="${usr_invite.getId()}"><c:out value="${usr_invite.getLogin()}"/></option>
                                            </c:forEach> 
                                        </select>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="input-group">
                                        <button type="submit" class="btn btn-primary btn-sm">Valider</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </c:if>
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
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>

</t:layout>

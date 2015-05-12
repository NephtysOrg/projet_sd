<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<t:layout>
    <jsp:attribute name="header">
        <h2>Espace personnel</h2>
        <ol class="breadcrumb">
            <li class="active"><strong>Espace personnel</strong></li>
           <li></li>
        </ol>
    </jsp:attribute>
    <jsp:attribute name="footer">
        <script>
            $('.datatable').dataTable({
                responsive: true
            });
        </script>
    </jsp:attribute>
    <jsp:body>
        <div class="row">
            <div class="col-md-12">
                <c:if test="${groups.size() !=  0}">
                <div class="panel panel-primary float-e-margins">
                    <div class="panel-heading text-center">
                        <h3>Vos groupes</h3>
                    </div>
                    <div class="panel-body">
                        <table class="table table-striped table-bordered table-hover" >
                            <thead>
                                <tr>
                                    <th>Nom</th>
                                    <th>Description</th>
                                    <th>Demandes</th>
                                    <th>Membres</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="group" items="${groups}">
                                    <tr>
                                        <td>
                                            <c:out value="${group.getName()}"></c:out>
                                            </td>
                                            <td>
                                            <c:out value="${group.getDescription()}"></c:out>
                                            </td> 
                                            <td>
                                            <c:if test="${group.getSubscriptionNumber() > 0}">
                                                <span class="animated bounce badge badge-info"><a href="<c:url value="/group/show/${group.getId()}"/>">
                                                        <c:out value="${group.getSubscriptionNumber()}"></c:out></a>
                                                    </span>
                                            </c:if>
                                            <c:if test="${group.getSubscriptionNumber() eq 0}">
                                                <span class="badge">
                                                    <c:out value="${group.getSubscriptionNumber()}"></c:out>
                                                    </span>
                                            </c:if>
                                        </td>
                                        <td>
                                            <c:if test="${group.getMembersNumber() > 0}">
                                                <span class="animated badge badge-info">
                                                    <c:out value="${group.getMembersNumber()}"></c:out>
                                                    </span>
                                            </c:if>
                                            <c:if test="${group.getMembersNumber() eq 0}">
                                                <span class="badge">
                                                    <c:out value="${group.getMembersNumber()}"></c:out>
                                                    </span>
                                            </c:if>
                                        </td>
                                        <td>
                                            <a href="<c:url value="/group/edit/${group.getId()}"/>" class="btn btn-warning btn-xs">
                                                <i class="fa fa-edit"></i> Editer
                                            </a>
                                            <br/>
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
                <c:if test="${groups.size() == 0}">
                    <div class="widget  p-lg text-center">
                        <div class="m-b-md">
                            <i class="fa fa-bell-o fa-4x"></i>
                          
                            <h3 class="font-bold no-margins">
                                Vous n'avez pas encore de groupe.
                            </h3>
                            <small><a href="<c:url value="/group/create"/>">Créez un groupe</a></small>
                        </div>
                    </div>
                </c:if>
                </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <c:if test="${member_groups.size() !=  0}">
                <div class="panel panel-primary float-e-margins">
                    <div class="panel-heading text-center">
                        <h3>Les groupes dont je suis membre</h3>
                    </div>
                    <div class="panel-body">
                        <table class="table table-striped table-bordered table-hover" >
                            <thead>
                                <tr>
                                    <th>Nom</th>
                                    <th>Description</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="group" items="${member_groups}">
                                    <tr>
                                        <td>
                                            <c:out value="${group.getName()}"></c:out>
                                            </td>
                                            <td>
                                            <c:out value="${group.getDescription()}"></c:out>

                                            </td> 
                                            <td>
                                                <button class="btn btn-danger btn-xs" data-toggle="modal" data-target="#modal-${group.getId()}"><i class="fa fa-ban"></i> 
                                                Quitter
                                            </button>
                                            <div class="modal inmodal fade" id="modal-${group.getId()}" tabindex="-1" role="dialog"  aria-hidden="true">
                                                <div class="modal-dialog modal-sm">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                                            <h4 class="modal-title">Validation</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <p>Vous êtes sur le point de quitter le groupe <strong>${group.getName()}</strong>.</p>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-white" data-dismiss="modal">Annuler</button>
                                                            <a href="<c:url value="/user_group/discard/${group.getId()}/${user.getId()}"/>" class="btn btn-primary">
                                                                Valider
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>



                                            <br/>
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
                <c:if test="${member_groups.size() ==  0}">
                    <div class="widget  p-lg text-center">
                        <div class="m-b-md">
                            <i class="fa fa-bell-o fa-4x"></i>
                          
                            <h3 class="font-bold no-margins">
                                Vous n'êtes membre d'aucun groupe.
                            </h3>
                            <small><a href="<c:url value="/group/index"/>">Rejoignez  un groupe</a></small>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
        <div class="row">
            <c:if test="${invitation_groups.size() !=  0}">
            <div class="col-md-6">
                <div class="panel panel-green float-e-margins">
                    <div class="panel-heading text-center">
                        <h3>Vos invitations en attente</h3>
                    </div>
                    <div class="panel-body">
                        <table class="table table-striped table-bordered table-hover" >
                            <thead>
                                <tr>
                                    <th>Nom</th>
                                    <th>Description</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="group" items="${invitation_groups}">
                                    <tr>
                                        <td>
                                            <c:out value="${group.getName()}"></c:out>
                                            </td>
                                            <td>
                                            <c:out value="${group.getDescription()}"></c:out>
                                            </td> 
                                            <td>
                                                <a href="<c:url value="/user_group/discard/${group.getId()}/${user.getId()}"/>" class="btn btn-danger btn-xs">
                                                <i class="fa fa-times"></i> Refuser
                                            </a>
                                            <a href="<c:url value="/user_group/accept/${group.getId()}/${user.getId()}"/>" class="btn btn-primary btn-xs">
                                                <i class="fa fa-check"></i> Accepter
                                            </a>
                                            <br>
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
            </c:if>
            <c:if test="${subscription_groups.size() !=  0}">
            <div class="col-md-6">
                <div class="panel panel-green float-e-margins">
                    <div class="panel-heading text-center">
                        <h3>Vos demandes en attente</h3>
                    </div>
                    <div class="panel-body">
                        <table class="table table-striped table-bordered table-hover" >
                            <thead>
                                <tr>
                                    <th>Nom</th>
                                    <th>Description</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="group" items="${subscription_groups}">
                                    <tr>
                                        <td>
                                            <c:out value="${group.getName()}"></c:out>
                                            </td>
                                            <td>
                                            <c:out value="${group.getDescription()}"></c:out>
                                            </td> 
                                            <td>
                                                <a href="<c:url value="/user_group/discard/${group.getId()}/${user.getId()}"/>" class="btn btn-danger btn-xs">
                                                <i class="fa fa-times"></i> Annuler
                                            </a>
                                            <br/>
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
            </c:if>
            </div>
    </jsp:body>

</t:layout>

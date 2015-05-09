<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<t:layout>

    <jsp:attribute name="footer">
        <script>
            $('.datatable').dataTable({
                responsive: true
            });
        </script>
    </jsp:attribute>
    <jsp:attribute name="header">
        <h2>Les groupes</h2>
        <ol class="breadcrumb">
            <li class="active"><strong>Groupes</strong></li>
            <li></li>
        </ol>
    </jsp:attribute>
    <jsp:body>
        <div class="row">
            <div class="col-lg-12">
                <c:if test="${groups.size()!= 0}">
                    <div class="panel panel-default float-e-margins">
                        <div class="panel-heading text-center">
                            <h3>Tous les groupes <button type="button" class="btn btn-xs btn-link text-info" data-container="body" data-toggle="popover" data-placement="right" data-content="Tapez 'postuler' pour voir les groupes auquels vous pouvez postuler ou 'editer' pour voir vos groupes." data-original-title="" title="Aide">
                                    <i class="fa fa-question"></i>
                                </button></h3>
                        </div>
                        <div class="panel-body">
                            <table class="table table-striped table-bordered table-hover datatable" >
                                <thead>
                                <th>Nom</th>
                                <th>Descritpion</th>
                                <th>Administrateur</th>
                                <th>Action</th>
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
                                                <c:out value="${group.getUser().getLogin()}"></c:out>
                                                </td>      
                                                <td>
                                                    <a href="<c:url value="/group/show/${group.getId()}"/>" class="btn btn-info btn-xs">
                                                    <i class="fa fa-eye"></i> Détails
                                                </a>
                                                <c:if test="${user.getGroups().contains(group)}">
                                                    <br>
                                                    <a href="<c:url value="/group/edit/${group.getId()}"/>" class="btn btn-warning btn-xs">
                                                        <i class="fa fa-edit"></i> Editer
                                                    </a>
                                                </c:if>

                                                <c:if test="${!user.getGroups().contains(group) and !group.getMembers().contains(user)}">
                                                    <c:url var="url_join" value="/group/join"/>
                                                    <form:form action="${url_join}" commandName="group">
                                                        <input type="hidden" name="id" value="${group.getId()}"/>
                                                        <button type="submit" class="btn btn-warning btn-xs"> <i class="fa fa-check"></i> Postuler</button>
                                                    </form:form>
                                                </c:if>
                                                <c:if test="${group.getMembers().contains(user)}">
                                                    <br><button type="submit" class="btn btn-warning btn-xs disabled"> <i class="fa fa-check"></i> Postuler</button>
                                                </c:if>           
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
                                Il n'y a aucun groupe.
                            </h3>
                            <small><a href="<c:url value="/group/create"/>">Créez un groupe</a></small>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
    </jsp:body>
</t:layout>

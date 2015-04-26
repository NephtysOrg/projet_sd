<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<t:layout>
    <jsp:attribute name="header">
        <h1>Espace personnel</h1>
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
            <div class="col-md-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Vos groupes</h5>
                    </div>
                    <div class="ibox-content">
                        <table class="table table-striped table-bordered table-hover" >
                            <thead>
                                <tr>
                                    <th>Nom</th>
                                    <th>Description</th>
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
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Vos invitations</h5>
                    </div>
                    <div class="ibox-content">
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
            <div class="col-md-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Vos demandes en attentes</h5>
                    </div>
                    <div class="ibox-content">
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
        </div>
    </jsp:body>

</t:layout>

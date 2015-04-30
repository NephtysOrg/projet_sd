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
    <jsp:body>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default float-e-margins">
                    <div class="panel-heading">
                        Tous les groupes
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

                                            <c:if test="${!user.getGroups().contains(group)}">
                                                <c:url var="url_join" value="/group/join"/>
                                                <form:form action="${url_join}" commandName="group">
                                                    <input type="hidden" name="id" value="${group.getId()}"/>
                                                    <button type="submit" class="btn btn-warning btn-xs <c:if test="${group.getSubscribers().contains(user)}">disabled</c:if>"> <i class="fa fa-check"></i> Postuler</button>
                                                </form:form>
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

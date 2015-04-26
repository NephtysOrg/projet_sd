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
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Tous les groupes</h5>
                    </div>
                    <div class="ibox-content">
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
                                                <form:form action="join" commandName="group">
                                                    <input type="hidden" name="id" value="${group.getId()}"/>
                                                    <button type="submit" class="btn btn-warning btn-xs"> <i class="fa fa-check"></i> Postuler</button>
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
        </jsp:body>
    </t:layout>

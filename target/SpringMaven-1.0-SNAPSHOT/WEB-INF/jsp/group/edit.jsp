<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:layout>
    <jsp:attribute name="header">
        <h2>Edition du groupe <small><strong> <c:out value="${group.getName()}"/></strong></small></h2>
        <ol class="breadcrumb">
            <li>
                <a href="<c:url value="/group/index"/>">Groupes</a>
            </li>
            <li class="active">
                <strong>Edition de groupe</strong>
            </li>
        </ol>
    </jsp:attribute>
    <jsp:attribute name="footer">
        <script>
            $('#form-submit-btn').click(function () {
                $('form').submit();
            });
            function populateModal() {
                $('#group-name-dialog').text($("input[name='name']").val());
                $('#group-description-dialog').text($("textarea#description").val());
            }
        </script>
    </jsp:attribute>
    <jsp:body>
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <c:url var="post_url"  value="${$group.getId()}" />
                <form:form action="${post_url}" commandName="group">
                    <div class="panel panel-default float-e-margins">
                        <div class="panel-heading text-center">
                            <h3>Edition</h3>
                            <small>Veuillez remplir les informations</small>
                        </div>
                        <div class="panel-body">
                            

                            <div class="form-group">
                                <label>Nom</label>
                                <form:input path="name" cssClass="form-control" placeholder="Nom"/>
                                <form:errors path="name" cssClass="text-danger"/>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <form:textarea path="description" cssClass="form-control" placeholder="Description"/>
                                <form:errors path="description" cssClass="text-danger"/>
                            </div>


                        </div>
                        <div class="panel-footer text-center">
                            <a class="btn btn-primary" onclick="populateModal()" data-toggle="modal" data-target="#modal">
                                Valider 
                            </a>
                            <div class="modal inmodal fade" id="modal" tabindex="-1" role="dialog"  aria-hidden="true">
                                <div class="modal-dialog modal-sm">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                            <h4 class="modal-title">Confirmation</h4>
                                        </div>
                                        <div class="modal-body">
                                            <p>
                                                <b>Nom du groupe : </b><span id="group-name-dialog"></span><br>
                                                <b>Description du groupe : </b><span id="group-description-dialog"></span>
                                            </p>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-white" data-dismiss="modal">Annuler</button>
                                            <button type="submit" id="form-submit-btn" class="btn btn-primary">Valider</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </jsp:body>
</t:layout>

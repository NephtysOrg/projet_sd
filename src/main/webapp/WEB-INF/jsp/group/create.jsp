<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:layout>
    <jsp:attribute name="header">
        Création de groupe
    </jsp:attribute>
    <jsp:body>
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <form:form action="create"  commandName="group">
                    <div class="panel panel-default float-e-margins">
                        <div class="panel-heading text-center">
                            Création <br>
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
                            <button type="submit" class="btn btn-primary">Valider</button>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </jsp:body>
</t:layout>

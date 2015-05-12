<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:layout>
    <jsp:attribute name="header">
        <h2>Edition de l'utilisateu</h2>
        <ol class="breadcrumb">
            <li>
                <a href="<c:url value="/user/index"/>">Utilisateurs</a>
            </li>
            <li class="active">
                <strong>Edition d'utilisateur</strong>
            </li>
        </ol>
    </jsp:attribute>
    <jsp:attribute name="footer">
        <script>
            $('#form-submit-btn').click(function () {
                $('form').submit();
            });
            function populateModal() {
                $('#user-login-dialog').text($("input[name='login']").val());
                $('#user-password-dialog').text($("input[name='password']").val());
                $('#user-location-dialog').text($("input[name='location.label']").val());
            }
            
            $(document).ready(function () {
                var dataSource = [
            <c:forEach items="${locations}" var="loc">
                    "${loc}",
            </c:forEach>
                ];
                $('#location').autocomplete({
                    source: dataSource
                });

            });
        </script>
    </jsp:attribute>
    <jsp:body>
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <c:url var="post_url"  value="${usr.getId()}" />
                <form:form action="${post_url}" commandName="usr">
                    <div class="panel panel-default float-e-margins">
                        <div class="panel-heading text-center">
                            <h3>Edition</h3>
                            <small>Veuillez remplir les informations</small>
                        </div>
                        <div class="panel-body">
                            <div class="form-group">
                                <div class="input-group">
                                    <form:input path="login" cssClass="form-control" placeholder="Login"/>
                                    <div class="input-group-btn">
                                        <button type="button" class="btn btn-xs btn-link text-info" data-container="body" data-toggle="popover" data-placement="right" data-content="Le login est une chaine de 5 à 20 carractères." data-original-title="" title="Aide">
                                            <i class="fa fa-question"></i>
                                        </button>
                                    </div>
                                </div>
                                <form:errors path="login" cssClass="text-danger"/>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <form:password  path="password" cssClass="form-control" placeholder="Mot de passe"/>
                                    <div class="input-group-btn">
                                        <button type="button" class="btn btn-xs btn-link text-info" data-container="body" data-toggle="popover" data-placement="right" data-content="Le mot de passe est une chaine de 5 à 20 carractères." data-original-title="" title="Aide">
                                            <i class="fa fa-question"></i>
                                        </button>
                                    </div>
                                </div>
                                <form:errors path="password" cssClass="text-danger"/>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <form:input id="location" path="location.label" cssClass="form-control" placeholder="Localisation" />
                                    <div class="input-group-btn">
                                        <button type="button" class="btn btn-xs btn-link text-info" data-container="body" data-toggle="popover" data-placement="right" data-content="La localication est une chaine de 3 à 20 carractères." data-original-title="" title="Aide">
                                            <i class="fa fa-question"></i>
                                        </button>
                                    </div>
                                </div>
                                <form:errors path="location.label" cssClass="text-danger"/>
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
                                                <b>Login : </b><span id="user-login-dialog"></span><br>
                                                <b>Mot de passe : </b><span id="user-password-dialog"></span><br>
                                                <b>Localisation : </b><span id="user-location-dialog"></span>
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

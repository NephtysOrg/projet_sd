<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<t:layout>
    <jsp:attribute name="header">
        <h1>Questions fréquentes</h1>
    </jsp:attribute>
    <jsp:body>
        <div class="row">
            <div class="col-lg-12">
                <div class="wrapper wrapper-content animated fadeInRight">

                    <div class="faq-item">
                        <div class="row">
                            <div class="col-md-7">
                                <a data-toggle="collapse" href="#faq1" class="faq-question collapsed" aria-expanded="false"> Comment créer un groupe?</a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div id="faq1" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
                                    <div class="faq-answer">
                                        <p>
                                            Cliquez sur le menu <b><i class="fa fa-group"></i> Groupes</b>
                                            puis sur <b><i class="fa fa-plus"></i> Creer un groupe</b>. Ensuite, vous devrez saisir les informations correspondantes.
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="faq-item">
                        <div class="row">
                            <div class="col-md-7">
                                <a data-toggle="collapse" href="#faq2" class="faq-question collapsed" aria-expanded="false"> Comment rejoindre un groupe?</a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div id="faq2" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
                                    <div class="faq-answer">
                                        <p>
                                            Cliquez sur le menu <b><i class="fa fa-group"></i> Groupes</b>
                                            puis sur <b><i class="fa fa-list-alt"></i> Voir les groupes</b>. Ensuite, cliquez sur
                                            <button type="submit" class="btn btn-warning btn-xs"> <i class="fa fa-check"></i> Postuler</button> sur le groupe en question.
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="faq-item">
                        <div class="row">
                            <div class="col-md-7">
                                <a data-toggle="collapse" href="#faq3" class="faq-question collapsed" aria-expanded="false"> Comment inviter des utilisateurs à rejoinder mon groupe?</a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div id="faq3" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
                                    <div class="faq-answer">
                                        <p>
                                            Cliquez sur <i class="fa fa-home"></i> <span class="nav-label">Espace personnel</span>. Dans l'onglet <span class="label label-primary">Vos groupes</span>, 
                                            reperez le groupe dans lequel vous voulez inviter des utilisateurs et cliquez sur <button class="btn btn-info btn-xs">
                                                <i class="fa fa-eye"></i> Details</button>. Vous arrivez sur la page du groupe dans laquelle vous pouvez inviter des utilisateurs.
                                            </a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="faq-item">
                        <div class="row">
                            <div class="col-md-7">
                                <a data-toggle="collapse" href="#faq4" class="faq-question collapsed" aria-expanded="false">Comment puis-je savoir si un groupe refuse ma demande ?</a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div id="faq4" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
                                    <div class="faq-answer">
                                        <p>
                                            Malheureusement, nous n'avons pas encore développé cette fonctionnalité.
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>

</t:layout>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<t:layout>
    <jsp:attribute name="header">
        <h2>Aide</h2>
        <ol class="breadcrumb">
            <li class="active"><strong>Aide</strong></li>
           <li></li>
        </ol>
    </jsp:attribute>
    <jsp:body>
        <div class="row">
            <div class="col-md-8">
                <div class="panel panel-default">
                    <div class="panel-heading text-center">
                        <h3>Questions fréquentes</h3>
                    </div>
                    <div class="panel-body">
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
                                                    Cliquez sur <b><i class="fa fa-coffee"></i> Groupes</b>
                                                    puis sur <b>Creer un groupe</b>. Ensuite, saisissez les informations correspondantes.
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
                                                    Cliquez sur <b><i class="fa fa-coffee"></i> Groupes</b>
                                                    puis sur <b>Voir les groupes</b>, enfin sur
                                                    <button type="submit" class="btn btn-warning btn-xs"> <i class="fa fa-check"></i> Postuler</button> sur le groupe voulu.<br>
                                                    Vous pouvez aussi postuler depuis la page détail d'un groupe.
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="faq-item">
                                <div class="row">
                                    <div class="col-md-7">
                                        <a data-toggle="collapse" href="#faq3" class="faq-question collapsed" aria-expanded="false"> Comment inviter des utilisateurs à rejoindre mon groupe?</a>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div id="faq3" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
                                            <div class="faq-answer">
                                                <p>
                                                    Cliquez sur <b><i class="fa fa-home"></i> <span class="nav-label">Espace personnel</span></b>. Dans la boite <span class="label label-primary">Mes groupes</span>, 
                                                    repérez le groupe qui correspond et cliquez sur <button class="btn btn-info btn-xs">
                                                        <i class="fa fa-eye"></i> Details</button>. Inserez le nom de votre (vos) invité(s) à l'endroit prévu à cet effet.
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
                                        <a data-toggle="collapse" href="#faq4" class="faq-question collapsed" aria-expanded="false">Comment savoir si un groupe refuse ma demande ?</a>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div id="faq4" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
                                            <div class="faq-answer">
                                                <p>
                                                    Malheureusement, nous n'avons pas encore développé cette fonctionnalité. Regardez dans votre  <b><i class="fa fa-home"></i> <span class="nav-label">Espace personnel</span></b> si votre demande est toujours en attente.
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading text-center">
                        <h3>Plan du site</h3>
                    </div>
                    <div class="panel-body">
                        <ul>
                            <li>Espace personnel</li>
                            <li>Groupes</li>
                            <ul>
                                <li>Créer un groupe</li>
                                <li>Voir les groupes</li>
                            </ul>
                            <li>Utilisateurs</li>
                            <ul>
                                <li>Voir les utilisateurs</li>
                            </ul>
                            <li>Aide</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>

</t:layout>

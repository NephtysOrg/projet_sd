<%@tag description="Overall Page template" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@attribute name="header" fragment="true" %>
<%@attribute name="footer" fragment="true" %>

<!DOCTYPE html>
<html>
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Chat ++ | Empty Page</title>

        <link href="<c:url value="/assets/css/bootstrap.min.css"/>" rel="stylesheet">
        <link href="<c:url value="/assets/font-awesome/css/font-awesome.css"/>" rel="stylesheet">

        <link href="<c:url value="/assets/css/plugins/dataTables/dataTables.bootstrap.css"/>" rel="stylesheet">
        <link href="<c:url value="/assets/css/plugins/dataTables/dataTables.responsive.css"/>" rel="stylesheet">
        <link href="<c:url value="/assets/css/plugins/dataTables/dataTables.tableTools.min.css"/>" rel="stylesheet">

        <link href="<c:url value="/assets/css/animate.css"/>" rel="stylesheet">
        <link href="<c:url value="/assets/css/style.css"/>" rel="stylesheet">

    </head>

    <body>

        <div id="wrapper">
            <nav class="navbar-default navbar-static-side" role="navigation">
                <div class="sidebar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="nav-header">
                            <div class="dropdown profile-element"> 
                                <div class="text-center">
                                    <h2 class="text-navy"><b>Chat</b> ++</h2>

                                    <div class="m-b-sm">
                                        <img alt="image" class="text-center" src="<c:url value="/assets/img/logo.png"/>" />
                                    </div>
                                </div>


                            </div>
                            <div class="logo-element">
                                C++
                            </div>
                        </li>
                        <li><div class="divider"></div></li>
                        <li>
                            <a href="<c:url value="/home"/>"><i class="fa fa-home"></i> <span class="nav-label">Espace personnel</span> </a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-group"></i> <span class="nav-label">Groupes</span><span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li><a class="fa fa-plus" href="<c:url value="/group/create"/>"> Créer un groupe</a></li>
                                <li><a class="fa fa-list-alt" href="<c:url value="/group/index"/>"> Voir les groupes</a></li>
                            </ul>
                        </li>
                    </ul>

                </div>
            </nav>

            <div id="page-wrapper" class="gray-bg" style="min-height: 659px;">
                <div class="row border-bottom">
                    <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                        <div class="navbar-header">
                            <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
                        </div>
                        <ul class="nav navbar-top-links navbar-right">
                            <li><a href="user/show/${user.getId()}"><c:out value="${user.getLogin()}"/></a></li>
                            <li>
                                <a href="<c:url value="/user/logout"/>">
                                    <i class="fa fa-sign-out"></i> Deconnexion
                                </a>
                            </li>
                        </ul>

                    </nav>
                </div>
                <div class="row wrapper border-bottom white-bg page-heading">
                    <div class="col-lg-10">
                        <h2><jsp:invoke fragment="header"/></h2>
                    </div>
                    <div class="col-lg-2">

                    </div>
                </div>
                <div class="wrapper wrapper-content animated fadeInRight">
                    <c:if test="${not empty callout}">
                        <div class="alert alert-${callout.getType()} alert-dismissable">
                            <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
                            <c:out value="${callout.getContent()}"/>
                        </div>
                    </c:if>

                    <jsp:doBody/>
                </div>
                <div class="footer">
                    <div>
                        <strong>Copyright</strong> Example Company © 2014-2015
                    </div>
                </div>

            </div>
        </div>

        <!-- Mainly scripts -->
        <script src="<c:url value="/assets/js/jquery-2.1.1.js"/>"></script>
        <script src="<c:url value="/assets/js/bootstrap.min.js"/>"></script>
        <script src="<c:url value="/assets/js/plugins/metisMenu/jquery.metisMenu.js"/>"></script>
        <script src="<c:url value="/assets/js/plugins/slimscroll/jquery.slimscroll.min.js"/>"></script>

        <!-- Data Tables -->
        <script src="<c:url value="/assets/js/plugins/dataTables/jquery.dataTables.js"/>"></script>
        <script src="<c:url value="/assets/js/plugins/dataTables/dataTables.bootstrap.js"/>"></script>
        <script src="<c:url value="/assets/js/plugins/dataTables/dataTables.responsive.js"/>"></script>
        <script src="<c:url value="/assets/js/plugins/dataTables/dataTables.tableTools.min.js"/>"></script>

        <!-- Custom and plugin javascript -->
        <script src="<c:url value="/assets/js/inspinia.js"/>"></script>
        <script src="<c:url value="/assets/js/plugins/pace/pace.min.js"/>"></script>

        <jsp:invoke fragment="footer"/>
    </body>

</html>

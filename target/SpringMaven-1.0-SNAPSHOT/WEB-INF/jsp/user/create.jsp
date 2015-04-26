<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      
      <!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Chat ++ | Nouveau compte</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.2 -->
    <link href="<c:url value="/theme/bootstrap/css/bootstrap.min.css" />" rel="stylesheet">
    <link href="<c:url value="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" />" rel="stylesheet">
    <link href="<c:url value="/theme/dist/css/AdminLTE.min.css" />" rel="stylesheet">
    <link href="<c:url value="/theme/dist/css/skins/_all-skins.min.css" />" rel="stylesheet">
    
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
  </head>
  <body class="register-page">
    <div class="register-box">
      <div class="register-logo">
          <span><b>Chat</b> ++</span>
      </div>

      <div class="register-box-body">
        <p class="login-box-msg">Créez un nouveau compte</p>
        <form:form action="create"  commandName="user">
          <div class="form-group has-feedback">
            <form:input path="login" cssClass="form-control"  placeholder="Nom d'utilisateur" />
            <span class="glyphicon glyphicon-user form-control-feedback"></span>
            <form:errors path="login" cssClass="text-red"/>
          </div>
          <div class="form-group has-feedback">
            <form:password cssClass="form-control" path="password"  placeholder="Mot de passe"/>
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            <form:errors path="password" cssClass="text-red"/>
          </div>
          <div class="form-group has-feedback">
              <form:input path="location.label" cssClass="form-control" placeholder="Localisation" />
            <span class="glyphicon glyphicon-map-marker form-control-feedback"></span>
            <form:errors path="location.label" cssClass="text-red"/>
          </div>
          
          <div class="row">
            <div class="col-xs-8">    
                       
            </div><!-- /.col -->
            <div class="col-xs-4">
              <button type="submit" class="btn bg-purple btn-block btn-flat">Valider</button>
            </div><!-- /.col -->
          </div>
        </form:form>        

        <a href="login" class="text-purple text-center">Je possède déjà un compte.</a>
      </div><!-- /.form-box -->
    </div><!-- /.register-box -->

    <!-- jQuery 2.1.3 -->
    <script src="../../plugins/jQuery/jQuery-2.1.3.min.js"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="../../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- iCheck -->
    <script src="../../plugins/iCheck/icheck.min.js" type="text/javascript"></script>
    <script>
      $(function () {
        $('input').iCheck({
          checkboxClass: 'icheckbox_square-blue',
          radioClass: 'iradio_square-blue',
          increaseArea: '20%' // optional
        });
      });
    </script>
  </body>
</html>

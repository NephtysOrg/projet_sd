<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <body>
        <c:out value="${message}"/>
        <form:form action="login" commandName="user">
          <div class="form-group has-feedback">
              <form:input path="login" cssClass="form-control" placeholder="Login"/>
            <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
              <form:password  path="password" cssClass="form-control" placeholder="Password"/>
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          </div>
          <div class="row">
              <div class="col-xs-6"></div>
            <div class="col-xs-6">
              <button type="submit" class="btn bg-purple btn-block btn-flat">Se connecter</button>
            </div><!-- /.col -->
          </div>
        </form:form>
        
  </body>
</html>
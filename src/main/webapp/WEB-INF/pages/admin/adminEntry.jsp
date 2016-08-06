<%@ page language="java" contentType="text/html; charset=utf8"
         pageEncoding="utf8" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="cs" lang="cs">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name='robots' content='all, follow' />
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <title>Great admin</title>
    <link href="../resources/admin/css/login.css" rel="stylesheet" type="text/css" />
    <link href="../resources/admin/css/login-gray.css" rel="stylesheet" type="text/css" />  <!-- color skin: blue / red / green / dark -->
</head>
<body>
<div id="main">
    <div id="content">
        <div id="login">

            <div id="logo"><span>Great Admin</span></div>

            <c:if test="${not empty error}">
                <h2 style="color: #fff">${error}</h2>
            </c:if>
            <c:if test="${not empty msg}">
                <h2 style="color: #fff">${msg}</h2>
            </c:if>

            <c:url value="/admin/j_spring_security_check" var="loginUrl" />
            <form:form class="formBox" id="form-login" action="${loginUrl}" method="post">
                <fieldset>
                    <div class="form-col">
                        <label for="username" class="lab">Username</label>
                        <input type="text" name="username" class="input" id="username" />
                    </div>
                    <div class="form-col form-col-right">
                        <label for="password" class="lab">Password</label>
                        <input type="password" name="password" class="input" id="password" />
                    </div>
                    <div class="form-col form-col-check">
                        <label><input type="checkbox" name="remeber_me" class="checkbox" />Remember me on this computer</label>
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <div class="form-col form-col-right">
                        <input type="submit" value="Login" class="submit" />
                    </div>
                </fieldset>
            </form:form>

        </div>
    </div><!-- /content -->
</div><!-- /main -->
</body>
</html>
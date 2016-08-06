<%@ page language="java" contentType="text/html; charset=utf8" pageEncoding="utf8" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html>
<html lang="en">
<head>
    <!-- Meta -->
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">

    <title>HMC. <spring:message code="authentication.authentication"/></title>

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="../resources/css/bootstrap.min.css" type="text/css" media="screen"/>

    <!-- Customizable CSS -->
    <link rel="stylesheet" href="../resources/css/main.css" type="text/css" media="screen"/>
    <link rel="stylesheet" href="../resources/css/green.css" type="text/css" media="screen"/>
    <link rel="stylesheet" href="../resources/css/owl.carousel.css" type="text/css" media="screen"/>
    <link rel="stylesheet" href="../resources/css/owl.transitions.css" type="text/css" media="screen"/>
    <link rel="stylesheet" href="../resources/css/animate.min.css" type="text/css" media="screen"/>

    <!-- Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800' rel='stylesheet' type='text/css'>

    <!-- Icons/Glyphs -->
    <link rel="stylesheet" href="../resources/css/font-awesome.min.css" type="text/css" media="screen"/>

    <!-- Favicon -->
    <link rel="shortcut icon" href="../resources/images/favicon.ico">

</head>
<body>

<div class="wrapper">
<%@include file="insertions/header.jsp" %>
<div id="top-mega-nav">
    <div class="container">
        <nav>
            <ul class="inline">
                <%@include file="insertions/shopByDepartment.jsp" %>

                <li class="breadcrumb-nav-holder">
                    <ul>
                        <li class="breadcrumb-item gray">
                            <a href="/"><spring:message code="common.home"/></a>
                        </li>
                        <li class="breadcrumb-item current">
                            <a onclick="window.location.reload(true);">
                                <h1 class="h2 department-h1"><spring:message code="authentication.authentication"/></h1>
                            </a>
                        </li>
                    </ul>
                </li><!-- /.breadcrumb-nav-holder -->
            </ul>
        </nav>
    </div><!-- /.container -->
</div><!-- /#top-mega-nav -->
<!-- ============================================================= HEADER : END ============================================================= -->
    <!-- ========================================= MAIN ========================================= -->
<main id="authentication" class="inner-bottom-md">
	<div class="container">
		<div class="row">

            <c:if test="${not empty error}">
                <h2>${error}</h2>
            </c:if>
            <c:if test="${not empty msg}">
                <h2>${msg}</h2>
            </c:if>

            <div class="col-md-6">
				<section class="section sign-in inner-right-xs">
					<h2 class="bordered"><spring:message code="common.signIn"/></h2>

                    <c:url value="/hmc/j_spring_security_check" var="loginUrl" />
                    <form:form class="login-form cf-style-1" action="${loginUrl}" method="post">
						<div class="field-row">
                            <label><spring:message code="authentication.usernameOrEmail"/></label>
                            <input type="text" class="le-input" name="username">
                        </div><!-- /.field-row -->

                        <div class="field-row">
                            <label><spring:message code="authentication.password"/></label>
                            <input type="password" class="le-input" name="password">
                        </div><!-- /.field-row -->

                        <div class="field-row clearfix">
                        	<span class="pull-left">
                        		<label class="content-color">
                                    <input type="checkbox" class="le-checbox auto-width inline" name="_spring_security_remember_me" />
                                    <span class="bold"><spring:message code="authentication.rememberMe"/></span>
                                </label>
                        	</span>
                        	<span class="pull-right">
                        		<a class="content-color bold"><spring:message code="authentication.forgotPassword"/></a>
                        	</span>
                        </div>

                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                        <div class="buttons-holder">
                            <button type="submit" class="le-button huge"><spring:message code="common.signIn"/></button>
                        </div><!-- /.buttons-holder -->
					</form:form><!-- /.cf-style-1 -->

				</section><!-- /.sign-in -->
			</div><!-- /.col -->

			<div class="col-md-6">
				<section class="section register inner-left-xs">
                    <h2 class="bordered"><spring:message code="authentication.registration"/></h2>
                    <h2 style="text-transform: none !important; font-size: 23px"><spring:message code="authentication.registrationText"/></h2>
				</section><!-- /.register -->
			</div><!-- /.col -->

		</div><!-- /.row -->
	</div><!-- /.container -->
</main><!-- /.authentication -->
<!-- ========================================= MAIN : END ========================================= -->		<!-- ============================================================= FOOTER ============================================================= -->
    <%@include file="insertions/footer.jsp" %>
    <!-- ============================================================= FOOTER : END ============================================================= -->
</div>
<!-- JavaScripts placed at the end of the document so the pages load faster -->
<script src="../resources/js/jquery-1.10.2.min.js"></script>
<script src="../resources/js/jquery-migrate-1.2.1.js"></script>
<script src="../resources/js/bootstrap.min.js"></script>
<script src="http://maps.google.com/maps/api/js?sensor=false&amp;language=en"></script>
<script src="../resources/js/gmap3.min.js"></script>
<script src="../resources/js/bootstrap-hover-dropdown.min.js"></script>
<script src="../resources/js/owl.carousel.min.js"></script>
<script src="../resources/js/css_browser_selector.min.js"></script>
<script src="../resources/js/echo.min.js"></script>
<script src="../resources/js/jquery.easing-1.3.min.js"></script>
<script src="../resources/js/bootstrap-slider.min.js"></script>
<script src="../resources/js/jquery.raty.min.js"></script>
<script src="../resources/js/jquery.prettyPhoto.min.js"></script>
<script src="../resources/js/jquery.customSelect.min.js"></script>
<script src="../resources/js/wow.min.js"></script>
<script src="../resources/js/scripts.js"></script>
<script src="http://w.sharethis.com/button/buttons.js"></script>
<script src="../resources/js/comparison,wishlist,cart,common.jsp"></script>
</body>
</html>
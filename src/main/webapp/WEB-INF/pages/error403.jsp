<%@ page language="java" contentType="text/html; charset=utf8" pageEncoding="utf8" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html>
<html lang="en">
<head>
    <!-- Meta -->
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="keywords" content="MediaCenter, Template, eCommerce">
    <meta name="robots" content="all">

    <title>HMC. 403 - <spring:message code="error.403"/></title>

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
    <%@include file="hmc/insertions/header.jsp" %>
        <br><br>
    <div class="container">
        <div class="row">
            <div class="col-md-8 center-block">
                <div class="info-404 text-center">
                    <h2 class="primary-color inner-bottom-xs">403</h2>

                    <h1 class="lead"><spring:message code="error.full403"/></h1>

                    <div class="text-center">
                        <a href="/admin/adminEntry" class="btn-lg huge"><i class="fa fa-key"></i> <spring:message
                                code="error.goToAuthorization"/></a><br>
                        or<br>
                        <a href="/" class="btn-lg huge"><i class="fa fa-home"></i> <spring:message
                                code="error.goToHomePage"/></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
        <br><br><br>
    <%@include file="hmc/insertions/footer.jsp" %>

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
    <script src="../resources/js/filters.jsp"></script>
    <script src="../resources/js/comparison,wishlist,cart,common.jsp"></script>
</body>
</html>
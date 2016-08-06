<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Meta -->
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <meta name="keywords" content='<spring:message code="common.keywords"/>'>
    <meta name="description" content='<spring:message code="common.description"/>'>

    <title><spring:message code="common.hmcTitle"/></title>

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="resources/css/bootstrap.min.css" type="text/css" media="screen"/>

    <!-- Customizable CSS -->
    <link rel="stylesheet" href="resources/css/main.css" type="text/css" media="screen"/>
    <link rel="stylesheet" href="resources/css/green.css" type="text/css" media="screen"/>
    <link rel="stylesheet" href="resources/css/owl.carousel.css" type="text/css" media="screen"/>
    <link rel="stylesheet" href="resources/css/owl.transitions.css" type="text/css" media="screen"/>
    <link rel="stylesheet" href="resources/css/animate.min.css" type="text/css" media="screen"/>

    <!-- Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800' rel='stylesheet' type='text/css'>

    <!-- Icons/Glyphs -->
    <link rel="stylesheet" href="resources/css/font-awesome.min.css" type="text/css" media="screen"/>

    <!-- Favicon -->
    <link rel="shortcut icon" href="resources/images/favicon.ico">

    <script>
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r;
            i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date();
            a = s.createElement(o),
                    m = s.getElementsByTagName(o)[0];
            a.async = 1;
            a.src = g;
            m.parentNode.insertBefore(a, m)
        })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');

        ga('create', 'UA-75911811-4', 'auto');
        ga('send', 'pageview');

    </script>

</head>
<body>

<div class="wrapper">
<%@include file="hmc/insertions/navigation.jsp" %>
<!-- ================================================ HEADER ======================================================= -->
<header>
    <div class="container no-padding">

        <div class="col-xs-12 col-sm-12 col-md-3 logo-holder">
            <!-- ============================================================= LOGO ============================================================= -->
            <div class="logo">
                <a href="/">
                    <img alt="hmccnc.com" src="../resources/images/vmc_and_hmc.svg" width="233" height="54"/>
                </a>
            </div>
            <!-- /.logo -->
            <!-- ============================================================= LOGO : END ============================================================= -->
        </div>
        <!-- /.logo-holder -->

        <div class="col-xs-12 col-sm-12 col-md-5 top-search-holder no-margin">
            <div class="contact-row">
                <div class="phone inline">
                    <i class="fa fa-phone"></i> <spring:message code="common.usa"/>: <span class="le-color">+1 203 556-50-69</span><br>
                </div>
                <br>

                <div class="contact inline">
                    <i class="fa fa-envelope"></i> contact@<span class="le-color">hmccnc.com</span>
                </div>
            </div>
            <!-- /.contact-row -->
        </div>
        <!-- /.top-search-holder -->

        <div class="col-xs-12 col-sm-12 col-md-4 top-cart-row no-margin">
            <div class="top-cart-row-container">
                <div class="wishlist-compare-holder">
                    <div class="wishlist">
                        <a onclick="goToWishList()"><i class="fa fa-heart"></i> <spring:message code="common.wishList"/> <span
                                id="wishList-value"></span> </a>
                    </div>
                    <div class="compare">
                        <a onclick="goToComparison()"><i class="fa fa-exchange"></i> <spring:message
                                code="common.comparison"/> <span
                                id="compare-value"></span> </a>
                    </div>
                </div>

                <!-- ============================================================= SHOPPING CART DROPDOWN ============================================================= -->
                <div class="top-cart-holder dropdown animate-dropdown">

                    <div class="basket">

                        <a class="dropdown-toggle" data-toggle="dropdown">
                            <div class="basket-item-count">
                                <span class="count" id="cart-count"></span>
                                <img src="resources/images/icon-cart.png"/>
                            </div>

                            <div class="total-price-basket">
                                <span class="lbl"><spring:message code="common.cart"/></span>
                                <span class="total-price"
                                      <c:if test='${pageContext.request.userPrincipal.name == null}'>style="display: none"</c:if>>
                                    <span class="sign">$</span><span class="value cart-total">0</span>
                                </span>
                            </div>
                        </a>

                        <ul class="dropdown-menu">
                            <li id="li1" class="hidden">
                                <div class="basket-item">
                                    <div class="row">
                                        <div class="col-xs-4 col-sm-4 no-margin text-center">
                                            <div class="thumb">
                                                <img width="75" height="75" src="resources/images/blank.gif">
                                            </div>
                                        </div>
                                        <div class="col-xs-8 col-sm-8 no-margin">
                                            <div class="title"></div>
                                            <div class="price"
                                                 <c:if test="${pageContext.request.userPrincipal.name == null}">style="display: none"</c:if>></div>
                                        </div>
                                    </div>
                                    <a class="close-btn" onclick="window.location.reload(true);"></a>
                                </div>
                            </li>
                            <li id="li2" class="hidden">
                                <div class="basket-item">
                                    <div class="row">
                                        <div class="col-xs-4 col-sm-4 no-margin text-center">
                                            <div class="thumb">
                                                <img width="75" height="75" src="resources/images/blank.gif">
                                            </div>
                                        </div>
                                        <div class="col-xs-8 col-sm-8 no-margin">
                                            <div class="title"></div>
                                            <div class="price"
                                                 <c:if test="${pageContext.request.userPrincipal.name == null}">style="display: none"</c:if>></div>
                                        </div>
                                    </div>
                                    <a class="close-btn" onclick="window.location.reload(true);"></a>
                                </div>
                            </li>
                            <li id="li3" class="hidden">
                                <div class="basket-item">
                                    <div class="row">
                                        <div class="col-xs-4 col-sm-4 no-margin text-center">
                                            <div class="thumb">
                                                <img width="75" height="75" src="resources/images/blank.gif">
                                            </div>
                                        </div>
                                        <div class="col-xs-8 col-sm-8 no-margin">
                                            <div class="title"></div>
                                            <div class="price"
                                                 <c:if test="${pageContext.request.userPrincipal.name == null}">style="display: none"</c:if>></div>
                                        </div>
                                    </div>
                                    <a class="close-btn" onclick="window.location.reload(true);"></a>
                                </div>
                            </li>
                            <li class="checkout">
                                <div class="basket-item">
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-6">
                                            <a class="le-button" onclick="goToCart()"><spring:message
                                                    code="common.viewCart"/></a>
                                        </div>
                                        <div class="col-xs-12 col-sm-6">
                                            <a onclick="goToCheckout()" class="le-button"><spring:message
                                                    code="common.checkout"/></a>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <!--/.basket-->
                </div>

                <!-- /.top-cart-holder -->
            </div>
            <!-- /.top-cart-row-container -->
            <!-- ============================================================= SHOPPING CART DROPDOWN : END ============================================================= -->
        </div>
        <!-- /.top-cart-row -->

    </div>
    <!-- /.container -->
</header>
<!-- =============================================== HEADER : END ================================================ -->

<div id="top-banner-and-menu">
    <div class="container">
        <br><br>
        <div class="col-xs-12 col-sm-4 col-md-3 sidemenu-holder">
            <div class="side-menu animate-dropdown">
                <div class="head">
                    <i class="fa fa-list"></i><spring:message code="index.allDepartments"/>
                </div>
                <nav class="yamm megamenu-horizontal" role="navigation">
                    <ul class="nav">
                        <li class="dropdown menu-item">
                            <a onclick="goToHmc()">
                                <h1 class="h2 no-margin" style="font-size: 15px; line-height: 26px; letter-spacing: normal; text-transform: none;">
                                    <spring:message code="common.hmc"/>
                                </h1>
                            </a>
                            <a href="http://vmccnc.com/vmc" target="_blank"><spring:message code="common.vmc"/></a>
                            <a href="/lathe" target="_blank"><spring:message code="common.lathe"/></a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>

        <div class="col-xs-12 col-sm-8 col-md-9 homebanner-holder">
            <div id="hero">
                <div class="video-container">
                    <iframe width="853" height="480" src="https://www.youtube.com/embed/yzZXBudVT_Y" frameborder="0"
                            allowfullscreen></iframe>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /.container -->

<!-- /.Featured machines and new arrivals -->
<c:if test="${!empty randomMachineList}">
    <div id="products-tab" class="wow fadeInUp">
        <div class="container">
            <div class="tab-holder">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#featured" data-toggle="tab"><spring:message
                            code="common.featuredMachines"/></a></li>
                    <li><a href="#new-arrivals" data-toggle="tab"><spring:message code="common.newArrivals"/></a></li>
                </ul>

                <!-- Tab panes -->
                <div class="tab-content">

                    <div class="tab-pane active" id="featured">
                        <div class="product-grid-holder">
                            <c:forEach items="${randomMachineList}" var="machine">
                                <div class="col-sm-4 col-md-3  no-margin product-item-holder hover">
                                    <div class="product-item">
                                        <div class="image">
                                            <img alt="${machine.machineTypeEn} - ${machine.productId}"
                                                 src="../resources/images/blank.gif"
                                                 data-echo="../resources/images/products/${machine.photo1}"/>
                                            <span class="photo${machine.productId} hidden">${machine.photo1}</span>
                                        </div>
                                        <div class="body">
                                            <div class="title">
                                                <a href="/hmc${machine.productId}">
                                                        ${machine.machineTypeEn}<br>
                                                    <span class="model${machine.productId}">${machine.model}</span>
                                                </a>
                                            </div>
                                            <div class="brand">
                                                <span class="brand${machine.productId}">${machine.brand}</span>, ${machine.productionYear}, ${machine.producingCountryEn}<br>
                                                <spring:message code="machine.machineCondition"/>: ${machine.machineConditionEn}<br>
                                                <spring:message code="machine.location"/>: ${machine.machineLocationEn}<br>
                                            </div>
                                        </div>
                                        <div class="prices"
                                             <c:if test="${pageContext.request.userPrincipal.name == null}">style="display: none"</c:if>>
                                            <div class="price-current pull-right">
                                                $<span class="price${machine.productId}">${machine.price}</span>
                                            </div>
                                            <br>
                                        </div>

                                        <div class="hover-area">
                                            <div class="add-cart-button">
                                                <a class="cart${machine.productId} le-button"
                                                   onclick="addToCart('${machine.productId}')">
                                                    <spring:message code="common.addToCart"/>
                                                </a>
                                                <a class="cart${machine.productId} le-button in-cart hidden"
                                                   onclick="removeFromCart('${machine.productId}')">
                                                    <spring:message code="common.inCart"/>
                                                </a>
                                            </div>
                                            <div class="wish-compare">
                            <span class="wishList${machine.productId} btn-add-to-wishlist"
                                  onclick="addToWishList('${machine.productId}')">
                                <spring:message code="common.addToWishList"/>
                            </span>
                            <span class="wishList${machine.productId} btn-add-to-wishlist btn-green hidden"
                                  onclick="removeFromWishList('${machine.productId}')">
                                <spring:message code="common.removeFromWishList"/>
                            </span>
                                                <br>
                            <span class="compare${machine.productId} btn-add-to-compare"
                                  onclick="addToComparison('${machine.productId}')">
                                <spring:message code="common.addToComparison"/>
                            </span>
                            <span class="compare${machine.productId} btn-add-to-compare btn-green hidden"
                                  onclick="removeFromComparison('${machine.productId}')">
                                <spring:message code="common.removeFromComparison"/>
                            </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>

                    <div class="tab-pane" id="new-arrivals">
                        <div class="product-grid-holder">
                            <c:forEach items="${newArrivalsList}" var="machine">
                                <div class="col-sm-4 col-md-3  no-margin product-item-holder hover">
                                    <div class="product-item">
                                        <div class="image">
                                            <img alt="${machine.machineTypeEn} - ${machine.productId}"
                                                 src="../resources/images/blank.gif"
                                                 data-echo="../resources/images/products/${machine.photo1}"/>
                                            <span class="photo${machine.productId} hidden">${machine.photo1}</span>
                                        </div>
                                        <div class="body">
                                            <div class="title">
                                                <a href="/hmc${machine.productId}">
                                                        ${machine.machineTypeEn}<br>
                                                    <span class="model${machine.productId}">${machine.model}</span>
                                                </a>
                                            </div>
                                            <div class="brand">
                                                <span class="brand${machine.productId}">${machine.brand}</span>, ${machine.productionYear}, ${machine.producingCountryEn}<br>
                                                <spring:message code="machine.machineCondition"/>: ${machine.machineConditionEn}<br>
                                                <spring:message code="machine.location"/>: ${machine.machineLocationEn}<br>
                                            </div>
                                        </div>
                                        <div class="prices"
                                             <c:if test="${pageContext.request.userPrincipal.name == null}">style="display: none"</c:if>>
                                            <div class="price-current pull-right">
                                                $<span class="price${machine.productId}">${machine.price}</span>
                                            </div>
                                            <br>
                                        </div>

                                        <div class="hover-area">
                                            <div class="add-cart-button">
                                                <a class="cart${machine.productId} le-button"
                                                   onclick="addToCart('${machine.productId}')">
                                                    <spring:message code="common.addToCart"/>
                                                </a>
                                                <a class="cart${machine.productId} le-button in-cart hidden"
                                                   onclick="removeFromCart('${machine.productId}')">
                                                    <spring:message code="common.inCart"/>
                                                </a>
                                            </div>
                                            <div class="wish-compare">
                            <span class="wishList${machine.productId} btn-add-to-wishlist"
                                  onclick="addToWishList('${machine.productId}')">
                                <spring:message code="common.addToWishList"/>
                            </span>
                            <span class="wishList${machine.productId} btn-add-to-wishlist btn-green hidden"
                                  onclick="removeFromWishList('${machine.productId}')">
                                <spring:message code="common.removeFromWishList"/>
                            </span>
                                                <br>
                            <span class="compare${machine.productId} btn-add-to-compare"
                                  onclick="addToComparison('${machine.productId}')">
                                <spring:message code="common.addToComparison"/>
                            </span>
                            <span class="compare${machine.productId} btn-add-to-compare btn-green hidden"
                                  onclick="removeFromComparison('${machine.productId}')">
                                <spring:message code="common.removeFromComparison"/>
                            </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</c:if>
<!-- /.Featured machines and new arrivals - end -->

</div>
<!-- /#top-banner-and-menu -->

<br><br><br><br>
<!-- ========================================= MAIN : END ========================================= -->
<!-- ============================================================= FOOTER ============================================================= -->
<%@include file="hmc/insertions/footer.jsp" %>
<!-- ============================================================= FOOTER : END ============================================================= -->
</div>
<!-- JavaScripts placed at the end of the document so the pages load faster -->
<script src="resources/js/jquery-1.10.2.min.js"></script>
<script src="resources/js/jquery-migrate-1.2.1.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="http://maps.google.com/maps/api/js?sensor=false&amp;language=en"></script>
<script src="resources/js/gmap3.min.js"></script>
<script src="resources/js/bootstrap-hover-dropdown.min.js"></script>
<script src="resources/js/owl.carousel.min.js"></script>
<script src="resources/js/css_browser_selector.min.js"></script>
<script src="resources/js/echo.min.js"></script>
<script src="resources/js/jquery.easing-1.3.min.js"></script>
<script src="resources/js/bootstrap-slider.min.js"></script>
<script src="resources/js/jquery.raty.min.js"></script>
<script src="resources/js/jquery.prettyPhoto.min.js"></script>
<script src="resources/js/jquery.customSelect.min.js"></script>
<script src="resources/js/wow.min.js"></script>
<script src="resources/js/scripts.js"></script>
<script src="http://w.sharethis.com/button/buttons.js"></script>
<script src="resources/js/comparison,wishlist,cart,common.jsp"></script>

</body>
</html>
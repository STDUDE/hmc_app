<%@ page language="java" contentType="text/html; charset=utf8"
         pageEncoding="utf8" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html>
<html lang="en">
<head>
    <!-- Meta -->
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">

    <title>HMC. ${machine.machineTypeEn} - ${machine.productId}</title>

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
                        <li class="breadcrumb-item gray">
                            <a onclick="goToHmc()"><spring:message code="common.hmc"/></a>
                        </li>
                        <li class="breadcrumb-item current">
                            <a onclick="window.location.reload(true);">
                                <h1 class="h2 department-h1">${machine.machineTypeEn} - ${machine.productId}</h1>
                            </a>
                        </li>
                    </ul>
                </li>
                <!-- /.breadcrumb-nav-holder -->
            </ul>
        </nav>
    </div>
    <!-- /.container -->
</div>
<!-- /#top-mega-nav -->

<br>

<div id="single-product">
    <div class="container">

        <div class="no-margin col-xs-12 col-sm-6 col-md-5 gallery-holder">
            <div class="product-item-holder size-big single-product-gallery small-gallery">

                <div id="owl-single-product">
                    <div class="single-product-gallery-item" id="slide1">
                        <a data-rel="prettyphoto" href="../resources/images/products/${machine.photo1}">
                            <img class="img-responsive" alt="" src="../resources/images/blank.gif"
                                 data-echo="../resources/images/products/${machine.photo1}"/>
                            <span class="photo${machine.productId} hidden">${machine.photo1}</span>
                        </a>
                    </div>

                    <c:if test="${machine.photo2!=''}">
                        <div class="single-product-gallery-item" id="slide2">
                            <a data-rel="prettyphoto" href="../resources/images/products/${machine.photo2}">
                                <img class="img-responsive" alt="" src="../resources/images/blank.gif"
                                     data-echo="../resources/images/products/${machine.photo2}"/>
                            </a>
                        </div>
                    </c:if>

                    <c:if test="${machine.photo3!=''}">
                        <div class="single-product-gallery-item" id="slide3">
                            <a data-rel="prettyphoto" href="../resources/images/products/${machine.photo3}">
                                <img class="img-responsive" alt="" src="../resources/images/blank.gif"
                                     data-echo="../resources/images/products/${machine.photo3}"/>
                            </a>
                        </div>
                    </c:if>

                    <c:if test="${machine.photo4!=''}">
                        <div class="single-product-gallery-item" id="slide4">
                            <a data-rel="prettyphoto" href="../resources/images/products/${machine.photo4}">
                                <img class="img-responsive" alt="" src="../resources/images/blank.gif"
                                     data-echo="../resources/images/products/${machine.photo4}"/>
                            </a>
                        </div>
                    </c:if>

                    <c:if test="${machine.photo5!=''}">
                        <div class="single-product-gallery-item" id="slide5">
                            <a data-rel="prettyphoto" href="../resources/images/products/${machine.photo5}">
                                <img class="img-responsive" alt="" src="../resources/images/blank.gif"
                                     data-echo="../resources/images/products/${machine.photo5}"/>
                            </a>
                        </div>
                    </c:if>

                </div>
                <!-- /.single-product-slider -->

                <div class="single-product-gallery-thumbs gallery-thumbs">

                    <div id="owl-single-product-thumbnails">
                        <a class="horizontal-thumb active" data-target="#owl-single-product" data-slide="0"
                           href="#slide1">
                            <img width="67" alt="" src="../resources/images/blank.gif"
                                 data-echo="../resources/images/products/${machine.photo1}"/>
                        </a>

                        <c:if test="${machine.photo2!=''}">
                            <a class="horizontal-thumb" data-target="#owl-single-product" data-slide="1" href="#slide2">
                                <img width="67" alt="" src="../resources/images/blank.gif"
                                     data-echo="../resources/images/products/${machine.photo2}"/>
                            </a>
                        </c:if>

                        <c:if test="${machine.photo3!=''}">
                            <a class="horizontal-thumb" data-target="#owl-single-product" data-slide="2" href="#slide3">
                                <img width="67" alt="" src="../resources/images/blank.gif"
                                     data-echo="../resources/images/products/${machine.photo3}"/>
                            </a>
                        </c:if>

                        <c:if test="${machine.photo4!=''}">
                            <a class="horizontal-thumb" data-target="#owl-single-product" data-slide="3" href="#slide4">
                                <img width="67" alt="" src="../resources/images/blank.gif"
                                     data-echo="../resources/images/products/${machine.photo4}"/>
                            </a>
                        </c:if>

                        <c:if test="${machine.photo5!=''}">
                            <a class="horizontal-thumb" data-target="#owl-single-product" data-slide="4" href="#slide5">
                                <img width="67" alt="" src="../resources/images/blank.gif"
                                     data-echo="../resources/images/products/${machine.photo5}"/>
                            </a>
                        </c:if>
                    </div>
                    <!-- /#owl-single-product-thumbnails -->

                </div>
                <!-- /.gallery-thumbs -->

            </div>
            <!-- /.single-product-gallery -->
        </div>
        <!-- /.gallery-holder -->

        <div class="no-margin col-xs-12 col-sm-7 body-holder">
            <div class="body">
                <div class="title">
                    <a>${machine.machineTypeEn} - <span class="model${machine.productId}">${machine.model}</span></a>
                </div>
                <div class="brand">
                    <big>
                        <span class="brand${machine.productId}">${machine.brand}</span><br>
                        <spring:message code="machine.productId"/>: ${machine.productId}
                    </big>
                </div>

                <div class="buttons-holder">
                    <span class="wishList${machine.productId} btn-add-to-wishlist"
                          onclick="addToWishList('${machine.productId}')"><spring:message
                            code="common.addToWishList"/></span>
                    <span class="wishList${machine.productId} btn-add-to-wishlist btn-green hidden"
                          onclick="removeFromWishList('${machine.productId}')"><spring:message
                            code="common.removeFromWishList"/></span>
                    <span class="compare${machine.productId} btn-add-to-compare" data-toggle="popover"
                          onclick="addToComparison('${machine.productId}')"><spring:message
                            code="common.addToComparison"/></span>
                    <span class="compare${machine.productId} btn-add-to-compare btn-green hidden" data-toggle="popover"
                          onclick="removeFromComparison('${machine.productId}')"><spring:message
                            code="common.removeFromComparison"/></span>
                </div>

                <div class="excerpt">
                    <p>${machine.descriptionEn}</p>
                </div>

                <div class="prices"
                     <c:if test="${pageContext.request.userPrincipal.name == null}">style="display: none"</c:if>>
                    <div class="price-current">$<span class="price${machine.productId}">${machine.price}</span></div>
                </div>

                <div class="qnt-holder">
                    <a class="cart${machine.productId} le-button huge"
                       onclick="addToCart('${machine.productId}')"><spring:message code="common.addToCart"/></a>
                    <a class="cart${machine.productId} le-button huge in-cart hidden"
                       onclick="removeFromCart('${machine.productId}')"><spring:message code="common.inCart"/></a>
                    &nbsp;&nbsp;
                    <a class="le-button huge" href="/hmc/proposalSingle?productId=${machine.productId}"><spring:message
                            code="cart.getCommercialProposal"/> (PDF)</a>
                </div>
            </div>

        </div>
    </div>
</div>

<!-- ========================================= SINGLE PRODUCT TAB ========================================= -->
<section id="single-product-tab">
    <div class="container">
        <div class="tab-holder">

            <ul class="nav nav-tabs simple">
                <li class="active"><a href="#description" data-toggle="tab"><spring:message code="machine.video"/></a>
                </li>
                <li><a href="#additional-info" data-toggle="tab"><spring:message
                        code="machine.additionalInformation"/></a></li>
            </ul>

            <div class="tab-content">
                <div class="tab-pane active container-fluid no-padding" id="description">
                    <div class="col-xs-12 col-md-7 no-padding">
                        <c:if test="${machine.video1!=''}">
                            <div class="video-container">
                                <iframe width="560" height="315" src="${machine.video1}" frameborder="0"
                                        allowfullscreen></iframe>
                            </div>
                            <br><br>
                        </c:if>
                        <c:if test="${machine.video2!=''}">
                            <div class="video-container">
                                <iframe width="560" height="315" src="${machine.video2}" frameborder="0"
                                        allowfullscreen></iframe>
                            </div>
                            <br><br>
                        </c:if>
                        <c:if test="${machine.video3!=''}">
                            <div class="video-container">
                                <iframe width="560" height="315" src="${machine.video3}" frameborder="0"
                                        allowfullscreen></iframe>
                            </div>
                        </c:if>
                        <c:if test="${machine.video1=='' && machine.video2=='' && machine.video3==''}">
                            <div class="video-container">
                                <iframe width="560" height="315" src="https://www.youtube.com/embed/0YSScR4PbLw"
                                        frameborder="0"
                                        allowfullscreen></iframe>
                            </div>
                        </c:if>
                    </div>
                </div>

                <div class="tab-pane" id="additional-info">
                    <ul class="tabled-data">
                        <li>
                            <label><spring:message code="machine.type"/></label>

                            <div class="value">${machine.machineTypeEn}</div>
                        </li>
                        <li>
                            <label><spring:message code="machine.model"/></label>

                            <div class="value">${machine.model}</div>
                        </li>
                        <li>
                            <label><spring:message code="machine.brand"/></label>

                            <div class="value">${machine.brand}</div>
                        </li>
                        <li>
                            <label><spring:message code="machine.producingCountry"/></label>

                            <div class="value">${machine.producingCountryEn}</div>
                        </li>
                        <li>
                            <label><spring:message code="machine.systemCnc"/></label>

                            <div class="value">${machine.fullSystemCNC}</div>
                        </li>
                        <li>
                            <label><spring:message code="machine.productionYear"/></label>

                            <div class="value">${machine.productionYear}</div>
                        </li>
                        <li>
                            <label><spring:message code="machine.machineCondition"/></label>

                            <div class="value">${machine.machineConditionEn}</div>
                        </li>
                        <li>
                            <label><spring:message code="machine.location"/></label>

                            <div class="value">${machine.machineLocationEn}</div>
                        </li>
                        <li>
                            <label><spring:message code="machine.axisCount"/></label>

                            <div class="value">${machine.axisCount}</div>
                        </li>
                        <li>
                            <label><spring:message code="machine.motion"/>X&timesY&timesZ, <spring:message
                                    code="machine.mm"/></label>

                            <div class="value">${machine.xMotion}&times${machine.yMotion}&times${machine.zMotion}</div>
                        </li>
                        <li>
                            <label><spring:message code="machine.tableSize"/>X&timesY, <spring:message
                                    code="machine.mm"/></label>

                            <div class="value">${machine.xTableSize}&times${machine.yTableSize}</div>
                        </li>
                        <li>
                            <label><spring:message code="machine.tableLoad"/>, <spring:message
                                    code="machine.kg"/></label>

                            <div class="value">${machine.tableLoad}</div>
                        </li>
                        <li>
                            <label><spring:message code="machine.spindleTaper"/></label>

                            <div class="value">${machine.spindleTaper}</div>
                        </li>
                        <li>
                            <label><spring:message code="machine.spindleRotationFrequency"/>, <spring:message
                                    code="machine.revMin"/></label>

                            <div class="value">${machine.spindleRotationFreq}</div>
                        </li>
                        <li>
                            <label><spring:message code="machine.spindlePower"/>, <spring:message
                                    code="machine.kw"/></label>

                            <div class="value">${machine.spindlePower}</div>
                        </li>
                        <li>
                            <label><spring:message code="machine.toolCount"/>, <spring:message
                                    code="machine.pcs"/></label>

                            <div class="value">${machine.toolCount}</div>
                        </li>
                        <li>
                            <label><spring:message code="machine.maxToolDiameter"/>, <spring:message
                                    code="machine.mm"/></label>

                            <div class="value">${machine.maxToolDiameter}</div>
                        </li>
                        <li>
                            <label><spring:message code="machine.maxToolWeight"/>, <spring:message
                                    code="machine.kg"/></label>

                            <div class="value">${machine.maxToolWeight}</div>
                        </li>
                        <li>
                            <label><spring:message code="machine.maxToolLength"/>, <spring:message
                                    code="machine.mm"/></label>

                            <div class="value">${machine.maxToolLength}</div>
                        </li>
                        <li>
                            <label><spring:message code="machine.toolReplacementTime"/>, <spring:message
                                    code="machine.sec"/></label>

                            <div class="value">${machine.toolReplacementTime}</div>
                        </li>
                        <li>
                            <label><spring:message code="machine.chipReplacementTime"/>, <spring:message
                                    code="machine.sec"/></label>

                            <div class="value">${machine.chipReplacementTime}</div>
                        </li>
                        <li>
                            <label><spring:message code="machine.positionRepositionPrecision"/>, <spring:message
                                    code="machine.mm"/></label>

                            <div class="value">${machine.positionRepositionPrecision}</div>
                        </li>
                        <li>
                            <label><spring:message code="machine.spindleRuntime"/>, <spring:message
                                    code="machine.h"/></label>

                            <div class="value">${machine.spindleRuntime}</div>
                        </li>
                        <li>
                            <label><spring:message code="machine.machineLaunching"/>, <spring:message
                                    code="machine.h"/></label>

                            <div class="value">${machine.machineLaunching}</div>
                        </li>
                    </ul>

                </div>

            </div>
            <!-- /.tab-content -->

        </div>
        <!-- /.tab-holder -->
    </div>
    <!-- /.container -->
</section>
<!-- /#single-product-tab -->
<!-- ================================ SINGLE PRODUCT TAB : END ========================================= -->
<!-- ================================================= FOOTER ========================================== -->
<%@include file="insertions/footer.jsp" %>
<!-- ============================================================= FOOTER : END ============================================================= -->
</div>
<!-- /.wrapper -->

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
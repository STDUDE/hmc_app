<%@ page language="java" contentType="text/html; charset=utf8"
         pageEncoding="utf8" %>
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

    <title>HMC. <spring:message code="comparison.comparison"/></title>

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
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
            (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

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
                                    <h1 class="h2 department-h1"><spring:message code="comparison.comparison"/></h1>
                                </a>
                            </li>
                        </ul>
                    </li><!-- /.breadcrumb-nav-holder -->
                </ul>
            </nav>
        </div><!-- /.container -->
    </div><!-- /#top-mega-nav -->

    <div class="main-content" id="main-content">
        <div class="container" id="compare-container">
            <div class="inner-xs">
                <div class="page-header">
                    <h2 class="page-title">
                        <spring:message code="comparison.comparison"/>
                        <c:if test="${empty comparisonList}">
                            <br><br><spring:message code="comparison.chooseItemsToCompare"/>
                        </c:if>
                    </h2>
                </div>
            </div>
            <!-- /.section-page-title -->

                <c:if test="${!empty comparisonList}">
                <div class="table-responsive">
                    <table id="compare-table" class="table compare-list">
                        <thead>
                        <tr>
                            <th>&nbsp;</th>
                            <c:forEach items="${comparisonList}" var="machine">
                            <td class="text-center">
                                <div class="image-wrap">
                                    <span onclick="removeFromComparison('${machine.productId}'); goToComparison();" class="remove-link">
                                        <i class="fa fa-times"></i>
                                    </span>
                                    <img width="220" height="154" class="attachment-yith-woocompare-image" src="../resources/images/blank.gif"
                                         data-echo="../resources/images/products/${machine.photo1}">
                                    <span class="photo${machine.productId} hidden">${machine.photo1}</span>
                                </div>
                                <p><strong>
                                    <a href="/hmc${machine.productId}">
                                        ${machine.machineTypeEn}<br>
                                        <span class="model${machine.productId}">${machine.model}</span>
                                    </a>
                                </strong></p>
                            </td>
                            </c:forEach>
                        </tr>
                        <tr class="tr-add-to-cart">
                            <th>&nbsp;</th>
                            <c:forEach items="${comparisonList}" var="machine">
                            <td class="text-center">
                                <div class="add-cart-button">
                                    <a class="cart${machine.productId} le-button"
                                       onclick="addToCart('${machine.productId}')"><spring:message code="common.addToCart"/></a>
                                    <a class="cart${machine.productId} le-button in-cart hidden"
                                       onclick="removeFromCart('${machine.productId}')"><spring:message code="common.inCart"/></a>
                                </div>
                            </td>
                            </c:forEach>
                        </tr>
                        </thead>
                        <tbody>

                        <tr class="comparison-item price" <c:if test="${pageContext.request.userPrincipal.name == null}">style="display: none"</c:if>>
                            <th><spring:message code="machine.price"/></th>
                            <c:forEach items="${comparisonList}" var="machine">
                            <td class="comparison-item-cell odd product_39">
                                <span class="amount">$<span class="price${machine.productId}">${machine.price}</span></span>
                            </td>
                            </c:forEach>
                        </tr>

                        <tr class="comparison-item description">
                            <th><spring:message code="machine.brand"/>, <spring:message code="machine.country"/>, <spring:message code="machine.productionYear"/></th>
                            <c:forEach items="${comparisonList}" var="machine">
                            <td class="comparison-item-cell odd product_39">
                                <p><span class="brand${machine.productId}">${machine.brand}</span>, ${machine.producingCountryEn}, ${machine.productionYear}<br><br></p>
                            </td>
                            </c:forEach>
                        </tr>

                        <tr class="comparison-item description">
                            <th><spring:message code="machine.systemCnc"/></th>
                            <c:forEach items="${comparisonList}" var="machine">
                                <td class="comparison-item-cell odd product_39">
                                    <p>${machine.fullSystemCNC}</p>
                                </td>
                            </c:forEach>
                        </tr>

                        <tr class="comparison-item description">
                            <th><spring:message code="machine.machineCondition"/></th>
                            <c:forEach items="${comparisonList}" var="machine">
                                <td class="comparison-item-cell odd product_39">
                                    <p>${machine.machineConditionEn}</p>
                                </td>
                            </c:forEach>
                        </tr>

                        <tr class="comparison-item description">
                            <th><spring:message code="machine.location"/></th>
                            <c:forEach items="${comparisonList}" var="machine">
                                <td class="comparison-item-cell odd product_39">
                                    <p>${machine.machineLocationEn}</p>
                                </td>
                            </c:forEach>
                        </tr>

                        <tr class="comparison-item description">
                            <th><spring:message code="machine.motion"/> X&timesY&timesZ, <spring:message code="machine.mm"/></th>
                            <c:forEach items="${comparisonList}" var="machine">
                                <td class="comparison-item-cell odd product_39">
                                    <p>${machine.xMotion}&times${machine.yMotion}&times${machine.zMotion}</p>
                                </td>
                            </c:forEach>
                        </tr>

                        <tr class="comparison-item description">
                            <th><spring:message code="machine.tableSize"/> X&timesY, <spring:message code="machine.mm"/></th>
                            <c:forEach items="${comparisonList}" var="machine">
                                <td class="comparison-item-cell odd product_39">
                                    <p>${machine.xTableSize}&times${machine.yTableSize}</p>
                                </td>
                            </c:forEach>
                        </tr>

                        <tr class="comparison-item description">
                            <th><spring:message code="machine.tableLoad"/>, <spring:message code="machine.kg"/></th>
                            <c:forEach items="${comparisonList}" var="machine">
                                <td class="comparison-item-cell odd product_39">
                                    <p>${machine.tableLoad}</p>
                                </td>
                            </c:forEach>
                        </tr>

                        <tr class="comparison-item description">
                            <th><spring:message code="machine.spindleTaper"/></th>
                            <c:forEach items="${comparisonList}" var="machine">
                                <td class="comparison-item-cell odd product_39">
                                    <p>${machine.spindleTaper}</p>
                                </td>
                            </c:forEach>
                        </tr>

                        <tr class="comparison-item description">
                            <th><spring:message code="machine.spindleRotationFrequency"/>, <spring:message code="machine.revMin"/></th>
                            <c:forEach items="${comparisonList}" var="machine">
                                <td class="comparison-item-cell odd product_39">
                                    <p>${machine.spindleRotationFreq}<br><br></p>
                                </td>
                            </c:forEach>
                        </tr>

                        <tr class="comparison-item description">
                            <th><spring:message code="machine.spindlePower"/>, <spring:message code="machine.kw"/></th>
                            <c:forEach items="${comparisonList}" var="machine">
                                <td class="comparison-item-cell odd product_39">
                                    <p>${machine.spindlePower}</p>
                                </td>
                            </c:forEach>
                        </tr>

                        <tr class="comparison-item description">
                            <th><spring:message code="machine.toolCount"/>, <spring:message code="machine.pcs"/></th>
                            <c:forEach items="${comparisonList}" var="machine">
                                <td class="comparison-item-cell odd product_39">
                                    <p>${machine.toolCount}</p>
                                </td>
                            </c:forEach>
                        </tr>

                        <tr class="comparison-item description">
                            <th><spring:message code="machine.maxToolDiameter"/>, <spring:message code="machine.mm"/></th>
                            <c:forEach items="${comparisonList}" var="machine">
                                <td class="comparison-item-cell odd product_39">
                                    <p>${machine.maxToolDiameter}</p>
                                </td>
                            </c:forEach>
                        </tr>

                        <tr class="comparison-item description">
                            <th><spring:message code="machine.maxToolWeight"/>, <spring:message code="machine.kg"/></th>
                            <c:forEach items="${comparisonList}" var="machine">
                                <td class="comparison-item-cell odd product_39">
                                    <p>${machine.maxToolWeight}</p>
                                </td>
                            </c:forEach>
                        </tr>

                        <tr class="comparison-item description">
                            <th><spring:message code="machine.maxToolLength"/>, <spring:message code="machine.mm"/></th>
                            <c:forEach items="${comparisonList}" var="machine">
                                <td class="comparison-item-cell odd product_39">
                                    <p>${machine.maxToolLength}</p>
                                </td>
                            </c:forEach>
                        </tr>

                        <tr class="comparison-item description">
                            <th><spring:message code="machine.toolReplacementTime"/>, <spring:message code="machine.sec"/></th>
                            <c:forEach items="${comparisonList}" var="machine">
                                <td class="comparison-item-cell odd product_39">
                                    <p>${machine.toolReplacementTime}<br><br></p>
                                </td>
                            </c:forEach>
                        </tr>

                        <tr class="comparison-item description">
                            <th><spring:message code="machine.chipReplacementTime"/>, <spring:message code="machine.sec"/></th>
                            <c:forEach items="${comparisonList}" var="machine">
                                <td class="comparison-item-cell odd product_39">
                                    <p>${machine.chipReplacementTime}<br><br></p>
                                </td>
                            </c:forEach>
                        </tr>

                        <tr class="comparison-item description">
                            <th><spring:message code="machine.positionRepositionPrecision"/>, <spring:message code="machine.mm"/></th>
                            <c:forEach items="${comparisonList}" var="machine">
                                <td class="comparison-item-cell odd product_39">
                                    <p>${machine.positionRepositionPrecision}</p>
                                </td>
                            </c:forEach>
                        </tr>

                        <tr class="comparison-item description">
                            <th><spring:message code="machine.spindleRuntime"/>, <spring:message code="machine.h"/></th>
                            <c:forEach items="${comparisonList}" var="machine">
                                <td class="comparison-item-cell odd product_39">
                                    <p>${machine.spindleRuntime}</p>
                                </td>
                            </c:forEach>
                        </tr>

                        <tr class="comparison-item description">
                            <th><spring:message code="machine.machineLaunching"/>, <spring:message code="machine.h"/></th>
                            <c:forEach items="${comparisonList}" var="machine">
                                <td class="comparison-item-cell odd product_39">
                                    <p>${machine.machineLaunching}</p>
                                </td>
                            </c:forEach>
                        </tr>

                        <tr class="comparison-item description">
                            <th><spring:message code="machine.description"/></th>
                            <c:forEach items="${comparisonList}" var="machine">
                                <td class="comparison-item-cell odd product_39">
                                    <p>${machine.descriptionEn}</p>
                                </td>
                            </c:forEach>
                        </tr>

                        <tr class="price repeated" <c:if test="${pageContext.request.userPrincipal.name == null}">style="display: none"</c:if>>
                            <th><spring:message code="machine.price"/></th>
                            <c:forEach items="${comparisonList}" var="machine">
                                <td class="comparison-item-cell odd product_39">
                                    <span class="amount">$${machine.price}</span>
                                </td>
                            </c:forEach>
                        </tr>

                        </tbody>
                        <thead>
                        <tr>
                            <th>&nbsp;</th>
                            <c:forEach items="${comparisonList}" var="machine">
                                <td class="text-center">
                                    <br><br>
                                    <div class="image-wrap">
                                    <span onclick="removeFromComparison('${machine.productId}'); goToComparison();" class="remove-link">
                                        <i class="fa fa-times"></i>
                                    </span>
                                        <img width="220" height="154" class="attachment-yith-woocompare-image" src="../resources/images/blank.gif"
                                             data-echo="../resources/images/products/${machine.photo1}">
                                    </div>
                                    <p><strong>
                                        <a href="/hmc${machine.productId}">
                                            ${machine.machineTypeEn}<br>${machine.model}
                                        </a>
                                    </strong></p>
                                </td>
                            </c:forEach>
                        </tr>
                        <tr class="tr-add-to-cart">
                            <th>&nbsp;</th>
                            <c:forEach items="${comparisonList}" var="machine">
                                <td class="text-center">
                                    <div class="add-cart-button">
                                        <a class="cart${machine.productId} le-button"
                                           onclick="addToCart('${machine.productId}')"><spring:message code="common.addToCart"/></a>
                                        <a class="cart${machine.productId} le-button in-cart hidden"
                                           onclick="removeFromCart('${machine.productId}')"><spring:message code="common.inCart"/></a>
                                    </div>
                                </td>
                            </c:forEach>
                        </tr>
                        </thead>

                    </table>
                <!-- /.table-responsive -->
                </div>
                <br><br><br>
                </c:if>
        </div>
        <!-- /.container -->
    </div>
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
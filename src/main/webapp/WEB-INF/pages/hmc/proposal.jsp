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

    <title>HMC. <spring:message code="proposal.commercialProposal"/></title>

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
                            <li class="breadcrumb-item gray">
                                <a onclick="goToCart()"><spring:message code="cart.shoppingCart"/></a>
                            </li>
                            <li class="breadcrumb-item current">
                                <a onclick="window.location.reload(true);">
                                    <h1 class="h2 department-h1"><spring:message code="proposal.commercialProposal"/></h1>
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

    <div class="main-content" id="main-content">
        <div class="container" id="compare-container">
            <a id="getProposal"></a>

            <div class="inner-xs">
                <div class="page-header">
                    <h2 class="page-title">
                        <spring:message code="proposal.commercialProposal"/>
                    </h2>
                </div>
            </div>
            <!-- /.section-page-title -->

            <c:if test="${!empty proposalList}">

                <h3><spring:message code="proposal.commercialProposalFor"/>:</h3><br>
                <form:form class="formBox" method="post" id="proposalForm">
                    <div class="row">
                        <div class="col-xs-6 col-md-4">
                            <label for="company"><spring:message code="proposal.company"/></label>
                            <input type="text" id="company" name="company" class="form-control"
                                   placeholder="Enter company">
                        </div>
                        <div class="col-xs-6 col-md-4">
                            <label for="director"><spring:message code="proposal.director"/></label>
                            <input type="text" id="director" name="director" class="form-control"
                                   placeholder="Enter director">
                        </div>
                    </div>
                    <br>
                    <input type="hidden" name="showPrice"
                           value="<c:if test='${pageContext.request.userPrincipal.name == null}'>false</c:if><c:if test='${pageContext.request.userPrincipal.name != null}'>true</c:if>"/>
                    <button class="le-button" type="submit"><spring:message code="cart.getCommercialProposal"/></button>
                </form:form>

                <br><br>

                <div class="table-responsive">
                    <table class="table table-bordered table-condensed" id="order-table">
                        <tr>
                            <td>№</td>
                            <td><spring:message code="machine.type"/></td>
                            <td><spring:message code="machine.model"/></td>
                            <td <c:if test="${pageContext.request.userPrincipal.name == null}">style="display: none"</c:if>>
                                <spring:message code="machine.price"/></td>
                            <td><spring:message code="proposal.quantity"/></td>
                            <td <c:if test="${pageContext.request.userPrincipal.name == null}">style="display: none"</c:if>>
                                <spring:message code="proposal.total"/></td>
                        </tr>
                        <c:set var="total" value="0"/>
                        <c:forEach items="${proposalList}" var="machine" varStatus="loop">
                            <tr>
                                <td>${loop.index + 1}</td>
                                <td>${machine.machineTypeEn}</td>
                                <td>${machine.model}</td>
                                <td <c:if test="${pageContext.request.userPrincipal.name == null}">style="display: none"</c:if>>
                                    $${machine.price}</td>
                                <td id="count${machine.productId}"></td>
                                <td <c:if test="${pageContext.request.userPrincipal.name == null}">style="display: none"</c:if>>
                                    $<span id="total${machine.productId}"></span></td>
                            </tr>
                        </c:forEach>
                        <tr <c:if test="${pageContext.request.userPrincipal.name == null}">style="display: none"</c:if>>
                            <td align="right" colspan="5"><spring:message code="proposal.orderTotal"/></td>
                            <td>$<span id="order-total"></span></td>
                        </tr>
                    </table>
                </div>

                <br><br>

                <c:forEach items="${proposalList}" var="machine" varStatus="loop">
                    <%@include file="insertions/machineFromProposal.jsp" %>
                    <br><br>
                </c:forEach>

                <a href="#getProposal"><h3><spring:message code="proposal.upToGettingTheProposal"/></h3></a><br><br><br>

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
<script type="text/javascript">

    $(document).ready(function () {
        loadQuantities();
        setProposalFormData();
    });

    function loadQuantities() {
        var fullArr = localStorage.cartItemStr.split(';');
        if (fullArr != null && fullArr != "") {
            var orderTotal = 0;
            $(fullArr).each(function (index, value) {
                var machine = value.split(',');
                var productId = machine[0];
                var price = machine[1];
                var count = machine[2];
                $('#count' + productId).text(count);
                $('#total' + productId).text((parseInt(count) * parseInt(price)).toString());
                orderTotal += parseInt(price) * parseInt(count);
            });
            $("#order-total").text(orderTotal.toString());
        }
    }

    function setProposalFormData() {
        var form = $("#proposalForm");
        var products = [];
        var arr = localStorage.cartItemStr.split(';');
        for (var i = 0; i < arr.length; i++) {
            var arrItem = arr[i].split(',');
            products[i] = arrItem[0] + ',' + arrItem[2];
        }
        form.attr("action", "hmc/proposal?products=" + products.join(';'));
    }

</script>

</body>
</html>
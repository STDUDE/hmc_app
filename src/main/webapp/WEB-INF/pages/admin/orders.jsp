<%@ page language="java" contentType="text/html; charset=utf8"
         pageEncoding="utf8" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="cs" lang="cs">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name='robots' content='all, follow'/>
    <meta name="description" content=""/>
    <meta name="keywords" content=""/>
    <title>Admin. Orders</title>
    <link href="../resources/admin/css/default.css" rel="stylesheet" type="text/css" media="screen"/>
    <link href="../resources/admin/css/gray.css" rel="stylesheet" type="text/css" media="screen"/>
    <!-- color skin: blue / red / green / dark -->
    <link href="../resources/admin/css/datePicker.css" rel="stylesheet" type="text/css" media="screen"/>
    <link href="../resources/admin/css/wysiwyg.css" rel="stylesheet" type="text/css" media="screen"/>
    <link href="../resources/admin/css/fancybox-1.3.1.css" rel="stylesheet" type="text/css" media="screen"/>
    <link href="../resources/admin/css/visualize.css" rel="stylesheet" type="text/css" media="screen"/>

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="../resources/css/bootstrap.min.css">
    <!-- Icons/Glyphs -->
    <link rel="stylesheet" href="../resources/css/font-awesome.min.css">

    <script type="text/javascript" src="../resources/admin/js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../resources/admin/js/jquery.dimensions.min.js"></script>

    <!-- // Tabs // -->
    <script type="text/javascript" src="../resources/admin/js/ui.core.js"></script>
    <script type="text/javascript" src="../resources/admin/js/jquery.ui.tabs.min.js"></script>

    <!-- // Table drag and drop rows // -->
    <script type="text/javascript" src="../resources/admin/js/tablednd.js"></script>

    <!-- // Date Picker // -->
    <script type="text/javascript" src="../resources/admin/js/date.js"></script>
    <!--[if IE]><script type="text/javascript" src="public/js/jquery.bgiframe.js"></script><[endif]-->
    <script type="text/javascript" src="../resources/admin/js/jquery.datePicker.js"></script>

    <!-- // Wysiwyg // -->
    <script type="text/javascript" src="../resources/admin/js/jquery.wysiwyg.js"></script>

    <!-- // Graphs // -->
    <script type="text/javascript" src="../resources/admin/js/excanvas.js"></script>
    <script type="text/javascript" src="../resources/admin/js/jquery.visualize.js"></script>

    <!-- // File upload // -->
    <script type="text/javascript" src="../resources/admin/js/jquery.filestyle.js"></script>

    <script type="text/javascript" src="../resources/admin/js/init.js"></script>

</head>
<body>
<div id="main">
    <%@include file="header.jsp" %>
    <!-- #content -->
    <div id="content">

        <!-- breadcrumbs -->
        <div class="breadcrumbs">
            <ul>
                <li class="home"><a href="/admin/hmc">HMC</a></li>
                <li class="home">&nbsp;|&nbsp;</li>
                <li class="home"><a href="/admin/lathe">Lathe</a></li>
                <li class="home">&nbsp;|&nbsp;</li>
                <li class="home"><a href="/admin/gallery">Gallery</a></li>
                <li class="home">&nbsp;|&nbsp;</li>
                <li class="home"><a href="/admin/orders" style="font-weight: bold; color: #008B00">Orders</a></li>
                <li class="home">&nbsp;|&nbsp;</li>
                <li class="home"><a href="/admin/users">Users</a></li>
            </ul>
        </div>
        <!-- /breadcrumbs -->
        <div id="top"></div>
        <!-- box -->
        <div class="tabs box">
            <ul class="bookmarks">
                <li><a href="#orders">Orders</a></li>
            </ul>
            <div class="box-content">
                <div id="edit">
                    <c:if test="${empty orderList}">
                        <h3>No orders.</h3>
                    </c:if>
                    <c:set var="itemsPerPage" value="${itemsPerPage}"/>
                    <c:set var="itemsNum" value="${itemsNum}"/>
                    <c:forEach items="${orderList}" var="machineOrder" varStatus="loop">
                        <div class="row-machine hidden" id="item${loop.index + 1}">
                            <div class="container-fluid no-margin">
                                <div class="row no-margin"  style="cursor: pointer;" onclick="$('#order${machineOrder.orderId}').toggleClass('hidden')">
                                    <div class="col-xs-6 col-sm-6">
                                            ${loop.index + 1}. ${machineOrder.orderId}
                                    </div>
                                    <div class="col-xs-3 col-sm-3">
                                            ${machineOrder.orderStatus}
                                    </div>
                                    <div class="col-xs-2 col-sm-2">
                                            ${machineOrder.date}
                                    </div>
                                    <div class="col-xs-1 col-sm-1" style=" padding-right:3px">
                                        <i class="fa fa-sort" style="float:right; font-size:20px; cursor: pointer;"
                                           onclick="$('#order${machineOrder.orderId}').toggleClass('hidden')"></i>
                                    </div>
                                </div>
                            </div>
                            <div id="order${machineOrder.orderId}" class="hidden">
                                <hr>
                                Customer:<br>
                                &nbsp;&nbsp;&nbsp;&nbsp;name: ${machineOrder.firstName} ${machineOrder.lastName}<br>
                                &nbsp;&nbsp;&nbsp;&nbsp;company: ${machineOrder.company}
                                <c:if test="${empty machineOrder.company}">
                                    not specified
                                </c:if>
                                <br>
                                &nbsp;&nbsp;&nbsp;&nbsp;address: ${machineOrder.address}<br>
                                &nbsp;&nbsp;&nbsp;&nbsp;postcode: ${machineOrder.postcode}<br>
                                &nbsp;&nbsp;&nbsp;&nbsp;email: ${machineOrder.email}<br>
                                &nbsp;&nbsp;&nbsp;&nbsp;phone: ${machineOrder.phone}<br><br>

                                The order:<br>
                                <table class="table table-bordered table-condensed">
                                    <tr>
                                        <td>№</td>
                                        <td>Machine</td>
                                        <td>Machine ID</td>
                                        <td>Price</td>
                                        <td>Quantity</td>
                                    </tr>
                                    <c:forEach items="${fn:split(machineOrder.orderList,';')}" var="machine"
                                               varStatus="loop">
                                        <c:set var="m" value="${fn:split(machine, ',')}"/>
                                        <tr>
                                            <td>${loop.index + 1}.</td>
                                            <td>
                                                <a href="http://qjvmhoia.jvmhost.net/HMCApp/machine?productId=${m[0]}"
                                                   style="text-decoration: underline; color: #008B00">${m[1]}</a>
                                            </td>
                                            <td>${m[0]}</td>
                                            <td>$${m[2]}.00</td>
                                            <td>${m[3]}</td>
                                        </tr>
                                    </c:forEach>
                                    <tr>
                                        <td align="right" colspan="4">Order total</td>
                                        <td>$${machineOrder.total}.00</td>
                                    </tr>
                                </table>

                                Payment: ${machineOrder.payment}<br><br>
                                Date of ordering: ${machineOrder.date}<br><br>

                                <form:form method="post" class="form-inline">
                                Order status:
                                <select class="form-control" name="orderStatus">
                                    <c:set var="statuses">The order is accepted.;Commercial offer is sent.;Negotiations about machine characteristics.;Agreement conclusion.;Delivery of the order.;Work with the order is finished.</c:set>
                                    <c:forTokens items="${statuses}" delims=";" var="status">
                                        <option value="${status}" <c:if test="${machineOrder.orderStatus == status}">selected</c:if>>${status}</option>
                                    </c:forTokens>
                                </select>
                                <input type="hidden" name="orderId" value="${machineOrder.orderId}">
                                <input type="submit" value="Save status" class="button black-button" style="font-weight: normal"/>
                                </form:form>
                                <br>
                            </div>
                        </div>
                    </c:forEach>
                    <br>
                    <!-- /pagination -->
                    <div class="paging">
                        <ul>
                            <c:forEach begin="1" end="${pagesNum}" var="i">
                                <li id="page${i}">
                                    <a onclick="showPage(${i});">${i}</a>
                                </li>
                            </c:forEach>
                        </ul>
                        <p>Pages: </p>
                    </div>
                    <!-- /pagination -->

                </div>

            </div>
        </div>

    </div>
    <!-- /#content -->
    <%@include file="footer.jsp" %>
</div>
<!-- /#main -->


<script type="text/javascript">
    var currentPage = 1;
    var itemsPerPage = '${itemsPerPage}';
    var itemsNum = '${itemsNum}';

    $(document).ready(function () {
        toggleItems(currentPage);
        toggleCurrentClassPage(currentPage);
    });

</script>

</body>
</html>
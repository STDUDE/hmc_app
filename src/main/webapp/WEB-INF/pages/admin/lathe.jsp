<%@ page language="java" contentType="text/html; charset=utf8"
         pageEncoding="utf8" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="cs" lang="cs">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name='robots' content='all, follow'/>
    <meta name="description" content=""/>
    <meta name="keywords" content=""/>
    <title>Admin. Lathe catalog</title>
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
        <li class="home"><a href="/admin/lathe" style="font-weight: bold; color: #008B00">Lathe</a></li>
        <li class="home">&nbsp;|&nbsp;</li>
        <li class="home"><a href="/admin/gallery">Gallery</a></li>
        <li class="home">&nbsp;|&nbsp;</li>
        <li class="home"><a href="/admin/orders">Orders</a></li>
        <li class="home">&nbsp;|&nbsp;</li>
        <li class="home"><a href="/admin/users">Users</a></li>
    </ul>
</div>
<!-- /breadcrumbs -->
<div id="top"></div>
<!-- box -->
<div class="tabs box">
<ul class="bookmarks">
    <li><a href="#edit">Edit lathes</a></li>
    <li><a href="#upload">Upload lathes from file</a></li>
    <li><a href="#filters">Renew filters</a></li>
</ul>
<div class="box-content">
<div id="edit">
    <c:if test="${empty latheListShort}">
        <h3>Add lathes to the catalog.</h3>
    </c:if>
    <c:set var="itemsPerPage" value="${itemsPerPage}"/>
    <c:set var="itemsNum" value="${itemsNum}"/>
    <c:forEach items="${latheListShort}" var="latheS" varStatus="loop">
        <c:set var="latheFull" value="${latheListFull.get(loop.index).getLatheLangFullEntityPK().getLatheFull()}"/>
        <c:set var="latheShort" value="${latheS.getLatheLangShortEntityPK().getLatheShort()}"/>
        <c:set var="latheF" value="${latheListFull.get(loop.index)}"/>
        <div class="row-machine hidden" id="item${loop.index + 1}">
            <div class="container-fluid no-margin" onclick="$('#form${latheShort.productId}').toggleClass('hidden')">
                <div class="row no-margin" style="cursor: pointer;">
                    <div class="col-xs-4 col-sm-4">
                            ${loop.index + 1}. ${latheShort.model}
                    </div>
                    <div class="col-xs-4 col-sm-4">
                            ${latheS.machineType}
                    </div>
                    <div class="col-xs-3 col-sm-3">
                            ${latheShort.productId}
                    </div>
                    <div class="col-xs-1 col-sm-1" style=" padding-right:3px">
                        <i class="fa fa-sort" style="float:right; font-size:20px;"></i>
                    </div>
                </div>
            </div>
            <form id="form${latheShort.productId}" class="hidden formBox" action="lathe/edit" method="post">
                <hr>
                <spring:bind path="latheShortEntity.latheLangShortEntityPK.latheShort.productId">
                    <spring:bind path="latheFullEntity.latheLangFullEntityPK.latheFull.productId">
                        <input type="hidden" name="productId" value="${latheShort.productId}"/>
                    </spring:bind>
                </spring:bind>

                <table class="table table-bordered table-condensed table-machine">
                    <tr>
                        <td colspan="3" width="25%">Model</td>
                        <td colspan="3" width="25%">
                            <spring:bind path="latheShortEntity.latheLangShortEntityPK.latheShort.model">
                                <input class="le-input form-control" name="model"
                                       value="${latheShort.model}" type="text"/>
                            </spring:bind>
                        </td>
                        <td colspan="3" width="25%">Machine type</td>
                        <td colspan="3" width="25%">
                            <spring:bind path="latheShortEntity.machineType">
                                <input class="le-input form-control" name="machineType"
                                                           value="${latheS.machineType}" type="text"/>
                            </spring:bind>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" width="25%">Producing country</td>
                        <td colspan="3" width="25%">
                            <spring:bind path="latheShortEntity.producingCountry">
                                <input class="le-input form-control" name="producingCountry"
                                       value="${latheS.producingCountry}" type="text"/>
                            </spring:bind>
                        </td>
                        <td colspan="3" width="25%">Machine condition</td>
                        <td colspan="3" width="25%">
                            <spring:bind path="latheShortEntity.machineCondition">
                                <input class="le-input form-control" name="machineCondition"
                                       value="${latheS.machineCondition}" type="text"/>
                            </spring:bind>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" width="25%">Machine location</td>
                        <td colspan="3" width="25%">
                            <spring:bind path="latheShortEntity.machineLocation">
                                <input class="le-input form-control" name="machineLocation"
                                       value="${latheS.machineLocation}" type="text"/>
                            </spring:bind>
                        </td>
                        <td colspan="3" width="25%">Description</td>
                        <td colspan="3" width="25%">
                            <spring:bind path="latheShortEntity.description">
                                <input class="le-input form-control" name="description"
                                       value="${latheS.description}" type="text"/>
                            </spring:bind>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" width="25%">Manufacturer</td>
                        <td colspan="3" width="25%">
                            <spring:bind path="latheShortEntity.latheLangShortEntityPK.latheShort.manufacturer">
                                <input class="le-input form-control" name="manufacturer"
                                       value="${latheShort.manufacturer}" type="text"/>
                            </spring:bind>
                        </td>
                        <td colspan="3" width="25%">Price</td>
                        <td colspan="3" width="25%">
                            <spring:bind path="latheShortEntity.latheLangShortEntityPK.latheShort.price">
                                <input class="le-input form-control" name="price"
                                       value="${latheShort.price}" type="text"/>
                            </spring:bind>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" width="25%">Full system CNC</td>
                        <td colspan="3" width="25%">
                            <spring:bind path="latheFullEntity.latheLangFullEntityPK.latheFull.fullSystemCnc">
                                <input class="le-input form-control" name="fullSystemCnc"
                                       value="${latheFull.fullSystemCnc}" type="text"/>
                            </spring:bind>
                        </td>
                        <td colspan="3" width="25%">System CNC</td>
                        <td colspan="3" width="25%">
                            <spring:bind path="latheShortEntity.latheLangShortEntityPK.latheShort.systemCNC">
                                <input class="le-input form-control" name="systemCNC"
                                       value="${latheShort.systemCNC}" type="text"/>
                            </spring:bind>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" width="25%">Max Processing Diameter Mm</td>
                        <td colspan="3" width="25%">
                            <spring:bind path="latheShortEntity.latheLangShortEntityPK.latheShort.maxProcessingDiameterMm">
                                <input class="le-input form-control" name="maxProcessingDiameterMm"
                                       value="${latheShort.maxProcessingDiameterMm}" type="text"/>
                            </spring:bind>
                        </td>
                        <td colspan="3" width="25%">Max Processing Diameter Inch</td>
                        <td colspan="3" width="25%">
                            <spring:bind path="latheShortEntity.latheLangShortEntityPK.latheShort.maxProcessingDiameterInch">
                                <input class="le-input form-control" name="maxProcessingDiameterInch"
                                       value="${latheShort.maxProcessingDiameterInch}" type="text"/>
                            </spring:bind>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" width="25%">Max Processing Length Mm</td>
                        <td colspan="3" width="25%">
                            <spring:bind path="latheShortEntity.latheLangShortEntityPK.latheShort.maxProcessingLengthMm">
                                <input class="le-input form-control" name="maxProcessingLengthMm"
                                       value="${latheShort.maxProcessingLengthMm}" type="text"/>
                            </spring:bind>
                        </td>
                        <td colspan="3" width="25%">Max Processing Length Inch</td>
                        <td colspan="3" width="25%">
                            <spring:bind path="latheShortEntity.latheLangShortEntityPK.latheShort.maxProcessingLengthInch">
                                <input class="le-input form-control" name="maxProcessingLengthInch"
                                       value="${latheShort.maxProcessingLengthInch}" type="text"/>
                            </spring:bind>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" width="25%">xMotionMm</td>
                        <td colspan="3" width="25%">
                            <spring:bind path="latheShortEntity.latheLangShortEntityPK.latheShort.xMotionMm">
                                <input class="le-input form-control" name="xMotionMm"
                                       value="${latheShort.xMotionMm}" type="text"/>
                            </spring:bind>
                        </td>
                        <td colspan="3" width="25%">xMotionInch</td>
                        <td colspan="3" width="25%">
                            <spring:bind path="latheShortEntity.latheLangShortEntityPK.latheShort.xMotionInch">
                                <input class="le-input form-control" name="xMotionInch"
                                       value="${latheShort.xMotionInch}" type="text"/>
                            </spring:bind>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" width="25%">yMotionMm</td>
                        <td colspan="3" width="25%">
                            <spring:bind path="latheShortEntity.latheLangShortEntityPK.latheShort.yMotionMm">
                                <input class="le-input form-control" name="yMotionMm"
                                       value="${latheShort.yMotionMm}" type="text"/>
                            </spring:bind>
                        </td>
                        <td colspan="3" width="25%">yMotionInch</td>
                        <td colspan="3" width="25%">
                            <spring:bind path="latheShortEntity.latheLangShortEntityPK.latheShort.yMotionInch">
                                <input class="le-input form-control" name="yMotionInch"
                                       value="${latheShort.yMotionInch}" type="text"/>
                            </spring:bind>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" width="25%">zMotionMm</td>
                        <td colspan="3" width="25%">
                            <spring:bind path="latheShortEntity.latheLangShortEntityPK.latheShort.zMotionMm">
                                <input class="le-input form-control" name="zMotionMm"
                                       value="${latheShort.zMotionMm}" type="text"/>
                            </spring:bind>
                        </td>
                        <td colspan="3" width="25%">zMotionInch</td>
                        <td colspan="3" width="25%">
                            <spring:bind path="latheShortEntity.latheLangShortEntityPK.latheShort.zMotionInch">
                                <input class="le-input form-control" name="zMotionInch"
                                       value="${latheShort.zMotionInch}" type="text"/>
                            </spring:bind>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" width="25%">Turret fastening type</td>
                        <td colspan="3" width="25%">
                            <spring:bind path="latheFullEntity.turretFasteningType">
                                <input class="le-input form-control" name="turretFasteningType"
                                       value="${latheF.turretFasteningType}" type="text"/>
                            </spring:bind>
                        </td>
                        <td colspan="3" width="25%">Tailstock presence</td>
                        <td colspan="3" width="25%">
                            <spring:bind path="latheFullEntity.tailstockPresence">
                                <input class="le-input form-control" name="tailstockPresence"
                                       value="${latheF.tailstockPresence}" type="text"/>
                            </spring:bind>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" width="25%">Spindle rotation frequency</td>
                        <td colspan="3" width="25%">
                            <spring:bind path="latheFullEntity.latheLangFullEntityPK.latheFull.spindleRotationFreq">
                                <input class="le-input form-control" name="spindleRotationFreq"
                                       value="${latheFull.spindleRotationFreq}" type="text"/>
                            </spring:bind>
                        </td>
                        <td colspan="3" width="25%">Spindle power</td>
                        <td colspan="3" width="25%">
                            <spring:bind path="latheFullEntity.latheLangFullEntityPK.latheFull.spindlePower">
                                <input class="le-input form-control" name="spindlePower"
                                       value="${latheFull.spindlePower}" type="text"/>
                            </spring:bind>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" width="25%">Processing diameter Mm</td>
                        <td colspan="3" width="25%">
                            <spring:bind path="latheFullEntity.latheLangFullEntityPK.latheFull.processingDiameterMm">
                                <input class="le-input form-control" name="processingDiameterMm"
                                       value="${latheFull.processingDiameterMm}" type="text"/>
                            </spring:bind>
                        </td>
                        <td colspan="3" width="25%">Processing diameter Inch</td>
                        <td colspan="3" width="25%">
                            <spring:bind path="latheFullEntity.latheLangFullEntityPK.latheFull.processingDiameterInch">
                                <input class="le-input form-control" name="processingDiameterInch"
                                       value="${latheFull.processingDiameterInch}" type="text"/>
                            </spring:bind>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" width="25%">Rod passage diameter Mm</td>
                        <td colspan="3" width="25%">
                            <spring:bind path="latheFullEntity.latheLangFullEntityPK.latheFull.rodPassageDiameterMm">
                                <input class="le-input form-control" name="rodPassageDiameterMm"
                                       value="${latheFull.rodPassageDiameterMm}" type="text"/>
                            </spring:bind>
                        </td>
                        <td colspan="3" width="25%">Rod passage diameter Inch</td>
                        <td colspan="3" width="25%">
                            <spring:bind path="latheFullEntity.latheLangFullEntityPK.latheFull.rodPassageDiameterInch">
                                <input class="le-input form-control" name="rodPassageDiameterInch"
                                       value="${latheFull.rodPassageDiameterInch}" type="text"/>
                            </spring:bind>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" width="25%">Spindle hole diameter Mm</td>
                        <td colspan="3" width="25%">
                            <spring:bind path="latheFullEntity.latheLangFullEntityPK.latheFull.spindleHoleDiameterMm">
                                <input class="le-input form-control" name="spindleHoleDiameterMm"
                                       value="${latheFull.spindleHoleDiameterMm}" type="text"/>
                            </spring:bind>
                        </td>
                        <td colspan="3" width="25%">Spindle hole diameter Inch</td>
                        <td colspan="3" width="25%">
                            <spring:bind path="latheFullEntity.latheLangFullEntityPK.latheFull.spindleHoleDiameterInch">
                                <input class="le-input form-control" name="spindleHoleDiameterInch"
                                       value="${latheFull.spindleHoleDiameterInch}" type="text"/>
                            </spring:bind>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" width="25%">Position/reposition precision Mm</td>
                        <td colspan="3" width="25%">
                            <spring:bind path="latheFullEntity.latheLangFullEntityPK.latheFull.positionRepositionPrecisionMm">
                                <input class="le-input form-control" name="positionRepositionPrecisionMm"
                                       value="${latheFull.positionRepositionPrecisionMm}" type="text"/>
                            </spring:bind>
                        </td>
                        <td colspan="3" width="25%">Position/reposition precision Inch</td>
                        <td colspan="3" width="25%">
                            <spring:bind path="latheFullEntity.latheLangFullEntityPK.latheFull.positionRepositionPrecisionInch">
                                <input class="le-input form-control" name="positionRepositionPrecisionInch"
                                       value="${latheFull.positionRepositionPrecisionInch}" type="text"/>
                            </spring:bind>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" width="25%">Counter spindle presence</td>
                        <td colspan="3" width="25%">
                            <spring:bind path="latheFullEntity.counterSpindlePresence">
                                <input class="le-input form-control" name="counterSpindlePresence"
                                       value="${latheF.counterSpindlePresence}" type="text"/>
                            </spring:bind>
                        </td>
                        <td colspan="3" width="25%">Counter spindle rotation frequency</td>
                        <td colspan="3" width="25%">
                            <spring:bind path="latheFullEntity.latheLangFullEntityPK.latheFull.counterSpindleRotationFreq">
                                <input class="le-input form-control" name="counterSpindleRotationFreq"
                                       value="${latheFull.counterSpindleRotationFreq}" type="text"/>
                            </spring:bind>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" width="25%">Driven tools count</td>
                        <td colspan="3" width="25%">
                            <spring:bind path="latheFullEntity.latheLangFullEntityPK.latheFull.drivenToolsCount">
                                <input class="le-input form-control" name="drivenToolsCount"
                                       value="${latheFull.drivenToolsCount}" type="text"/>
                            </spring:bind>
                        </td>
                        <td colspan="3" width="25%">Non driven tools count</td>
                        <td colspan="3" width="25%">
                            <spring:bind path="latheFullEntity.latheLangFullEntityPK.latheFull.nonDrivenToolsCount">
                                <input class="le-input form-control" name="nonDrivenToolsCount"
                                       value="${latheFull.nonDrivenToolsCount}" type="text"/>
                            </spring:bind>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" width="25%">Position precision</td>
                        <td colspan="3" width="25%">
                            <spring:bind path="latheFullEntity.latheLangFullEntityPK.latheFull.positionPrecision">
                                <input class="le-input form-control" name="positionPrecision"
                                       value="${latheFull.positionPrecision}" type="text"/>
                            </spring:bind>
                        </td>
                        <td colspan="3" width="25%">Spindle life</td>
                        <td colspan="3" width="25%">
                            <spring:bind path="latheFullEntity.latheLangFullEntityPK.latheFull.spindleLife">
                                <input class="le-input form-control" name="spindleLife"
                                       value="${latheFull.spindleLife}" type="text"/>
                            </spring:bind>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" width="25%">Machine launching time</td>
                        <td colspan="3" width="25%">
                            <spring:bind path="latheFullEntity.latheLangFullEntityPK.latheFull.machineLaunchingTime">
                                <input class="le-input form-control" name="machineLaunchingTime"
                                       value="${latheFull.machineLaunchingTime}" type="text"/>
                            </spring:bind>
                        </td>
                        <!-- empty -->
                    </tr>
                    <tr>
                        <td colspan="3" width="25%">Photo 1 (main)</td>
                        <td colspan="3" width="25%">
                            <spring:bind path="latheShortEntity.latheLangShortEntityPK.latheShort.photo1">
                                <input class="le-input form-control" name="photo1"
                                       value="${latheShort.photo1}" type="text"/>
                            </spring:bind>
                        </td>
                        <td colspan="3" width="25%">Photo 2</td>
                        <td colspan="3" width="25%">
                            <spring:bind path="latheFullEntity.latheLangFullEntityPK.latheFull.photo2">
                                <input class="le-input form-control" name="photo2"
                                       value="${latheFull.photo2}" type="text"/>
                            </spring:bind>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" width="25%">Photo 3</td>
                        <td colspan="3" width="25%">
                            <spring:bind path="latheFullEntity.latheLangFullEntityPK.latheFull.photo3">
                                <input class="le-input form-control" name="photo3"
                                       value="${latheFull.photo3}" type="text"/>
                            </spring:bind>
                        </td>
                        <td colspan="3" width="25%">Photo 4</td>
                        <td colspan="3" width="25%">
                            <spring:bind path="latheFullEntity.latheLangFullEntityPK.latheFull.photo4">
                                <input class="le-input form-control" name="photo4"
                                       value="${latheFull.photo4}" type="text"/>
                            </spring:bind>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" width="25%">Photo 5</td>
                        <td colspan="3" width="25%">
                            <spring:bind path="latheFullEntity.latheLangFullEntityPK.latheFull.photo5">
                                <input class="le-input form-control" name="photo5"
                                       value="${latheFull.photo5}" type="text"/>
                            </spring:bind>
                        </td>
                        <td colspan="3" width="25%">Video 1</td>
                        <td colspan="3" width="25%">
                            <spring:bind path="latheFullEntity.latheLangFullEntityPK.latheFull.video1">
                                <input class="le-input form-control" name="video1"
                                       value="${latheFull.video1}" type="text"/>
                            </spring:bind>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" width="25%">Video 2</td>
                        <td colspan="3" width="25%">
                            <spring:bind path="latheFullEntity.latheLangFullEntityPK.latheFull.video2">
                                <input class="le-input form-control" name="video2"
                                       value="${latheFull.video2}" type="text"/>
                            </spring:bind>
                        </td>
                        <td colspan="3" width="25%">Video 3</td>
                        <td colspan="3" width="25%">
                            <spring:bind path="latheFullEntity.latheLangFullEntityPK.latheFull.video3">
                                <input class="le-input form-control" name="video3"
                                       value="${latheFull.video3}" type="text"/>
                            </spring:bind>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" width="25%">Production Year</td>
                        <td colspan="3" width="25%">
                            <spring:bind path="latheShortEntity.latheLangShortEntityPK.latheShort.productionYear">
                                <input class="le-input form-control" name="productionYear"
                                       value="${latheShort.productionYear}" type="text"/>
                            </spring:bind>
                        </td>
                        <td colspan="3" width="25%">Is sold</td>
                        <td colspan="3" width="25%">
                            <spring:bind path="latheShortEntity.latheLangShortEntityPK.latheShort.isSold">
                                <input class="le-input form-control" name="isSold"
                                       value="${latheShort.isSold}" type="text"/>
                            </spring:bind>
                        </td>
                    </tr>
                </table>
                <h3>Images:</h3>

                <div class="container-fluid no-margin">
                    <div class="row">
                        <div class="col-xs-2 col-sm-2 col-xs-offset-1">
                            <img src="../resources/images/products/${latheS.getLatheLangShortEntityPK().getLatheShort().photo1}" class="img-responsive"/>
                            <span style="font-size:0.85em">${latheS.getLatheLangShortEntityPK().getLatheShort().photo1}<br>(main photo)</span>
                        </div>
                        <c:if test="${latheFull.photo2!=''}">
                            <div class="col-xs-2 col-sm-2">
                                <img src="../resources/images/products/${latheFull.photo2}" class="img-responsive"/>
                                <span style="font-size:0.85em">${latheFull.photo2}</span>
                            </div>
                        </c:if>
                        <c:if test="${latheFull.photo3!=''}">
                            <div class="col-xs-2 col-sm-2">
                                <img src="../resources/images/products/${latheFull.photo3}" class="img-responsive"/>
                                <span style="font-size:0.85em">${latheFull.photo3}</span>
                            </div>
                        </c:if>
                        <c:if test="${latheFull.photo4!=''}">
                            <div class="col-xs-2 col-sm-2">
                                <img src="../resources/images/products/${latheFull.photo4}" class="img-responsive"/>
                                <span style="font-size:0.85em">${latheFull.photo4}</span>
                            </div>
                        </c:if>
                        <c:if test="${latheFull.photo5!=''}">
                            <div class="col-xs-2 col-sm-2">
                                <img src="../resources/images/products/${latheFull.photo5}" class="img-responsive"/>
                                <span style="font-size:0.85em">${latheFull.photo5}</span>
                            </div>
                        </c:if>
                    </div>
                </div>
                <h3>Video:</h3>
                <c:if test="${latheFull.video1!=''}">
                    <iframe width="300" height="169" src="${latheFull.video1}" frameborder="0" allowfullscreen></iframe>
                </c:if>
                <c:if test="${latheFull.video2!=''}">
                    <iframe width="300" height="169" src="${latheFull.video2}" frameborder="0" allowfullscreen></iframe>
                </c:if>
                <c:if test="${latheFull.video3!=''}">
                    <iframe width="300" height="169" src="${latheFull.video3}" frameborder="0" allowfullscreen></iframe>
                </c:if>
                <c:if test="${latheFull.video1==''
                && latheFull.video2==''
                && latheFull.video3==''}">
                    <h4>All video fields are empty. So that's common video.</h4>
                    <iframe width="300" height="169" src="https://www.youtube.com/embed/0YSScR4PbLw" frameborder="0"
                            allowfullscreen></iframe>
                </c:if>
                <br>
                <div class="btn-submit">
                    <input type="submit" value="Save" class="button" style="font-weight: normal"/>
                </div>
                <br>
            </form>
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

<div id="upload">
    <form:form class="formBox" method="post" action="lathe/upload"
               enctype="multipart/form-data">

        <fieldset>
            <div class="clearfix file">
                <div class="lab"><label for="textFile">Upload file with lathes</label></div>
                <div class="con">
                    <input type="file" accept=".xls,.xlsx" name="textFile" class="upload-file"
                           id="textFile" multiple required/>
                </div>
            </div>
            - N files<br>
            - .xlsx or .xls format<br>
            - <a href="../resources/example.xlsx" target="_blank">example</a> (download)
            <br><br>

            <div class="btn-submit"><!-- Submit form -->
                <input type="submit" value="Add / update" class="button"/>
            </div>
        </fieldset>

    </form:form>
</div>

<div id="filters">
    <form:form class="formBox" method="post" action="lathe/renewFilters">

        <fieldset>
            Renewing filters means forming new filter parameters according to existing DB with Machines.
            <h3 style="color: red; margin-top:10px">Please, do it every time you've finally changed the items.</h3>
            As a result, you would see <u>relevant</u> filter parameters.<br><br>

            <div class="btn-submit"><!-- Submit form -->
                <input type="submit" value="Renew filters" class="button"/>
            </div>
        </fieldset>

    </form:form>
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
        $("#textFile").change(function () {
            changeNames($(this));
        });
        toggleItems(currentPage);
        toggleCurrentClassPage(currentPage);
    });
</script>

</body>
</html>
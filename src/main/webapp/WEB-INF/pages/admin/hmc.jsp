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
    <title>Admin. HMC catalog</title>
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
        <li class="home"><a href="/admin/hmc" style="font-weight: bold; color: #008B00">HMC</a></li>
        <li class="home">&nbsp;|&nbsp;</li>
        <li class="home"><a href="/admin/lathe">Lathe</a></li>
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
    <li><a href="#edit">Edit machines</a></li>
    <li><a href="#upload">Upload machines from file</a></li>
    <li><a href="#filters">Renew filters</a></li>
</ul>
<div class="box-content">
<div id="edit">
<c:if test="${empty machineList}">
    <h3>Add machines to the catalog.</h3>
</c:if>
<c:set var="itemsPerPage" value="${itemsPerPage}"/>
<c:set var="itemsNum" value="${itemsNum}"/>
<c:forEach items="${machineList}" var="machine" varStatus="loop">
    <div class="row-machine hidden" id="item${loop.index + 1}">
        <div class="container-fluid no-margin">
            <div class="row no-margin" style="cursor: pointer;" onclick="$('#form${machine.productId}').toggleClass('hidden')">
                <div class="col-xs-4 col-sm-4">
                       ${loop.index + 1}. ${machine.model}
                </div>
                <div class="col-xs-4 col-sm-4">
                    ${machine.machineTypeEn}
                </div>
                <div class="col-xs-3 col-sm-3">
                    ${machine.productId}
                </div>
                <div class="col-xs-1 col-sm-1" style=" padding-right:3px">
                    <i class="fa fa-sort" style="float:right; font-size:20px;"></i>
                </div>
            </div>
        </div>
        <form:form id="form${machine.productId}" class="hidden formBox" modelAttribute="machine" action="hmc/edit" method="post">
            <hr>
            <input type="hidden" name="productId" value="${machine.productId}"/>
            <table class="table table-bordered table-condensed table-machine">
                <tr>
                    <td colspan="3" width="25%">Machine type</td>
                    <td colspan="3" width="25%"><input class="le-input form-control" name="machineTypeEn"
                                                       value="${machine.machineTypeEn}" type="text"/></td>
                    <td colspan="3" width="25%">Model</td>
                    <td colspan="3" width="25%"><input class="le-input form-control" name="model"
                                                       value="${machine.model}" type="text"/></td>
                </tr>
                <tr>
                    <td colspan="3" width="25%">Brand</td>
                    <td colspan="3" width="25%"><input class="le-input form-control" name="brand"
                                                       value="${machine.brand}" type="text"/></td>
                    <td colspan="3" width="25%">Producing country</td>
                    <td colspan="3" width="25%"><input class="le-input form-control" name="producingCountryEn"
                                                       value="${machine.producingCountryEn}" type="text"/></td>
                </tr>
                <tr>
                    <td colspan="3" width="25%">System CNC</td>
                    <td colspan="3" width="25%"><input class="le-input form-control" name="systemCNC"
                                                       value="${machine.systemCNC}" type="text"/></td>
                    <td colspan="3" width="25%">Full system CNC</td>
                    <td colspan="3" width="25%"><input class="le-input form-control" name="fullSystemCNC"
                                                       value="${machine.fullSystemCNC}" type="text"/></td>
                </tr>
                <tr>
                    <td colspan="3" width="25%">Production year</td>
                    <td colspan="3" width="25%"><input class="le-input form-control" name="productionYear"
                                                       value="${machine.productionYear}" type="number"/></td>
                    <td colspan="3" width="25%">Condition</td>
                    <td colspan="3" width="25%"><input class="le-input form-control" name="machineConditionEn"
                                                       value="${machine.machineConditionEn}" type="text"/></td>
                </tr>
                <tr>
                    <td colspan="3" width="25%">Current location</td>
                    <td colspan="3" width="25%"><input class="le-input form-control" name="machineLocationEn"
                                                       value="${machine.machineLocationEn}" type="text"/></td>
                    <td colspan="3" width="25%">Axis count</td>
                    <td colspan="3" width="25%"><input class="le-input form-control" name="axisCount"
                                                       value="${machine.axisCount}" type="text"/></td>
                </tr>
                <tr>
                    <td colspan="3" width="25%">X-motion, mm</td>
                    <td colspan="3" width="25%"><input class="le-input form-control" name="xMotion"
                                                       value="${machine.xMotion}" type="number"/></td>
                    <td colspan="3" width="25%">Y-motion, mm</td>
                    <td colspan="3" width="25%"><input class="le-input form-control" name="yMotion"
                                                       value="${machine.yMotion}" type="number"/></td>
                </tr>
                <tr>
                    <td colspan="3" width="25%">Z-motion, mm</td>
                    <td colspan="3" width="25%"><input class="le-input form-control" name="zMotion"
                                                       value="${machine.zMotion}" type="number"/></td>
                    <td colspan="3" width="25%">X table size, mm</td>
                    <td colspan="3" width="25%"><input class="le-input form-control" name="xTableSize"
                                                       value="${machine.xTableSize}" type="number"/></td>
                </tr>
                <tr>
                    <td colspan="3" width="25%">Y table size, mm</td>
                    <td colspan="3" width="25%"><input class="le-input form-control" name="yTableSize"
                                                       value="${machine.yTableSize}" type="number"/></td>
                    <td colspan="3" width="25%">Table load, kg</td>
                    <td colspan="3" width="25%"><input class="le-input form-control" name="tableLoad"
                                                       value="${machine.tableLoad}" type="text"/></td>
                </tr>
                <tr>
                    <td colspan="3" width="25%">Spindle taper</td>
                    <td colspan="3" width="25%"><input class="le-input form-control" name="spindleTaper"
                                                       value="${machine.spindleTaper}" type="text"/></td>
                    <td colspan="3" width="25%">Spindle rotation frequency, rev/min</td>
                    <td colspan="3" width="25%"><input class="le-input form-control" name="spindleRotationFreq"
                                                       value="${machine.spindleRotationFreq}" type="text"/></td>
                </tr>
                <tr>
                    <td colspan="3" width="25%">Spindle power, kw</td>
                    <td colspan="3" width="25%"><input class="le-input form-control" name="spindlePower"
                                                       value="${machine.spindlePower}" type="text"/></td>
                    <td colspan="3" width="25%">Tool count, pcs.</td>
                    <td colspan="3" width="25%"><input class="le-input form-control" name="toolCount"
                                                       value="${machine.toolCount}" type="text"/></td>
                </tr>
                <tr>
                    <td colspan="3" width="25%">Max tool diameter, mm</td>
                    <td colspan="3" width="25%"><input class="le-input form-control" name="maxToolDiameter"
                                                       value="${machine.maxToolDiameter}" type="text"/></td>
                    <td colspan="3" width="25%">Max tool weight, kg</td>
                    <td colspan="3" width="25%"><input class="le-input form-control" name="maxToolWeight"
                                                       value="${machine.maxToolWeight}" type="text"/></td>
                </tr>
                <tr>
                    <td colspan="3" width="25%">Max tool length, mm</td>
                    <td colspan="3" width="25%"><input class="le-input form-control" name="maxToolLength"
                                                       value="${machine.maxToolLength}" type="text"/></td>
                    <td colspan="3" width="25%">Tool replacement time, sec</td>
                    <td colspan="3" width="25%"><input class="le-input form-control" name="toolReplacementTime"
                                                       value="${machine.toolReplacementTime}" type="text"/></td>
                </tr>
                <tr>
                    <td colspan="3" width="25%">Chip replacement time, sec</td>
                    <td colspan="3" width="25%"><input class="le-input form-control" name="chipReplacementTime"
                                                       value="${machine.chipReplacementTime}" type="text"/></td>
                    <td colspan="3" width="25%">Position/reposition precision, mm</td>
                    <td colspan="3" width="25%"><input class="le-input form-control" name="positionRepositionPrecision"
                                                       value="${machine.positionRepositionPrecision}" type="text"/></td>
                </tr>
                <tr>
                    <td colspan="3" width="25%">Spindle runtime, h</td>
                    <td colspan="3" width="25%"><input class="le-input form-control" name="spindleRuntime"
                                                       value="${machine.spindleRuntime}" type="text"/></td>
                    <td colspan="3" width="25%">Machine launching, h</td>
                    <td colspan="3" width="25%"><input class="le-input form-control" name="machineLaunching"
                                                       value="${machine.machineLaunching}" type="text"/></td>
                </tr>
                <tr>
                    <td colspan="3" width="25%">Image 1 (main)</td>
                    <td colspan="3" width="25%"><input class="le-input form-control" name="photo1"
                                                       value="${machine.photo1}" type="text"/></td>
                    <td colspan="3" width="25%">Image 2</td>
                    <td colspan="3" width="25%"><input class="le-input form-control" name="photo2"
                                                       value="${machine.photo2}" type="text"/></td>
                </tr>
                <tr>
                    <td colspan="3" width="25%">Image 3</td>
                    <td colspan="3" width="25%"><input class="le-input form-control" name="photo3"
                                                       value="${machine.photo3}" type="text"/></td>
                    <td colspan="3" width="25%">Image 4</td>
                    <td colspan="3" width="25%"><input class="le-input form-control" name="photo4"
                                                       value="${machine.photo4}" type="text"/></td>
                </tr>
                <tr>
                    <td colspan="3" width="25%">Image 5</td>
                    <td colspan="3" width="25%"><input class="le-input form-control" name="photo5"
                                                       value="${machine.photo5}" type="text"/></td>
                    <td colspan="3" width="25%">Video 1</td>
                    <td colspan="3" width="25%"><input class="le-input form-control" name="video1"
                                                       value="${machine.video1}" type="text"/></td>
                </tr>
                <tr>
                    <td colspan="3" width="25%">Video 2</td>
                    <td colspan="3" width="25%"><input class="le-input form-control" name="video2"
                                                       value="${machine.video2}" type="text"/></td>
                    <td colspan="3" width="25%">Video 3</td>
                    <td colspan="3" width="25%"><input class="le-input form-control" name="video3"
                                                       value="${machine.video3}" type="text"/></td>
                </tr>
                <tr>
                    <td colspan="3" width="25%">Price</td>
                    <td colspan="3" width="25%"><input class="le-input form-control" name="price"
                                                       value="${machine.price}" type="number"/></td>
                    <td colspan="3" width="25%">Is sold</td>
                    <td colspan="3" width="25%"><input class="le-input form-control" name="isSold"
                                                       value="${machine.isSold}" type="text"/></td>
                </tr>
                <tr>
                    <td colspan="3" width="25%">Description</td>
                    <td colspan="9" width="75%"><textarea class="le-input form-control" rows="10" name="descriptionEn">${machine.descriptionEn}</textarea></td>
                </tr>
            </table>
            <h3>Images:</h3>

            <div class="container-fluid no-margin">
                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-xs-offset-1">
                        <img src="../resources/images/products/${machine.photo1}" class="img-responsive"/>
                        <span style="font-size:0.85em">${machine.photo1}<br>(main photo)</span>
                    </div>
                    <c:if test="${machine.photo2!=''}">
                        <div class="col-xs-2 col-sm-2">
                            <img src="../resources/images/products/${machine.photo2}" class="img-responsive"/>
                            <span style="font-size:0.85em">${machine.photo2}</span>
                        </div>
                    </c:if>
                    <c:if test="${machine.photo3!=''}">
                        <div class="col-xs-2 col-sm-2">
                            <img src="../resources/images/products/${machine.photo3}" class="img-responsive"/>
                            <span style="font-size:0.85em">${machine.photo3}</span>
                        </div>
                    </c:if>
                    <c:if test="${machine.photo4!=''}">
                        <div class="col-xs-2 col-sm-2">
                            <img src="../resources/images/products/${machine.photo4}" class="img-responsive"/>
                            <span style="font-size:0.85em">${machine.photo4}</span>
                        </div>
                    </c:if>
                    <c:if test="${machine.photo5!=''}">
                        <div class="col-xs-2 col-sm-2">
                            <img src="../resources/images/products/${machine.photo5}" class="img-responsive"/>
                            <span style="font-size:0.85em">${machine.photo5}</span>
                        </div>
                    </c:if>
                </div>
            </div>
            <h3>Video:</h3>
            <c:if test="${machine.video1!=''}">
                <iframe width="300" height="169" src="${machine.video1}" frameborder="0" allowfullscreen></iframe>
            </c:if>
            <c:if test="${machine.video2!=''}">
                <iframe width="300" height="169" src="${machine.video2}" frameborder="0" allowfullscreen></iframe>
            </c:if>
            <c:if test="${machine.video3!=''}">
                <iframe width="300" height="169" src="${machine.video3}" frameborder="0" allowfullscreen></iframe>
            </c:if>
            <c:if test="${machine.video1=='' && machine.video2=='' && machine.video3==''}">
                <h4>All video fields are empty. So that's common video.</h4>
                <iframe width="300" height="169" src="https://www.youtube.com/embed/0YSScR4PbLw" frameborder="0"
                        allowfullscreen></iframe>
            </c:if>
            <br>
            <div class="btn-submit">
                <input type="submit" value="Save" class="button" style="font-weight: normal"/>
            </div>
            <br>
        </form:form>
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
    <form:form class="formBox" method="post" action="hmc/upload"
               enctype="multipart/form-data">

        <fieldset>
            <div class="clearfix file">
                <div class="lab"><label for="textFile">Upload file with machines</label></div>
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
    <form:form class="formBox" method="post" action="hmc/renewFilters">

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
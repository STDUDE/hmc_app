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
    <title>Admin. Users</title>
    <link href="../resources/admin/css/default.css" rel="stylesheet" type="text/css" media="screen"/>
    <link href="../resources/admin/css/gray.css" rel="stylesheet" type="text/css" media="screen"/>
    <link href="../resources/admin/css/datePicker.css" rel="stylesheet" type="text/css" media="screen"/>
    <link href="../resources/admin/css/wysiwyg.css" rel="stylesheet" type="text/css" media="screen"/>
    <link href="../resources/admin/css/fancybox-1.3.1.css" rel="stylesheet" type="text/css" media="screen"/>
    <link href="../resources/admin/css/visualize.css" rel="stylesheet" type="text/css" media="screen"/>

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="../resources/css/bootstrap.min.css">

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
                <li class="home"><a href="/admin/orders">Orders</a></li>
                <li class="home">&nbsp;|&nbsp;</li>
                <li class="home"><a href="/admin/users" style="font-weight: bold; color: #008B00">Users</a></li>
            </ul>
        </div>
        <!-- /breadcrumbs -->
        <div id="top"></div>
        <!-- box -->
        <div class="tabs box">
            <ul class="bookmarks">
                <li><a href="#users">Users</a></li>
            </ul>
            <div class="box-content">
                <div id="edit">
                    <c:if test="${empty userList}">
                        <h3>No users.</h3>
                    </c:if>
                    <c:set var="itemsPerPage" value="${itemsPerPage}"/>
                    <c:set var="itemsNum" value="${itemsNum}"/>
                    <table class="table table-bordered table-condensed">
                        <tr>
                            <td>№</td>
                            <td>Username</td>
                            <td>Email</td>
                            <td>Role</td>
                        </tr>
                        <c:forEach items="${userList}" var="user" varStatus="loop">
                            <tr>
                                <td>${loop.index + 1}.</td>
                                <td>${user.username}</td>
                                <td>${user.email}</td>
                                <td>
                                    <form:form method="post" class="form-inline">
                                        <select  class="form-control" name="userRole">
                                            <c:set var="roles">ROLE_USER;ROLE_ADMIN</c:set>
                                            <c:forTokens items="${roles}" delims=";" var="role">
                                                <option value="${role}" <c:if test="${user.role == role}">selected</c:if>>${role}</option>
                                            </c:forTokens>
                                        </select>
                                        <input type="hidden" name="userId" value="${user.num}">
                                        <input type="submit" value="Save role" class="button black-button" style="font-weight: normal"/>
                                    </form:form>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>

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
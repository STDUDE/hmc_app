<!-- #header -->
<div id="header">
    <!-- #logo -->
    <div id="logo">
        <a href="#" title="Go to Homepage"><span>HMC Admin</span></a>
    </div>
    <!-- /#logo -->
    <!-- #user -->
    <div id="user">
        <c:url value="/admin/j_spring_security_logout" var="logoutUrl" />
        <form:form action="${logoutUrl}" method="post" id="logoutForm">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form:form>
        <h2>${pageContext.request.userPrincipal.name}</h2>
        <a href="#" onclick="$('#logoutForm').submit()">Logout</a>
    </div>
    <!-- /#user -->
</div>
<!-- /header -->

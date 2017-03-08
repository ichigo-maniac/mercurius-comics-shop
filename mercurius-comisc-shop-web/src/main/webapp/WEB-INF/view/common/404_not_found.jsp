<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/view/common/css_style_libraries.jsp"/>
    <title>Page not found</title>
</head>
<body>
<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
    <%-- Toolbar --%>
    <jsp:include page="/WEB-INF/view/common/toolbar.jsp"/>
    <%-- Main container --%>
    <div class="mercurius-content mdl-layout__content" style="text-align: center">
        <a name="top"></a>
        <h3>We're sorry. This page doesn't exist (｡T ω T｡)</h3>
        <img style="max-width: 800px;" src="/resources/app/images/404_banner.png" class="img-rounded">
    </div>
</div>
<%--<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">--%>
    <%--<div class="mercurius-content mdl-layout__content" style="text-align: center">--%>
        <%--<h3>We're sorry. This page doesn't exist</h3>--%>
        <%----%>
    <%--</div>--%>
<%--</div>--%>
<jsp:include page="/WEB-INF/view/common/javascript_libraries.jsp"/>
</body>
</html>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <jsp:include page="/WEB-INF/view/common/css_style_libraries.jsp"/>
    <title>Main page</title>
</head>
<body>
<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
    <%-- Toolbar --%>
    <jsp:include page="/WEB-INF/view/common/toolbar.jsp"/>
    <%-- Main container --%>
    <div class="android-content mdl-layout__content">
        <a name="top"></a>
        <%-- Banner --%>
        <div class="android-customized-section">
            <div class="android-customized-section-text" style="padding-top: 0px;">
                <h3 style="padding: 15px;">Mercurius comics shop</h3>
            </div>
            <div class="android-customized-section-image" style="max-height: 350px;"></div>
        </div>
        <%-- Top sales --%>
        <div class="android-more-section">
            <%-- Catalog --%>
            <div class="android-card-container mdl-grid">
                <%--<div class="row">--%>
                    <div class="col-xs-6 col-md-4">
                        <ul class="list-group">
                            <a href="<c:url value="${mainCategory.code}"/>" class="list-group-item active">
                                <c:out value="${mainCategory.name}"/>
                            </a>
                            <c:forEach var="category" items="${categories}">
                                <li class="list-group-item">
                                    <a href="<c:url value=""/>">
                                        <c:out value="${category.name}"/>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="col-xs-12 col-md-8">Products</div>
            </div>
        </div>
    </div>
</div>
<%-- Javascript libraries --%>
<jsp:include page="/WEB-INF/view/common/javascript_libraries.jsp"/>
</body>
</html>
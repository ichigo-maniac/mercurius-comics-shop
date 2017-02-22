<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <jsp:include page="/WEB-INF/view/common/css_style_libraries.jsp"/>
    <title>Mercurius comics shop</title>
</head>
<body>
<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
    <%-- Toolbar --%>
    <jsp:include page="/WEB-INF/view/common/toolbar.jsp"/>
    <%-- Main container --%>
    <div class="android-content mdl-layout__content">
        <a name="top"></a>

        <div class="android-more-section">
            <%-- Catalog --%>
            <div class="android-card-container mdl-grid">
                <%-- Categories --%>
                <div class="col-xs-6 col-md-4">
                    <ul class="list-group">
                        <a href="<c:url value="/${mainCategory.code}"/>" class="list-group-item active">
                            <c:out value="${mainCategory.name}"/>
                        </a>
                        <c:forEach var="category" items="${categories}">
                            <li class="list-group-item">
                                <a href="<c:url value="${category.builtUrl}"/>">
                                    <c:out value="${category.name}"/>
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <%-- Products --%>
                <div class="col-xs-12 col-md-8">
                    <img src="/resources/app/images/banner.png" alt="..." class="img-thumbnail">
                </div>
            </div>
        </div>
    </div>
</div>
<%-- Javascript libraries --%>
<jsp:include page="/WEB-INF/view/common/javascript_libraries.jsp"/>
</body>
</html>
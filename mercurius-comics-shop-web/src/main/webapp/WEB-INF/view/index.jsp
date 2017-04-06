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
    <div class="mercurius-content mdl-layout__content">
        <a name="top"></a>

        <div class="mercurius-more-section">
            <%-- Catalog --%>
            <div class="mercurius-card-container mdl-grid">
                <%-- Categories --%>
                <div class="col-xs-6 col-md-3">
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
                <div class="col-xs-12 col-md-9">
                    <img src="/resources/app/images/banner.png" class="img-thumbnail">
                    <h2>New releases</h2>
                    <div class="mercurius-card-container mdl-grid">
                        <c:forEach var="product" items="${products}" varStatus="loop">
                            <div class="col-md-4" style="text-align: center">
                                <img src="/resources/app/images/no_image.jpg" class="img-thumbnail">
                                <a href="<c:url value="/product/${product.code}"/>">
                                    <h4><c:out value="${product.name}"/></h4>
                                </a>
                                <h4>
                                    <c:choose>
                                        <c:when test="${product.price != null}">
                                            <c:out value="${product.price.priceValue} ${product.price.currency.code}"/>
                                        </c:when>
                                        <c:otherwise>
                                            Not available
                                        </c:otherwise>
                                    </c:choose>
                                </h4>
                                <button class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent">
                                    Add to cart
                                </button>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%-- Javascript libraries --%>
<jsp:include page="/WEB-INF/view/common/javascript_libraries.jsp"/>
</body>
</html>
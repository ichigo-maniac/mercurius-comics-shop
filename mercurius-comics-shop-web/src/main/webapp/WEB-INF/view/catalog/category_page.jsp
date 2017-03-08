<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <jsp:include page="/WEB-INF/view/common/css_style_libraries.jsp"/>
    <title><c:out value="${category.name}"/> - Mercurius comics shop</title>
</head>
<body>
<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
    <%-- Toolbar --%>
    <jsp:include page="/WEB-INF/view/common/toolbar.jsp"/>
    <%-- Main container --%>
    <div class="mercurius-content mdl-layout__content">
        <a name="top"></a>
        <%-- Top sales --%>
        <div class="mercurius-more-section">
            <%-- Catalog --%>
            <div class="mercurius-card-container mdl-grid">
                <%-- Categories and filters--%>
                <div class="col-xs-6 col-md-4">
                    <c:if test="${not empty categories}">
                        <ul class="list-group">
                            <li class="list-group-item active">Subcategories</li>
                            <c:forEach var="category" items="${categories}">
                                <li class="list-group-item">
                                    <a href="<c:url value="${category.builtUrl}"/>">
                                        <c:out value="${category.name}"/>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </c:if>
                    <%-- Facets (dummy)  --%>
                    <div class="panel panel-success">
                        <div class="panel-heading">Genre</div>
                        <div class="panel-body">
                            <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="checkbox-1">
                                <input type="checkbox" id="checkbox-1" class="mdl-checkbox__input" checked>
                                <span class="mdl-checkbox__label" style="font-weight: normal; margin-left: 10px;">Fantasy</span>
                            </label>
                            <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="checkbox-2">
                                <input type="checkbox" id="checkbox-2" class="mdl-checkbox__input">
                                <span class="mdl-checkbox__label" style="font-weight: normal; margin-left: 10px;">Science-fiction</span>
                            </label>
                            <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="checkbox-3">
                                <input type="checkbox" id="checkbox-3" class="mdl-checkbox__input">
                                <span class="mdl-checkbox__label" style="font-weight: normal; margin-left: 10px;">Drama</span>
                            </label>
                        </div>
                    </div>
                    <div class="panel panel-success">
                        <div class="panel-heading">Country</div>
                        <div class="panel-body">
                            <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="checkbox-1">
                                <input type="checkbox" id="checkbox-4" class="mdl-checkbox__input" checked>
                                <span class="mdl-checkbox__label" style="font-weight: normal; margin-left: 10px;">Japan</span>
                            </label>
                            <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="checkbox-2">
                                <input type="checkbox" id="checkbox-5" class="mdl-checkbox__input">
                                <span class="mdl-checkbox__label" style="font-weight: normal; margin-left: 10px;">Republic of Korea</span>
                            </label>
                        </div>
                    </div>
                </div>
                <%-- Products --%>
                <div class="col-xs-12 col-md-8">
                    <%-- Bread crumbs --%>
                    <ol class="breadcrumb" style="background-color: white; border: 1px solid lightgray">
                        <li><a href="<c:url value="/"/>">Main page</a></li>
                        <c:forEach var="categoryCrumb" items="${category.breadCrumbs}">
                            <c:choose>
                                <c:when test="${categoryCrumb.code eq category.code}">
                                    <li class="active"><c:out value="${categoryCrumb.name}"/></li>
                                </c:when>
                                <c:otherwise>
                                    <li><a href="<c:url value="${categoryCrumb.builtUrl}"/>"><c:out value="${categoryCrumb.name}"/></a></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </ol>
                    <%-- Products --%>
                    <div class="panel panel-default" style="margin-bottom: 0px">
                        <%-- Empty search result --%>
                        <c:if test="${productsResult.totalEntriesCount == 0}">
                            <h4 style="text-align: center; padding: 15px;">No products have been found</h4>
                        </c:if>
                        <%-- Products --%>
                        <c:forEach var="product" items="${productsResult.entries}" varStatus="loop">
                            <div class="panel-body" <c:if test="${loop.index != 0}">style="border-top: 1px solid lightgray"</c:if>>
                                <div class="row">
                                    <div class="col-md-2">
                                        <img src="/resources/app/images/dummy/sao${(loop.index % 6) + 1}.jpg" class="img-thumbnail">
                                    </div>
                                    <div class="col-md-7">
                                        <h4><a href="<c:url value="/product/${product.code}"/>"><c:out value="${product.name}"/></a></h4>
                                        <h5 style="color: gray"><c:out value="${product.shortName}"/></h5>
                                    </div>
                                    <div class="col-md-3" style="text-align: center">
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
                                        <img width="36" class="icon-button" src="/resources/app/images/icons/button_add_to_cart.png">
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <%-- Pagination --%>
                    <jsp:include page="/WEB-INF/view/catalog/category_pagination_fragment.jsp"/>
                </div>
            </div>
        </div>
    </div>
</div>
<%-- Javascript libraries --%>
<jsp:include page="/WEB-INF/view/common/javascript_libraries.jsp"/>
</body>
</html>
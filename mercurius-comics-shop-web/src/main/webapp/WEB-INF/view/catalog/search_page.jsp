<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="catalog" tagdir="/WEB-INF/tags/catalog" %>
<!doctype html>
<html lang="en">
<head>
    <jsp:include page="/WEB-INF/view/common/css_style_libraries.jsp"/>
    <title><c:out value="${searchText}"/> - search result - Mercurius comics shop</title>
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
                <%-- Filters--%>
                <div class="col-xs-6 col-md-4">
                    <%-- Facets --%>
                    <form method="GET" action="${builtUrl}">
                        <%-- Price --%>
                        <input type="hidden" name="searchText" value="<c:out value="${searchText}"/>">
                        <catalog:catalog_price_facet bottomPrice="${bottomPrice}" topPrice="${topPrice}"/>
                        <%-- Facets --%>
                        <catalog:catalog_facets facetPrefix="${facetPrefix}" facets="${facets}"/>
                        <div class="bs-example" data-example-id="btn-variants">
                            <button type="submit" style="width: 100%" type="button" class="btn btn-success">
                                <spring:message code="comics.shop.catalog.search.button.label"/>
                            </button>
                        </div>
                    </form>
                </div>
                <%-- Products --%>
                <div class="col-xs-12 col-md-8">
                    <%-- Bread crumbs --%>
                    <ol class="breadcrumb" style="background-color: white; border: 1px solid lightgray">
                        <li><a href="<c:url value="/"/>"><spring:message code="comics.shop.main.page.label"/></a></li>
                        <li><c:out value="${searchText}"/></li>
                    </ol>
                    <%-- Products --%>
                    <div class="panel panel-default" style="margin-bottom: 0px">
                        <%-- Empty search result --%>
                        <c:if test="${productsResult.totalEntriesCount == 0}">
                            <h4 style="text-align: center; padding: 15px;"><spring:message code="comics.shop.catalog.no.products"/></h4>
                        </c:if>
                        <%-- Products --%>
                        <c:forEach var="product" items="${productsResult.entries}" varStatus="loop">
                            <div class="panel-body" <c:if test="${loop.index != 0}">style="border-top: 1px solid lightgray"</c:if>>
                                <div class="row">
                                    <div class="col-md-2">
                                        <img src="/resources/app/images/no_image.jpg" class="img-thumbnail">
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
                    <catalog:catalog_pagination productsResult="${productResult}"
                                                queryParams="${queryParams}"
                                                bottomPrice="${bottomPrice}"
                                                topPrice="${topPrice}"
                                                builtUrl="${builtUrl}"/>
                </div>
            </div>
        </div>
    </div>
</div>
<%-- Javascript libraries --%>
<jsp:include page="/WEB-INF/view/common/javascript_libraries.jsp"/>
<script src="/resources/app/js/price.range.facet.js"></script>
</body>
</html>

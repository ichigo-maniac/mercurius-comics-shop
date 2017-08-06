<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="catalog" tagdir="/WEB-INF/tags/catalog" %>
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
                            <li class="list-group-item active"><spring:message code="comics.shop.catalog.subcategories.label"/></li>
                            <c:forEach var="category" items="${categories}">
                                <li class="list-group-item">
                                    <a href="<c:url value="${category.builtUrl}"/>">
                                        <c:out value="${category.name}"/>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </c:if>
                    <%-- Facets --%>
                    <form method="GET" action="${builtUrl}">
                        <%-- Price --%>
                        <catalog:catalog_price_facet bottomPrice="${bottomPrice}" topPrice="${topPrice}"/>
                        <%-- Facets --%>
                        <c:if test="${not empty facets}">
                            <c:forEach var="facet" items="${facets}">
                                <div class="panel panel-success">
                                    <div class="panel-heading"><c:out value="${facet.name}"/></div>
                                    <c:set var="facetValuesName" scope="page" value="${facetPrefix}${facet.solrDocumentFieldName}"/>
                                    <div class="panel-body">
                                        <c:forEach var="dictionaryItem" items="${facet.availableValues}">
                                            <%-- Check - is value selected --%>
                                            <c:set var="selectedValue" value="false" scope="page"/>
                                            <c:forEach var="currentValue" items="${requestScope[facetValuesName]}">
                                                <c:if test="${currentValue eq dictionaryItem.code}">
                                                    <c:set var="selectedValue" value="true" scope="page"/>
                                                </c:if>
                                            </c:forEach>
                                            <%-- Show facet --%>
                                            <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="checkbox-<c:out value="${dictionaryItem.code}"/>">
                                                <input type="checkbox" id="checkbox-<c:out value="${dictionaryItem.code}"/>"
                                                       <c:if test="${selectedValue}">checked</c:if>
                                                       name="<c:out value="${facetPrefix}"/><c:out value="${facet.solrDocumentFieldName}"/>"
                                                       class="mdl-checkbox__input" value="<c:out value="${dictionaryItem.code}"/>">
                                                <span class="mdl-checkbox__label" style="font-weight: normal; margin-left: 10px;">
                                                    <c:out value="${dictionaryItem.name}"/>
                                                </span>
                                            </label>
                                        </c:forEach>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
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
                                                builtUrl="${category.builtUrl}"/>
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

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <jsp:include page="/WEB-INF/view/common/css_style_libraries.jsp"/>
    <title><c:out value="${product.name}"/> - Mercurius comics shop</title>
</head>
<body>
<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
    <%-- Toolbar --%>
    <jsp:include page="/WEB-INF/view/common/toolbar.jsp"/>
    <%-- Main container --%>
    <div class="mercurius-content mdl-layout__content">
        <a name="top"></a>
        <div class="mercurius-more-section">
            <%-- Header --%>
            <div style="background-color: white; padding: 5px 20px 10px 25px; border-bottom: 1px solid lightgray;">
                <%-- Bread crumbs --%>
                <ol class="breadcrumb" style="background: white; padding: 10px 0px 5px 0px; margin-bottom: 5px;">
                    <li><a style="color: gray" href="<c:url value="/"/>">Main page</a></li>
                    <c:forEach var="categoryCrumb" items="${product.breadCrumbs}">
                        <li><a style="color: gray" href="<c:url value="${categoryCrumb.builtUrl}"/>"><c:out value="${categoryCrumb.name}"/></a></li>
                    </c:forEach>
                </ol>
                <h2 style="font-weight: bold; margin-top: 0px;"><c:out value="${product.name}"/></h2>
            </div>
            <%-- Body --%>
            <div style="background-color: white;">
                <div class="row" style="padding: 15px 10px 10px 10px">
                    <%-- Image --%>
                    <div class="col-md-4" style="text-align: center;">
                        <img src="/resources/app/images/dummy/sao1.jpg" class="img-thumbnail">
                    </div>
                    <%-- Panel --%>
                    <div class="col-md-5" >
                        <p style="font-size: 85%; line-height: 150%;">
                            <c:out value="${product.description}"/>
                        </p>
                    </div>
                    <div class="col-md-3">

                        <div class="panel panel-default">
                            <div class="panel-body" style="padding: 0px;">
                                <h3 style="font-weight: bold; margin-left: 15px;">
                                    <c:choose>
                                        <c:when test="${product.price != null}">
                                            <c:out value="${product.price.priceValue} ${product.price.currency.code}"/>
                                        </c:when>
                                        <c:otherwise>
                                            Not available
                                        </c:otherwise>
                                    </c:choose>
                                </h3>
                                <!-- Stock -->
                                <div style="background-color: #F7F7F7; padding: 10px;">
                                    <div class="row">
                                        <div class="col-md-7">
                                            <img style="margin-left: 10px;" width="16" src="/resources/app/images/icons/warehouse.png">
                                            <span style="margin-left: 7px;"> In stock :</span>
                                        </div>
                                        <c:choose>
                                            <c:when test="${product.defaultStock.availableProductsCount > 100}">
                                                <div class="col-md-4"><strong>A lot</strong></div>
                                            </c:when>
                                            <c:when test="${product.defaultStock.availableProductsCount < 100 and product.defaultStock.availableProductsCount > 0}">
                                                <div class="col-md-4" style="color: red;"><strong>A few</strong></div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="col-md-4" style="color: red; font-weight: bold"><strong>Sold</strong></div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                                <div style="padding : 15px;">
                                    <button <c:if test="${product.defaultStock.availableProductsCount <= 0 or product.price == null}">disabled</c:if>
                                            class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" style="width: 100%">
                                        Add to cart
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%-- Tabs --%>
            <div class="mdl-tabs mdl-js-tabs mdl-js-ripple-effect" style="background-color: white; border-top: 1px solid lightgrey">
                <div class="mdl-tabs__tab-bar" >
                    <a href="#description-panel" class="mdl-tabs__tab is-active">Description</a>
                    <a href="#specifications-panel" class="mdl-tabs__tab">Specifications</a>
                </div>
                <div class="mdl-tabs__panel is-active" id="description-panel" style="padding: 15px 20px 15px 20px;">
                    <p>
                        <c:out value="${product.description}"/>
                    </p>
                </div>
                <div class="mdl-tabs__panel" id="specifications-panel">
                    <table class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp" style="width: 100%;">
                        <thead>
                        <tr>
                            <th class="mdl-data-table__cell--non-numeric">Material</th>
                            <th>Quantity</th>
                            <th>Unit price</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td class="mdl-data-table__cell--non-numeric">Acrylic (Transparent)</td>
                            <td>25</td>
                            <td>$2.90</td>
                        </tr>
                        <tr>
                            <td class="mdl-data-table__cell--non-numeric">Plywood (Birch)</td>
                            <td>50</td>
                            <td>$1.25</td>
                        </tr>
                        <tr>
                            <td class="mdl-data-table__cell--non-numeric">Laminate (Gold on Blue)</td>
                            <td>10</td>
                            <td>$2.35</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<%-- Javascript libraries --%>
<jsp:include page="/WEB-INF/view/common/javascript_libraries.jsp"/>
</body>
</html>
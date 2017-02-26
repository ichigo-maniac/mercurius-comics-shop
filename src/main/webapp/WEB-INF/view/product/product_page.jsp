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
                    <div class="col-md-4" >
                        <p style="font-size: 85%; line-height: 150%;">
                            Denote simple fat denied add worthy little use. As some he so high down am week.
                            Conduct esteems by cottage to pasture we winding. On assistance he cultivated considered frequently.
                            Person how having tended direct own day man. Saw sufficient indulgence one own you inquietude sympathize.

                            Rank tall boy man them over post now. Off into she bed long fat room.
                            Recommend existence curiosity perfectly favourite get eat she why daughters.
                            Not may too nay busy last song must sell. An newspaper assurance discourse ye certainly. Soon gone game and why many calm have.

                            An sincerity so extremity he additions. Her yet there truth merit.
                            Mrs all projecting favourable now unpleasing. Son law garden chatty temper.
                            Oh children provided to mr elegance marriage strongly. Off can admiration prosperous now devonshire diminution law.
                        </p>
                    </div>
                    <div class="col-md-4">

                        <div class="panel panel-default">
                            <div class="panel-body" style="padding: 0px;">
                                <h3 style="font-weight: bold; margin-left: 15px;">500 RUB</h3>
                                <div style="background-color: #F7F7F7; padding: 10px;">
                                    <div class="row">
                                        <div class="col-md-8">In stock :</div>
                                        <div class="col-md-4"><strong>A lot</strong></div>
                                    </div>
                                </div>
                                <div style="padding : 15px;">
                                    <button class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" style="width: 100%">
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
                        Denote simple fat denied add worthy little use. As some he so high down am week.
                        Conduct esteems by cottage to pasture we winding. On assistance he cultivated considered frequently.
                        Person how having tended direct own day man. Saw sufficient indulgence one own you inquietude sympathize.

                        Rank tall boy man them over post now. Off into she bed long fat room.
                        Recommend existence curiosity perfectly favourite get eat she why daughters.
                        Not may too nay busy last song must sell. An newspaper assurance discourse ye certainly. Soon gone game and why many calm have.

                        An sincerity so extremity he additions. Her yet there truth merit.
                        Mrs all projecting favourable now unpleasing. Son law garden chatty temper.
                        Oh children provided to mr elegance marriage strongly. Off can admiration prosperous now devonshire diminution law.
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
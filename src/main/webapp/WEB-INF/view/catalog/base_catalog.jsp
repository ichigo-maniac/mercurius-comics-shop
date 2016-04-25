<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Introducing Lollipop, a sweet new take on Android.">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <title>Catalog</title>

    <!-- Page styles -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="/resources/css/material.min.css">
    <link rel="stylesheet" href="/resources/css/styles.css">
    <style>
        #view-source {
            position: fixed;
            display: block;
            right: 0;
            bottom: 0;
            margin-right: 40px;
            margin-bottom: 40px;
            z-index: 900;
        }
    </style>
</head>
<body>
<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
    <%-- Toolbar --%>
    <jsp:include page="/WEB-INF/view/common/toolbar.jsp"/>
    <%-- Main container --%>
    <div class="android-content mdl-layout__content">
        <a name="top"></a>
        <%-- Catalog --%>
        <div class="android-more-section">
            <div class="android-section-title mdl-typography--display-1-color-contrast">Catalog</div>
            <div class="android-card-container mdl-grid">
                <c:forEach var="category" items="${categories}">
                    <div class="mdl-cell mdl-cell--4-col mdl-cell--4-col-tablet mdl-cell--4-col-phone mdl-card mdl-shadow--3dp">
                        <div class="mdl-card__media">
                            <img src="/resources/images/books/catalog-cover.jpg">
                        </div>
                        <div class="mdl-card__title" style="padding-top: 0px; padding-bottom: 5px;">
                            <h5 class="mdl-color-text--blue-900">
                                <a href="<c:url value="/catalog/${category.code}"/>"><c:out value="${category.name}"/></a>
                            </h5>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<%-- Javascript libraries --%>
<script src="/resources/js/material.min.js"></script>
</body>
</html>
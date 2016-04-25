<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Introducing Lollipop, a sweet new take on Android.">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <title>Index page</title>

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
        <%-- Banner --%>
        <div class="android-customized-section">
            <div class="android-customized-section-text">
                <h3 style="margin: 0px;"><a href="<c:url value="/product/000100"/>">Attack on titan vol. 06</a></h3>

                <p class="mdl-typography--font-light">
                    A new book on the market. Meet the continuation of a series "Attack on titans".
                </p>
            </div>
            <div class="android-customized-section-image"></div>
        </div>
        <%-- Top sales --%>
        <div class="android-more-section">
            <div class="android-section-title mdl-typography--display-1-color-contrast">New merchandise</div>
            <div class="android-card-container mdl-grid">
                <div class="mdl-cell mdl-cell--4-col mdl-cell--4-col-tablet mdl-cell--4-col-phone mdl-card mdl-shadow--3dp">
                    <div class="mdl-card__media">
                        <img src="/resources/images/books/vol01.jpg">
                    </div>
                    <div class="mdl-card__title" style="padding-top: 0px; padding-bottom: 25px;">
                        <h5 class="mdl-color-text--blue-900"><a href="<c:url value="/product/00000"/>">Attack on titan
                            vol. 01</a></h5>
                    </div>
                    <br>

                    <div class="mdl-card__actions" style="text-align: right">
                        <span class="mdl-color-text--green-900 mdl-typography--font-bold">300 RUB</span>
                        &nbsp;&#0183;&nbsp
                        <button class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--raised mdl-button--colored mdl-color--blue-700">
                            Add to cart
                        </button>
                    </div>
                </div>

                <div class="mdl-cell mdl-cell--4-col mdl-cell--4-col-tablet mdl-cell--4-col-phone mdl-card mdl-shadow--3dp">
                    <div class="mdl-card__media">
                        <img src="/resources/images/books/vol02.jpg">
                    </div>
                    <div class="mdl-card__title" style="padding-top: 0px; padding-bottom: 25px;">
                        <h5 class="mdl-color-text--blue-900"><a href="<c:url value="/product/00000"/>">Attack on titan
                            vol. 02</a></h5>
                    </div>
                    <br>

                    <div class="mdl-card__actions" style="text-align: right">
                        <span class="mdl-color-text--green-900 mdl-typography--font-bold">300 RUB</span>
                        &nbsp;&#0183;&nbsp
                        <button class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--raised mdl-button--colored mdl-color--blue-700">
                            Add to cart
                        </button>
                    </div>
                </div>

                <div class="mdl-cell mdl-cell--4-col mdl-cell--4-col-tablet mdl-cell--4-col-phone mdl-card mdl-shadow--3dp">
                    <div class="mdl-card__media">
                        <img src="/resources/images/books/vol03.jpg">
                    </div>
                    <div class="mdl-card__title" style="padding-top: 0px; padding-bottom: 25px;">
                        <h5 class="mdl-color-text--blue-900"><a href="<c:url value="/product/00000"/>">Attack on titan
                            vol. 03</a></h5>
                    </div>
                    <br>

                    <div class="mdl-card__actions" style="text-align: right">
                        <span class="mdl-color-text--green-900 mdl-typography--font-bold">300 RUB</span>
                        &nbsp;&#0183;&nbsp
                        <button class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--raised mdl-button--colored mdl-color--blue-700">
                            Add to cart
                        </button>
                    </div>
                </div>

                <div class="mdl-cell mdl-cell--4-col mdl-cell--4-col-tablet mdl-cell--4-col-phone mdl-card mdl-shadow--3dp">
                    <div class="mdl-card__media">
                        <img src="/resources/images/books/vol04.jpg">
                    </div>
                    <div class="mdl-card__title" style="padding-top: 0px; padding-bottom: 25px;">
                        <h5 class="mdl-color-text--blue-900"><a href="<c:url value="/product/00000"/>">Attack on titan
                            vol. 04</a></h5>
                    </div>
                    <br>

                    <div class="mdl-card__actions" style="text-align: right">
                        <span class="mdl-color-text--green-900 mdl-typography--font-bold">300 RUB</span>
                        &nbsp;&#0183;&nbsp
                        <button class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--raised mdl-button--colored mdl-color--blue-700">
                            Add to cart
                        </button>
                    </div>
                </div>

                <div class="mdl-cell mdl-cell--4-col mdl-cell--4-col-tablet mdl-cell--4-col-phone mdl-card mdl-shadow--3dp">
                    <div class="mdl-card__media">
                        <img src="/resources/images/books/vol05.jpg">
                    </div>
                    <div class="mdl-card__title" style="padding-top: 0px; padding-bottom: 25px;">
                        <h5 class="mdl-color-text--blue-900"><a href="<c:url value="/product/00000"/>">Attack on titan
                            vol. 05</a></h5>
                    </div>
                    <br>

                    <div class="mdl-card__actions" style="text-align: right">
                        <span class="mdl-color-text--green-900 mdl-typography--font-bold">300 RUB</span>
                        &nbsp;&#0183;&nbsp
                        <button class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--raised mdl-button--colored mdl-color--blue-700">
                            Add to cart
                        </button>
                    </div>
                </div>

                <div class="mdl-cell mdl-cell--4-col mdl-cell--4-col-tablet mdl-cell--4-col-phone mdl-card mdl-shadow--3dp">
                    <div class="mdl-card__media">
                        <img src="/resources/images/books/vol06.jpg">
                    </div>
                    <div class="mdl-card__title" style="padding-top: 0px; padding-bottom: 25px;">
                        <h5 class="mdl-color-text--blue-900"><a href="<c:url value="/product/00000"/>">Attack on titan
                            vol. 06</a></h5>
                    </div>
                    <br>

                    <div class="mdl-card__actions" style="text-align: right">
                        <span class="mdl-color-text--green-900 mdl-typography--font-bold">300 RUB</span>
                        &nbsp;&#0183;&nbsp
                        <button class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--raised mdl-button--colored mdl-color--blue-700">
                            Add to cart
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%-- Javascript libraries --%>
<script src="/resources/js/material.min.js"></script>
</body>
</html>
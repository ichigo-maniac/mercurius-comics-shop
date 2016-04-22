<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<!--
Material Design Lite
Copyright 2015 Google Inc. All rights reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

https://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License
-->

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Introducing Lollipop, a sweet new take on Android.">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <title>Android</title>

    <!-- Page styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en">
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

    <div class="android-header mdl-layout__header mdl-layout__header--waterfall">
        <div class="mdl-layout__header-row">
          <span class="android-title mdl-layout-title">
            <img class="android-logo-image" src="/resources/images/android-logo.png">
          </span>
            <!-- Add spacer, to align navigation to the right in desktop -->
            <div class="android-header-spacer mdl-layout-spacer"></div>
            <div class="android-search-box mdl-textfield mdl-js-textfield mdl-textfield--expandable mdl-textfield--floating-label mdl-textfield--align-right mdl-textfield--full-width">
                <label class="mdl-button mdl-js-button mdl-button--icon" for="search-field">
                    <i class="material-icons">search</i>
                </label>
                <div class="mdl-textfield__expandable-holder">
                    <input class="mdl-textfield__input" type="text" id="search-field">
                </div>
            </div>
            <!-- Navigation -->
            <div class="android-navigation-container">
                <nav class="android-navigation mdl-navigation">
                    <a class="mdl-navigation__link mdl-typography--text-uppercase" href="">Catalog</a>
                    <a class="mdl-navigation__link mdl-typography--text-uppercase" href="<c:url value="/cart"/>"><span class="mdl-badge" data-badge="0">Cart</span></a>
                    <a class="mdl-navigation__link mdl-typography--text-uppercase" href="">About us</a>
                </nav>
            </div>
          <span class="android-mobile-title mdl-layout-title">
            <img class="android-logo-image" src="/resources/images/android-logo.png">
          </span>
            <button class="android-more-button mdl-button mdl-js-button mdl-button--icon mdl-js-ripple-effect" id="more-button">
                <i class="material-icons">more_vert</i>
                Catalog
            </button>
            <ul class="mdl-menu mdl-js-menu mdl-menu--bottom-right mdl-js-ripple-effect" for="more-button">
                <li class="mdl-menu__item">5.0 Lollipop</li>
                <li class="mdl-menu__item">4.4 KitKat</li>
                <li disabled class="mdl-menu__item">4.3 Jelly Bean</li>
                <li class="mdl-menu__item">Android History</li>
            </ul>
        </div>
    </div>

    <%-- Pop-up catalog panel(categories) --%>
    <div class="android-drawer mdl-layout__drawer">
        <span class="mdl-layout-title">
          <img class="android-logo-image" src="/resources/images/android-logo-white.png">
        </span>
        <nav class="mdl-navigation">
            <c:forEach var="category" items="${categories}">
                <a class="mdl-navigation__link" href="<c:url value="/category/${category.code}"/>"><c:out value="${category.name}"/></a>
            </c:forEach>
        </nav>
    </div>
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
                        <h5 class="mdl-color-text--blue-900"><a href="<c:url value="/product/00000"/>">Attack on titan vol. 01</a></h5>
                    </div><br>
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
                        <h5 class="mdl-color-text--blue-900"><a href="<c:url value="/product/00000"/>">Attack on titan vol. 02</a></h5>
                    </div><br>
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
                        <h5 class="mdl-color-text--blue-900"><a href="<c:url value="/product/00000"/>">Attack on titan vol. 03</a></h5>
                    </div><br>
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
                        <h5 class="mdl-color-text--blue-900"><a href="<c:url value="/product/00000"/>">Attack on titan vol. 04</a></h5>
                    </div><br>
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
                        <h5 class="mdl-color-text--blue-900"><a href="<c:url value="/product/00000"/>">Attack on titan vol. 05</a></h5>
                    </div><br>
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
                        <h5 class="mdl-color-text--blue-900"><a href="<c:url value="/product/00000"/>">Attack on titan vol. 06</a></h5>
                    </div><br>
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
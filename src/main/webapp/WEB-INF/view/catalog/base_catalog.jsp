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
                    <a class="mdl-navigation__link mdl-typography--text-uppercase" href="<c:url value="/catalog"/>">Catalog</a>
                    <a class="mdl-navigation__link mdl-typography--text-uppercase" href="<c:url value="/cart"/>"><span
                            class="mdl-badge" data-badge="0">Cart</span></a>
                    <a class="mdl-navigation__link mdl-typography--text-uppercase" href="<c:url value="/about_us"/>">About
                        us</a>
                </nav>
            </div>
        </div>
    </div>

    <%-- Pop-up catalog panel(categories) --%>
    <div class="android-drawer mdl-layout__drawer">
        <span class="mdl-layout-title">
          <img class="android-logo-image" src="/resources/images/android-logo-white.png">
        </span>
        <nav class="mdl-navigation">
            <c:forEach var="category" items="${categories}">
                <a class="mdl-navigation__link" href="<c:url value="/category/${category.code}"/>"><c:out
                        value="${category.name}"/></a>
            </c:forEach>
        </nav>
    </div>

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
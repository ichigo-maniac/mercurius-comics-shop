<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="mercurius-header mdl-layout__header mdl-layout__header--waterfall">
    <div class="mdl-layout__header-row" style="padding-left: 50px;">

        <span class="mercurius-title mdl-layout-title">
            <a href="<c:url value=""/>">
                <img class="mercurius-logo-image" src="/resources/app/images/logo.png">
            </a>
        </span>


        <%-- Add spacer, to align navigation to the right in desktop --%>
        <div class="mercurius-header-spacer mdl-layout-spacer"></div>
        <%-- Navigation --%>
        <div class="mercurius-navigation-container">
            <nav class="mercurius-navigation mdl-navigation">
                <div class="mercurius-search-box mdl-textfield mdl-js-textfield mdl-textfield--expandable mdl-textfield--floating-label mdl-textfield--align-right mdl-textfield--full-width">
                    <label class="mdl-button mdl-js-button mdl-button--icon" for="search-field">
                        <i class="material-icons">search</i>
                    </label>
                    <div class="mdl-textfield__expandable-holder">
                        <input class="mdl-textfield__input" type="text" id="search-field">
                    </div>
                </div>
                <a class="mdl-navigation__link mdl-typography--text-uppercase"
                   href="<c:url value="/catalog"/>">Catalog</a>
                <a class="mdl-navigation__link mdl-typography--text-uppercase" href="<c:url value="/cart"/>"><span
                        class="mdl-badge" data-badge="0">Cart</span></a>
                <a class="mdl-navigation__link mdl-typography--text-uppercase" href="<c:url value="/about_us"/>">About
                    us</a>
            </nav>
        </div>
    </div>
</div>
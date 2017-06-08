<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<div class="mercurius-header mdl-layout__header mdl-layout__header--waterfall">
    <div class="mdl-layout__header-row" style="padding-left: 50px;">

        <span class="mercurius-title mdl-layout-title">
            <a href="<c:url value="/"/>">
                <img class="mercurius-logo-image" src="/resources/app/images/logo.png">
            </a>
        </span>


        <%-- Add spacer, to align navigation to the right in desktop --%>
        <div class="mercurius-header-spacer mdl-layout-spacer"></div>
        <%-- Navigation --%>
        <div class="mercurius-navigation-container">
            <nav class="mercurius-navigation mdl-navigation">
                <%-- Text search form --%>
                <form:form action="/search" method="GET" onsubmit='return $("#search_text").val().length > 2;'>
                    <div class="mercurius-search-box mdl-textfield mdl-js-textfield mdl-textfield--expandable">
                        <label class="mdl-button mdl-js-button mdl-button--icon" for="search_text">
                            <i class="material-icons">search</i>
                        </label>
                        <div class="mdl-textfield__expandable-holder">
                            <input class="mdl-textfield__input" type="text" name="searchText"
                                   id="search_text">
                        </div>
                    </div>
                </form:form>
                <%-- Links --%>
                <a class="mdl-navigation__link mdl-typography--text-uppercase"
                   href="<c:url value="/catalog"/>"><spring:message code="comics.shop.toolbar.catalog.label"/></a>
                <a class="mdl-navigation__link mdl-typography--text-uppercase" href="<c:url value="/cart"/>"><span
                        class="mdl-badge" data-badge="0"><spring:message code="comics.shop.toolbar.cart.label"/></span></a>
                <%-- Anonymous --%>
                <security:authorize access="isAnonymous()">
                    <a class="mdl-navigation__link mdl-typography--text-uppercase" href="#" data-toggle="modal" data-target="#sign-in-dialog">
                        <spring:message code="comics.shop.toolbar.sign.in.label"/>
                    </a>
                </security:authorize>
            </nav>
        </div>
    </div>
</div>

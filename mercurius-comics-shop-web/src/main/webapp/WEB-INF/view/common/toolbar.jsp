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
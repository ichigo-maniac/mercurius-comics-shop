<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="android-header mdl-layout__header mdl-layout__header--waterfall">
    <div class="mdl-layout__header-row" style="padding-left: 50px;">
        <%-- Add spacer, to align navigation to the right in desktop --%>
        <div class="android-header-spacer mdl-layout-spacer"></div>
        <%-- Navigation --%>
        <div class="android-navigation-container">
            <nav class="android-navigation mdl-navigation">
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
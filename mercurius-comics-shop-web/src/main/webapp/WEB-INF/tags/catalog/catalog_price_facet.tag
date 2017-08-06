<%@tag body-content="empty" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<%@attribute name="bottomPrice" required="true" type="java.lang.Double" %>
<%@attribute name="topPrice" required="true" type="java.lang.Double" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="panel panel-success">
    <div class="panel-heading"><spring:message code="comics.shop.catalog.price.range.label"/></div>
    <div class="panel-body">
        <div class="row">
            <div class="col-md-6">
                <input id="bottom_price" type="hidden" value="<c:out value="${bottomPrice}"/>">
                <input id="bottom_price_input" name="bottom_price" type="text" class="number_field" style="width: 100%;"
                       value="<c:out value="${bottomPrice}"/>">
            </div>
            <div class="col-md-6">
                <input id="top_price" type="hidden" value="<c:out value="${topPrice}"/>">
                <input id="top_price_input" name="top_price" class="number_field" type="text" style="width: 100%;"
                       value="<c:out value="${topPrice}"/>">
            </div>
        </div>
        <div style="margin-top: 10px">
            <input id="price_range" style="width: 100%;">
        </div>
    </div>
</div>
<%@tag body-content="empty" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<%@attribute name="facetPrefix" required="true" type="java.lang.String" %>
<%@attribute name="facets" required="true" type="java.util.Collection" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%-- Facets --%>
<c:if test="${not empty facets}">
    <c:forEach var="facet" items="${facets}">
        <div class="panel panel-default pointer_panel" style="margin-bottom : 0px; border-radius: 0px;">
            <c:set var="facetValuesName" scope="page" value="${facetPrefix}${facet.solrDocumentFieldName}"/>
            <div class="panel-body">
                <%-- Header --%>
                <div style="margin-bottom: 5px;" onclick="hideAndShowPanelHandler('facet_hide_button_${facet.solrDocumentFieldName}', 'facet_variants_panel_${facet.solrDocumentFieldName}')">
                    <span id="facet_hide_button_${facet.solrDocumentFieldName}"
                          class="glyphicon glyphicon-menu-down" aria-hidden="true"></span>
                    <span style="margin: 0px; padding-left: 5px;">
                        <c:out value="${facet.name}"/>
                    </span>
                </div>
                <%-- Variants --%>
                <div id="facet_variants_panel_${facet.solrDocumentFieldName}">
                    <c:forEach var="dictionaryItem" items="${facet.availableValues}">
                        <c:if test="${facet.valuesCounts[dictionaryItem.code] != null}">
                            <%-- Check - is value selected --%>
                            <c:set var="selectedValue" value="false" scope="page"/>
                            <c:forEach var="currentValue" items="${requestScope[facetValuesName]}">
                                <c:if test="${currentValue eq dictionaryItem.code}">
                                    <c:set var="selectedValue" value="true" scope="page"/>
                                </c:if>
                            </c:forEach>
                            <%-- Show facet --%>
                            <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect"
                                   for="checkbox-<c:out value="${dictionaryItem.code}"/>">
                                <input type="checkbox" id="checkbox-<c:out value="${dictionaryItem.code}"/>"
                                       <c:if test="${selectedValue}">checked</c:if>
                                       name="<c:out value="${facetPrefix}"/><c:out value="${facet.solrDocumentFieldName}"/>"
                                       class="mdl-checkbox__input" value="<c:out value="${dictionaryItem.code}"/>">
                                <span class="mdl-checkbox__label"
                                      style="font-weight: normal; margin-left: 10px;">
                                    <c:out value="${dictionaryItem.name}"/>
                                </span>
                                <span class="badge">${facet.valuesCounts[dictionaryItem.code]}</span>
                            </label>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </div>
    </c:forEach>
</c:if>
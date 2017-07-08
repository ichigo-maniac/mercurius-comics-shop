<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="catalog" tagdir="/WEB-INF/tags/catalog" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!doctype html>
<html lang="en">
<head>
    <jsp:include page="/WEB-INF/view/common/css_style_libraries.jsp"/>
    <title><spring:message code="log.in.failure.page.header"/></title>
</head>
<body>
<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
    <%-- Toolbar --%>
    <jsp:include page="/WEB-INF/view/common/toolbar.jsp"/>
    <%-- Main container --%>
    <div class="mercurius-content mdl-layout__content">
        <a name="top"></a>

        <div class="mercurius-more-section">
            <div class="mercurius-card-container mdl-grid">
                <div class="col-xs-6 col-md-2">
                </div>
                <div class="col-xs-12 col-md-8">
                    <div class="panel panel-default" style="margin-bottom: 0px">
                        <h3 style="border-bottom: 1px solid #DDDDDD; padding: 0px 0px 12px 23px; margin-top: 15px; color: red">
                            <spring:message code="log.in.failure.page.header"/>
                        </h3>
                        <form:form method="POST" action="/login"
                                   cssClass="form-horizontal" cssStyle="padding: 15px;">
                            <%-- Username --%>
                            <div id="emailGroup" class="form-group">
                                <label for="username" class="col-sm-3 control-label">Email</label>

                                <div class="col-sm-9">
                                    <input class="form-control" id="username" name="username" placeholder="Email"
                                           value="<c:out value="${username}"/>">
                                </div>
                            </div>

                            <%-- Password --%>
                            <div id="passwordGroup" class="form-group">
                                <label for="password" class="col-sm-3 control-label">
                                    <spring:message code="sign.in.modal.password.prompt"/>
                                </label>

                                <div class="col-sm-9">
                                    <input type="password" class="form-control" id="password" name="password"
                                           placeholder="<spring:message code="sign.in.modal.password.prompt"/>">
                                </div>
                            </div>
                            <%-- Submit --%>
                            <div class="form-group">
                                <div class="col-sm-offset-3 col-sm-9">
                                    <button type="submit" class="btn btn-success">
                                        <spring:message code="sign.in.modal.sign.in.submit.label"/>
                                    </button>
                                </div>
                            </div>
                        </form:form>
                    </div>
                </div>
                <div class="col-xs-6 col-md-2">
                </div>
            </div>
        </div>
    </div>
</div>
<%-- Javascript libraries --%>
<jsp:include page="/WEB-INF/view/common/javascript_libraries.jsp"/>
</body>
</html>

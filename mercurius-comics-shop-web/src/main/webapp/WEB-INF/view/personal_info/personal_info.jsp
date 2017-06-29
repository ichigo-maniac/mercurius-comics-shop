<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="catalog" tagdir="/WEB-INF/tags/catalog" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">
<head>
    <jsp:include page="/WEB-INF/view/common/css_style_libraries.jsp"/>
    <title><c:out value="${personalInfoForm.firstName} ${personalInfoForm.lastName}"/> - personal info</title>
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
                <%-- Tabs --%>
                <div class="col-xs-6 col-md-4">
                    <ul class="list-group">
                        <li class="list-group-item active">
                            <spring:message code="personal.info.personal.info.toolbar.label"/>
                        </li>
                        <li class="list-group-item">
                            <spring:message code="personal.info.orders.toolbar.label"/>
                        </li>
                    </ul>
                </div>
                <%-- Personal info --%>
                <div class="col-xs-12 col-md-8">
                    <div class="panel panel-default" style="margin-bottom: 0px">
                        <form:form method="POST" action="/update_personal_info" modelAttribute="personalInfoForm"
                                cssClass="form-horizontal" cssStyle="padding: 15px;">
                            <%-- Phone number --%>
                            <div class="form-group">
                                <label for="phoneNumber" class="col-sm-3 control-label">
                                    <spring:message code="personal.info.form.phone.number.label"/>
                                </label>
                                <div class="col-sm-9">
                                    <form:input path="phoneNumber" cssClass="form-control" id="phoneNumber"/>
                                </div>
                            </div>
                            <%-- Email --%>
                            <div class="form-group">
                                <label for="email" class="col-sm-3 control-label">Email</label>
                                <div class="col-sm-9">
                                    <form:input path="email" cssClass="form-control" id="email"/>
                                </div>
                            </div>
                            <%-- First name --%>
                            <div class="form-group">
                                <label for="firstName" class="col-sm-3 control-label">
                                    <spring:message code="personal.info.form.first.name.label"/>
                                </label>
                                <div class="col-sm-9">
                                    <form:input path="firstName" cssClass="form-control" id="firstName"/>
                                </div>
                            </div>
                            <%-- Last name --%>
                            <div class="form-group">
                                <label for="lastName" class="col-sm-3 control-label">
                                    <spring:message code="personal.info.form.last.name.label"/>
                                </label>
                                <div class="col-sm-9">
                                    <form:input path="lastName" cssClass="form-control" id="lastName"/>
                                </div>
                            </div>
                            <%-- Submit --%>
                            <div class="form-group">
                                <div class="col-sm-offset-3 col-sm-9">
                                    <button type="submit" class="btn btn-success">
                                        <spring:message code="personal.info.form.submit.label"/>
                                    </button>
                                </div>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%-- Javascript libraries --%>
<jsp:include page="/WEB-INF/view/common/javascript_libraries.jsp"/>
</body>
</html>

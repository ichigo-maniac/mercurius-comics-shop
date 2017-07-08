<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="catalog" tagdir="/WEB-INF/tags/catalog" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">
<head>
    <jsp:include page="/WEB-INF/view/common/css_style_libraries.jsp"/>
    <title><spring:message code="registration.header"/></title>
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
                <%-- Registration form --%>
                <div class="col-xs-12 col-md-8">
                    <div class="panel panel-default" style="margin-bottom: 0px">
                        <h3 style="border-bottom: 1px solid #DDDDDD; padding: 0px 0px 12px 23px; margin-top: 15px;">
                            <spring:message code="registration.header"/>
                        </h3>
                        <c:if test="${errorCode != null}">
                            <div class="alert alert-danger alert-dismissible" role="alert" style="margin: 5px 15px 0px 15px;">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <spring:message code="${errorCode}"/>
                            </div>
                        </c:if>
                        <form:form method="POST" action="/complete_registration" modelAttribute="registrationForm"
                                   cssClass="form-horizontal" cssStyle="padding: 15px;" onsubmit="return validateRegistrationInformation();">
                            <%-- Phone number --%>
                            <div id="phoneNumberGroup" class="form-group">
                                <label for="phoneNumber" class="col-sm-3 control-label">
                                    <spring:message code="personal.info.form.phone.number.label"/>
                                </label>
                                <div class="col-sm-9">
                                    <form:input path="phoneNumber" cssClass="form-control" id="phoneNumber"/>
                                </div>
                            </div>
                            <%-- Email --%>
                            <div id="emailGroup" class="form-group">
                                <label for="email" class="col-sm-3 control-label">Email</label>
                                <div class="col-sm-9">
                                    <form:input path="email" cssClass="form-control" id="email"/>
                                </div>
                            </div>
                            <%-- First name --%>
                            <div id="firstNameGroup" class="form-group">
                                <label for="firstName" class="col-sm-3 control-label">
                                    <spring:message code="personal.info.form.first.name.label"/>
                                </label>
                                <div class="col-sm-9">
                                    <form:input path="firstName" cssClass="form-control" id="firstName"/>
                                </div>
                            </div>
                            <%-- Last name --%>
                            <div id="lastNameGroup" class="form-group">
                                <label for="lastName" class="col-sm-3 control-label">
                                    <spring:message code="personal.info.form.last.name.label"/>
                                </label>
                                <div class="col-sm-9">
                                    <form:input path="lastName" cssClass="form-control" id="lastName"/>
                                </div>
                            </div>
                            <%-- Password --%>
                            <div id="passwordGroup" class="form-group">
                                <label for="password" class="col-sm-3 control-label">
                                    <spring:message code="registration.form.password.label"/>
                                </label>
                                <div class="col-sm-9">
                                    <form:password path="password" cssClass="form-control" id="password"/>
                                </div>
                            </div>
                            <%-- Repeat password --%>
                            <div id="repeatPasswordGroup" class="form-group">
                                <label for="repeatPassword" class="col-sm-3 control-label">
                                    <spring:message code="registration.form.repeat.password.label"/>
                                </label>
                                <div class="col-sm-9">
                                    <form:password path="repeatPassword" cssClass="form-control" id="repeatPassword"/>
                                </div>
                            </div>
                            <%-- Submit --%>
                            <div class="form-group">
                                <div class="col-sm-offset-3 col-sm-9">
                                    <button type="submit" class="btn btn-success">
                                        <spring:message code="registration.form.submit.label"/>
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
<script>

    $("#phoneNumber").mask('+0-000-000-0000');

    function validateRegistrationInformation() {
        $(".form-group").attr("class", "form-group");
        /** Phone number */
        var phoneNumber = $("#phoneNumber").val();
        var phoneNumberReg = /^\+\d-[\d]{3}\-[\d]{3}-[\d]{4}$/;
        if (!phoneNumberReg.test(phoneNumber)) {
            highlightErrorGroup("phoneNumberGroup", "<spring:message code="registration.form.phone.number.error"/>");
            return false;
        }
        /** Email */
        var emailReg = /^[_A-Za-z0-9-]+(\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\.[A-Za-z0-9]+)*(\.[A-Za-z]{2,})$/;
        var email = $("#email").val();
        if (!emailReg.test(email)) {
            highlightErrorGroup("emailGroup", "<spring:message code="personal.info.form.email.error"/>");
            return false;
        }
        /** First and last name */
        var firstName = $("#firstName").val();
        if (firstName.length < 2 || firstName.length > 20) {
            highlightErrorGroup("firstNameGroup", "<spring:message code="personal.info.form.first.name.error"/>");
            return false;
        }
        var lastName = $("#lastName").val();
        if (lastName.length < 2 || lastName.length > 20) {
            highlightErrorGroup("lastNameGroup", "<spring:message code="personal.info.form.last.name.error"/>");
            return false;
        }
        /** Password */
        var password = $("#password").val();
        var repeatPassword = $("#repeatPassword").val();
        if (password.length > 30 || password.length < 8) {
            highlightErrorGroup("passwordGroup", "<spring:message code="registration.form.password.length.error"/>");
            return false;
        }
        if (password != repeatPassword) {
            highlightErrorGroup("passwordGroup", "<spring:message code="registration.form.password.mismatch.error"/>");
            return false;
        }
        return true;
    }

    function highlightErrorGroup(groupId, alertMessage) {
        $("#" + groupId).attr("class", "form-group has-error");
        alertify.error(alertMessage);
    }

</script>
</body>
</html>

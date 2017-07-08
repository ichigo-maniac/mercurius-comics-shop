<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="catalog" tagdir="/WEB-INF/tags/catalog" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">
<head>
    <jsp:include page="/WEB-INF/view/common/css_style_libraries.jsp"/>
    <title><c:out value="${personalInfoForm.firstName} ${personalInfoForm.lastName}"/> -
        <spring:message code="personal.info.personal.info.header"/></title>
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
                        <h3 style="border-bottom: 1px solid #DDDDDD; padding: 0px 0px 12px 23px; margin-top: 15px;">
                            <spring:message code="personal.info.personal.info.header"/>
                        </h3>
                        <form:form method="POST" action="/update_personal_info" modelAttribute="personalInfoForm"
                                cssClass="form-horizontal" cssStyle="padding: 15px;" onsubmit="return validatePersonalInformation();">
                            <c:if test="${personalInfoForm.socialNetworkType != null}">
                                <label for="phoneNumber" class="col-sm-3 control-label">
                                    <spring:message code="personal.info.form.social.network.label"/>
                                </label>
                                <div class="col-sm-9">
                                    <c:choose>
                                        <c:when test="${personalInfoForm.socialNetworkType == 'FACEBOOK'}">
                                            <img style="padding: 5px 5px 12px 0px;" src="/resources/app/images/social_networks/facebook_medium.png"/>
                                            <span> - <spring:message code="personal.info.social.network.facebook"/></span>
                                        </c:when>
                                        <c:when test="${personalInfoForm.socialNetworkType == 'VK_COM'}">
                                            <img style="padding: 5px 5px 12px 0px;" src="/resources/app/images/social_networks/vkontakte_medium.png"/>
                                            <span> - <spring:message code="personal.info.social.network.vk.com"/></span>
                                        </c:when>
                                        <c:when test="${personalInfoForm.socialNetworkType == 'LINKED_IN'}">
                                            <img style="padding: 5px 5px 12px 0px;" src="/resources/app/images/social_networks/linkedin_medium.png"/>
                                            <span> - <spring:message code="personal.info.social.network.linkedin"/></span>
                                        </c:when>
                                        <c:when test="${personalInfoForm.socialNetworkType == 'TWITTER'}">
                                            <img style="padding: 5px 5px 12px 0px;" src="/resources/app/images/social_networks/twitter_medium.png"/>
                                            <span> - <spring:message code="personal.info.social.network.twitter"/></span>
                                        </c:when>
                                    </c:choose>
                                </div>
                            </c:if>
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
                            <c:if test="${personalInfoForm.usePasswordAuthentication}">
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
                            </c:if>
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
<script>

    $("#phoneNumber").mask('+0-000-000-0000');

    function validatePersonalInformation() {
        $(".form-group").attr("class", "form-group");
        /** Phone number */
        var phoneNumber = $("#phoneNumber").val();
        var phoneNumberReg = /^\+\d-[\d]{3}\-[\d]{3}-[\d]{4}$|^[ ]*$/;
        if (!phoneNumberReg.test(phoneNumber)) {
            highlightErrorGroup("phoneNumberGroup", "<spring:message code="personal.info.form.phone.number.error"/>");
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
        if (password != repeatPassword) {
            highlightErrorGroup("passwordGroup", "<spring:message code="registration.form.password.mismatch.error"/>");
            return false;
        }
        if ((password.length > 30 || password.length < 8) && password.length != 0) {
            highlightErrorGroup("passwordGroup", "<spring:message code="registration.form.password.length.error"/>");
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

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<%-- Modal --%>
<security:authorize access="isAnonymous()">
    <div class="modal fade" id="sign-in-dialog" tabindex="-1" role="dialog" aria-labelledby="sign-in-dialog-label">
        <div class="modal-dialog" role="document" style="max-width: 350px;" >
            <div class="modal-content">
                <%-- Header --%>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="sign-in-dialog-label">
                        <spring:message code="sign.in.modal.header.title"/>
                    </h4>
                </div>
                <%-- Body --%>
                <div class="modal-body">
                    <%-- Social network sign  in --%>
                    <h4 style="margin: 0px;">
                        <spring:message code="sign.in.modal.sign.in.via.label"/>
                        &nbsp;&#0183;&nbsp
                        <a href="<c:url value="/registration"/>">
                            <spring:message code="sign.in.modal.registration.label"/>
                        </a>
                    </h4>
                    <div style="text-align: center; margin: 10px 0px 10px 0px">
                        <a href="<spring:url value="/oauth/vkcom"/>" style="margin-right: 5px;">
                            <img src="/resources/app/images/social_networks/vkontakte_big.png" class="icon-button" style="border: none"/>
                        </a>
                        <a href="<spring:url value="/oauth/facebook"/>" style="margin-right: 5px;">
                            <img src="/resources/app/images/social_networks/facebook_big.png" class="icon-button" style="border: none"/>
                        </a>
                        <a href="<spring:url value="/oauth/linkedin"/>" style="margin-right: 5px;">
                            <img src="/resources/app/images/social_networks/linkedin_big.png" class="icon-button" style="border: none"/>
                        </a>
                        <a href="<spring:url value="/oauth/twitter"/>" style="margin-right: 5px;">
                            <img src="/resources/app/images/social_networks/twitter_big.png" class="icon-button" style="border: none"/>
                        </a>
                    </div>
                    <%-- Form sing in --%>
                    <form:form action="/login" method="POST" class="form-horizontal">
                        <%-- Email --%>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <input type="text" class="form-control" id="username" name="username" placeholder="Email">
                            </div>
                        </div>
                        <%-- Password --%>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <input type="password" class="form-control" id="password" name="password"
                                       placeholder="<spring:message code="sign.in.modal.password.prompt"/>">
                            </div>
                        </div>
                        <%-- Remember me and submit button --%>
                        <div class="form-group">
                            <div class="col-sm-11">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox">
                                        <spring:message code="sign.in.modal.remember.me"/>
                                    </label>
                                    &nbsp;&#0183;&nbsp
                                    <a href="<c:url value="/forgot_password"/>">
                                        <spring:message code="sign.in.modal.forgot.password.label"/>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <button type="submit" class="btn btn-success">
                                    <spring:message code="sign.in.modal.sign.in.submit.label"/>
                                </button>
                            </div>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</security:authorize>
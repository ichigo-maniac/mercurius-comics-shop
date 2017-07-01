package net.sample.comics.shop.controller.authorize;

import net.sample.comics.shop.constants.MercuriusComicsShopConstants;
import org.apache.commons.lang.RandomStringUtils;
import org.mercuriusframework.enums.SocialNetworkType;
import org.springframework.social.connect.Connection;
import org.springframework.social.linkedin.api.LinkedIn;
import org.springframework.social.linkedin.api.LinkedInProfile;
import org.springframework.social.linkedin.connect.LinkedInConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Linkedin oauth controller
 */
@Controller
public class LinkedinOauthController extends AbstractOauthController {

    /** Succeed redirect path */
    private static final String SUCCEED_REDIRECT_PATH = "/oauth/linkedin_succeed_redirect";


    /**
     * Connect to linkedin.com to obtain attributes
     * @param response Http-response
     * @throws IOException Exception
     */
    @RequestMapping(method = RequestMethod.GET, value = "/oauth/linkedin")
    @ResponseBody
    public void connectToFacebook(HttpServletResponse response) throws IOException {
        LinkedInConnectionFactory factory = (LinkedInConnectionFactory) connectionRepository.getConnectionFactory(LinkedIn.class);
        OAuth2Operations oauthOperations = factory.getOAuthOperations();
        OAuth2Parameters params = new OAuth2Parameters();
        params.set("state", RandomStringUtils.random(20, true, true));
        params.setRedirectUri(configurationService.getParameter(MercuriusComicsShopConstants.PARAMETERS.APP_HOST_PATH) + SUCCEED_REDIRECT_PATH);
        String url =  oauthOperations.buildAuthenticateUrl(GrantType.AUTHORIZATION_CODE, params);
        response.sendRedirect(url);
    }

    /**
     * Linkedin succeed redirect
     * @param request Http-request
     * @return Url redirect
     */
    @RequestMapping(method = RequestMethod.GET, value = SUCCEED_REDIRECT_PATH)
    public String succeedRedirect(HttpServletRequest request) {
        /** Check redirect */
        String authCode = request.getParameter("code");
        if (authCode == null) {
            return MercuriusComicsShopConstants.REDIRECT.HOME;
        }
        /** Obtain connection */
        LinkedInConnectionFactory factory = (LinkedInConnectionFactory) connectionRepository.getConnectionFactory(LinkedIn.class);
        OAuth2Operations oauthOperations = factory.getOAuthOperations();
        AccessGrant accessGrant = oauthOperations.exchangeForAccess(authCode,
                configurationService.getParameter(MercuriusComicsShopConstants.PARAMETERS.APP_HOST_PATH) + SUCCEED_REDIRECT_PATH, null);
        Connection connection = factory.createConnection(accessGrant);
        LinkedIn linkedInTemplate = (LinkedIn) connection.getApi();
        String profileId = linkedInTemplate.profileOperations().getProfileId();
        LinkedInProfile linkedInProfile = linkedInTemplate.profileOperations().getUserProfile();
        /** Create auth profile attribute and redirect */
        return authorizeCustomer(SocialNetworkType.LINKED_IN, profileId,
                linkedInProfile.getFirstName(), linkedInProfile.getLastName(), linkedInProfile.getEmailAddress());
    }
}

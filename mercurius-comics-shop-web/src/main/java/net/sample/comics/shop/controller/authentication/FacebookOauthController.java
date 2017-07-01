package net.sample.comics.shop.controller.authentication;

import net.sample.comics.shop.constants.MercuriusComicsShopConstants;
import org.mercuriusframework.enums.SocialNetworkType;
import org.springframework.social.connect.Connection;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.User;
import org.springframework.social.facebook.connect.FacebookConnectionFactory;
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
 * Facebook oauth controller
 */
@Controller
public class FacebookOauthController extends AbstractOauthController {

    /**
     * Constants
     */
    private static final String [] FACEBOOK_FIELDS = { "id", "email",  "first_name", "last_name" };

    /**
     * Succeed redirect path
     */
    private static final String SUCCEED_REDIRECT_PATH = "/oauth/facebook_succeed_redirect";

    /**
     * Connect to facebook to obtain attributes
     * @param response Http-response
     * @throws IOException Exception
     */
    @RequestMapping(method = RequestMethod.GET, value = "/oauth/facebook")
    @ResponseBody
    public void connectToFacebook(HttpServletResponse response) throws IOException {
        /** Connect to facebook */
        FacebookConnectionFactory factory = (FacebookConnectionFactory) connectionRepository.getConnectionFactory(Facebook.class);
        OAuth2Operations oauthOperations = factory.getOAuthOperations();
        OAuth2Parameters params = new OAuth2Parameters();
        params.setRedirectUri(configurationService.getParameter(MercuriusComicsShopConstants.PARAMETERS.APP_HOST_PATH) + SUCCEED_REDIRECT_PATH);
        params.setScope(configurationService.getParameter(MercuriusComicsShopConstants.PARAMETERS.OAUTH.FACEBOOK_SCOPE));
        String url =  oauthOperations.buildAuthenticateUrl(GrantType.AUTHORIZATION_CODE, params);
        response.sendRedirect(url);
    }

    /**
     * Facebook succeed redirect
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
        FacebookConnectionFactory factory = (FacebookConnectionFactory) connectionRepository.getConnectionFactory(Facebook.class);
        OAuth2Operations oauthOperations = factory.getOAuthOperations();
        AccessGrant accessGrant = oauthOperations.exchangeForAccess(authCode,
                configurationService.getParameter(MercuriusComicsShopConstants.PARAMETERS.APP_HOST_PATH) + SUCCEED_REDIRECT_PATH, null);
        Connection connection = factory.createConnection(accessGrant);
        Facebook facebookTemplate = (Facebook) connection.getApi();
        User userProfile = facebookTemplate.fetchObject("me", User.class, FACEBOOK_FIELDS);
        /** Create auth profile attribute and redirect */
        return authorizeCustomer(SocialNetworkType.FACEBOOK, userProfile.getId(),
                userProfile.getFirstName(), userProfile.getLastName(), userProfile.getEmail());
    }

}

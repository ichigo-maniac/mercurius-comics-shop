package net.sample.comics.shop.controller.authorize;

import net.sample.comics.shop.constants.MercuriusComicsShopConstants;
import org.json.JSONArray;
import org.json.JSONObject;
import org.mercuriusframework.enums.SocialNetworkType;
import org.mercuriusframework.services.ConfigurationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.connect.support.ConnectionFactoryRegistry;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.social.support.URIBuilder;
import org.springframework.social.vkontakte.api.VKontakte;
import org.springframework.social.vkontakte.connect.VKontakteConnectionFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Vk.com oauth controller
 */
@Controller
public class VkOauthController extends AbstractOauthController {

    /**
     * Constants
     */
    private static final String SUCCEED_REDIRECT_PATH = "/oauth/vkcom_succeed_redirect";
    private static final String USER_GET_METHOD = "users.get";
    private static final String VK_ACCOUNT_UID = "uid";
    private static final String VK_FIRST_NAME = "first_name";
    private static final String VK_LAST_NAME = "last_name";

    /**
     * Configuration service
     */
    @Autowired
    private ConfigurationService configurationService;

    /**
     * Oauth connection repository
     */
    @Autowired
    private ConnectionFactoryRegistry connectionRepository;

    /**
     * Rest template
     */
    @Autowired
    private RestTemplate restTemplate;

    /**
     * Connect to vk.com to obtain attributes
     * @param response Http-response
     * @throws IOException Exception
     */
    @RequestMapping(method = RequestMethod.GET, value = "/oauth/vkcom")
    @ResponseBody
    public void connectToVkontakte(HttpServletResponse response) throws IOException {
        /** Connect to vkontakte */
        VKontakteConnectionFactory factory = (VKontakteConnectionFactory) connectionRepository.getConnectionFactory(VKontakte.class);
        OAuth2Operations operations = factory.getOAuthOperations();
        OAuth2Parameters parameters = new OAuth2Parameters();
        parameters.setRedirectUri(configurationService.getParameter(MercuriusComicsShopConstants.PARAMETERS.APP_HOST_PATH) + SUCCEED_REDIRECT_PATH);
        String url =  operations.buildAuthenticateUrl(GrantType.AUTHORIZATION_CODE, parameters);
        response.sendRedirect(url);
    }

    /**
     * Vkontakte succeed redirect
     * @param request Http-request
     * @return
     */
    @RequestMapping(method = RequestMethod.GET, value = SUCCEED_REDIRECT_PATH)
    public String succeedRedirect(HttpServletRequest request) {
        String authCode = request.getParameter("code");
        if (authCode == null) {
            return MercuriusComicsShopConstants.REDIRECT.HOME;
        }
        /** Obtain connection */
        VKontakteConnectionFactory factory = (VKontakteConnectionFactory) connectionRepository.getConnectionFactory(VKontakte.class);
        OAuth2Operations operations = factory.getOAuthOperations();
        AccessGrant accessGrant = operations.exchangeForAccess(authCode,
                configurationService.getParameter(MercuriusComicsShopConstants.PARAMETERS.APP_HOST_PATH) + SUCCEED_REDIRECT_PATH, null);
        /** Load data */
        String url = URIBuilder.fromUri(configurationService.getParameter(MercuriusComicsShopConstants.PARAMETERS.VK_OAUTH_METHOD) + USER_GET_METHOD)
                .queryParam("access_token", accessGrant.getAccessToken())
                .build().toString();
        String result = restTemplate.getForObject(url, String.class);
        JSONObject jsonObject = new JSONObject(result);
        JSONArray responseArray = jsonObject.getJSONArray("response");
        JSONObject profileObject = (JSONObject) responseArray.get(0);
        Integer uid = profileObject.getInt(VK_ACCOUNT_UID);
        /** Create auth profile attribute and redirect */
        return authorizeCustomer(SocialNetworkType.VK_COM, uid.toString(),
                profileObject.getString(VK_FIRST_NAME), profileObject.getString(VK_LAST_NAME));
    }


}

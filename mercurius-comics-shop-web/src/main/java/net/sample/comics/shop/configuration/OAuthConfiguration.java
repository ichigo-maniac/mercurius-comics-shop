package net.sample.comics.shop.configuration;


import net.sample.comics.shop.constants.MercuriusComicsShopConstants;
import org.mercuriusframework.services.ConfigurationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.social.connect.support.ConnectionFactoryRegistry;
import org.springframework.social.facebook.connect.FacebookConnectionFactory;
import org.springframework.social.linkedin.connect.LinkedInConnectionFactory;
import org.springframework.social.twitter.connect.TwitterConnectionFactory;
import org.springframework.social.vkontakte.connect.VKontakteConnectionFactory;

/**
 * Oauth configuration
 */
@Configuration
public class OAuthConfiguration {

    /**
     * Configuration service
     */
    @Autowired
    private ConfigurationService configurationService;

    /**
     * Connection factory registry bean
     * @return Connection factory registry
     */
    @Bean(name = "connectionFactoryLocator")
    public ConnectionFactoryRegistry connectionFactoryRegistry() {
        ConnectionFactoryRegistry registry = new ConnectionFactoryRegistry();
        /** VK.COM */
        registry.addConnectionFactory(new VKontakteConnectionFactory(
                configurationService.getParameter(MercuriusComicsShopConstants.PARAMETERS.OAUTH.VK_CLIENT_ID),
                configurationService.getParameter(MercuriusComicsShopConstants.PARAMETERS.OAUTH.VK_SECRET)
        ));
        /** Facebook */
        registry.addConnectionFactory(new FacebookConnectionFactory(
                configurationService.getParameter(MercuriusComicsShopConstants.PARAMETERS.OAUTH.FACEBOOK_CLIENT_ID),
                configurationService.getParameter(MercuriusComicsShopConstants.PARAMETERS.OAUTH.FACEBOOK_SECRET)
        ));
        /** LinkedIn */
        registry.addConnectionFactory(new LinkedInConnectionFactory(
                configurationService.getParameter(MercuriusComicsShopConstants.PARAMETERS.OAUTH.LINKEDIN_CLIENT_ID),
                configurationService.getParameter(MercuriusComicsShopConstants.PARAMETERS.OAUTH.LINKEDIN_SECRET)
        ));
        /** Twitter */
        registry.addConnectionFactory(new TwitterConnectionFactory(
                configurationService.getParameter(MercuriusComicsShopConstants.PARAMETERS.OAUTH.TWITTER_CLIENT_ID),
                configurationService.getParameter(MercuriusComicsShopConstants.PARAMETERS.OAUTH.TWITTER_SECRET)
        ));
        return registry;
    }
}

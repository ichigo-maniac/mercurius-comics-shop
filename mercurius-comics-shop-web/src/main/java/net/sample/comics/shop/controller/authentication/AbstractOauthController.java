package net.sample.comics.shop.controller.authentication;

import net.sample.comics.shop.constants.MercuriusComicsShopConstants;
import net.sample.comics.shop.facades.ISTUserFacade;
import org.mercuriusframework.entities.CustomerEntity;
import org.mercuriusframework.enums.SocialNetworkType;
import org.mercuriusframework.services.ConfigurationService;
import org.mercuriusframework.services.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.connect.support.ConnectionFactoryRegistry;
import org.springframework.stereotype.Controller;

/**
 * Abstract oauth controller
 */
@Controller
public class AbstractOauthController {

    /**
     * User facade
     */
    @Autowired
    protected ISTUserFacade userFacade;

    /**
     * Customer service
     */
    @Autowired
    protected CustomerService customerService;

    /**
     * Oauth connection repository
     */
    @Autowired
    protected ConnectionFactoryRegistry connectionRepository;

    /**
     * Configuration service
     */
    @Autowired
    protected ConfigurationService configurationService;

    /**
     * Authorize customer or create a new one
     * @param socialNetworkType Social network type
     * @param socialNetworkId Social network id
     * @param firstName First name
     * @param lastName Last name
     * @return Redirect path
     */
    protected String authorizeCustomer(SocialNetworkType socialNetworkType, String socialNetworkId, String firstName, String lastName, String email) {
        CustomerEntity customerEntity = customerService.getCustomerBySocialNetworkIdAndType(socialNetworkType, socialNetworkId);
        if (customerEntity == null) {
            customerEntity = userFacade.createCustomer(socialNetworkType, socialNetworkId, firstName, lastName, email);
            userFacade.logInUser(customerEntity);
            return MercuriusComicsShopConstants.REDIRECT.HOME;
        } else {
            userFacade.logInUser(customerEntity);
            return MercuriusComicsShopConstants.REDIRECT.HOME;
        }
    }

}

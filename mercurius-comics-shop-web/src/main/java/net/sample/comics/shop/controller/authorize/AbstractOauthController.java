package net.sample.comics.shop.controller.authorize;

import net.sample.comics.shop.constants.MercuriusComicsShopConstants;
import net.sample.comics.shop.facades.ISTUserFacade;
import org.mercuriusframework.entities.CustomerEntity;
import org.mercuriusframework.enums.SocialNetworkType;
import org.mercuriusframework.services.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
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
    private ISTUserFacade userFacade;

    /**
     * Customer service
     */
    @Autowired
    private CustomerService customerService;

    /**
     * Authorize customer or create a new one
     * @param socialNetworkType Social network type
     * @param socialNetworkId Social network id
     * @param firstName First name
     * @param lastName Last name
     * @return Redirect path
     */
    protected String authorizeCustomer(SocialNetworkType socialNetworkType, String socialNetworkId, String firstName, String lastName) {
        CustomerEntity customerEntity = customerService.getCustomerBySocialNetworkIdAndType(socialNetworkType, socialNetworkId);
        if (customerEntity == null) {
            customerEntity = userFacade.createCustomer(socialNetworkType, socialNetworkId, firstName, lastName);
            userFacade.logInUser(customerEntity);
            return MercuriusComicsShopConstants.REDIRECT.HOME;
        } else {
            userFacade.logInUser(customerEntity);
            return MercuriusComicsShopConstants.REDIRECT.HOME;
        }
    }

}

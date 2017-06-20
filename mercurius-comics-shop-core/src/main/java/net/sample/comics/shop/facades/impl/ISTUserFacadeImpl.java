package net.sample.comics.shop.facades.impl;

import net.sample.comics.shop.facades.ISTUserFacade;
import org.mercuriusframework.entities.CustomerEntity;
import org.mercuriusframework.enums.AuthenticationType;
import org.mercuriusframework.enums.SocialNetworkType;
import org.mercuriusframework.facades.impl.UserFacadeImpl;
import org.springframework.stereotype.Service;

/**
 * Istari user facade
 */
@Service("istUserFacade")
public class ISTUserFacadeImpl extends UserFacadeImpl implements ISTUserFacade {

    /**
     * Create customer
     * @param socialNetworkType Social network type
     * @param socialNetworkId   Social network id
     * @param firstName         First name
     * @param lastName          Last name
     * @return Created customer
     */
    @Override
    public CustomerEntity createCustomer(SocialNetworkType socialNetworkType, String socialNetworkId, String firstName, String lastName) {
        CustomerEntity customerEntity = new CustomerEntity();
        customerEntity.setAuthenticationType(AuthenticationType.OAUTH);
        customerEntity.setSocialNetworkType(socialNetworkType);
        customerEntity.setSocialNetworkId(socialNetworkId);
        customerEntity.setName(lastName + " " + firstName);
        customerEntity.setFirstName(firstName);
        customerEntity.setLastName(lastName);
        return entityService.save(customerEntity);
    }
}

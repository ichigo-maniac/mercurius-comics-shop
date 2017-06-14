package net.sample.comics.shop.facades;

import org.mercuriusframework.entities.CustomerEntity;
import org.mercuriusframework.enums.SocialNetworkType;
import org.mercuriusframework.facades.UserFacade;

/**
 * Istari user facade interface
 */
public interface ISTUserFacade extends UserFacade {

    /**
     * Create customer
     * @param socialNetworkType Social network type
     * @param socialNetworkId Social network id
     * @param firstName First name
     * @param lastName Last name
     * @return Created customer
     */
    CustomerEntity createCustomer(SocialNetworkType socialNetworkType, String socialNetworkId, String firstName, String lastName);
}

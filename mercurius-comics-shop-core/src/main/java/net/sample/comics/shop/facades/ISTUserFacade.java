package net.sample.comics.shop.facades;

import net.sample.comics.shop.forms.PersonalInfoForm;
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

    /**
     * Update personal info
     * @param userUuid User uuid
     * @param personalInfoForm Personal info form
     * @return Update result
     */
    boolean updatePersonalInfo(String userUuid, PersonalInfoForm personalInfoForm);
}

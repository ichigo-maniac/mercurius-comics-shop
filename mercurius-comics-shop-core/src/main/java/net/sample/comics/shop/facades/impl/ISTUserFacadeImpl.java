package net.sample.comics.shop.facades.impl;

import net.sample.comics.shop.facades.ISTUserFacade;
import net.sample.comics.shop.forms.PersonalInfoForm;
import org.mercuriusframework.entities.AbstractUserEntity;
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

    /**
     * Update personal info
     * @param userUuid         User uuid
     * @param personalInfoForm Personal info form
     * @return Update result
     */
    @Override
    public boolean updatePersonalInfo(String userUuid, PersonalInfoForm personalInfoForm) {
        AbstractUserEntity userEntity = entityService.findByUuid(userUuid, AbstractUserEntity.class);
        if (userEntity != null) {
            userEntity.setEmail(personalInfoForm.getEmail());
            userEntity.setFirstName(personalInfoForm.getFirstName());
            userEntity.setLastName(personalInfoForm.getLastName());
            userEntity.setPhoneNumber(personalInfoForm.getPhoneNumber());
            entityService.save(userEntity);
            return true;
        } else {
            return false;
        }
    }
}

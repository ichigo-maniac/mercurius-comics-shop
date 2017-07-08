package net.sample.comics.shop.facades.impl;

import net.sample.comics.shop.facades.ISTUserFacade;
import net.sample.comics.shop.forms.PersonalInfoForm;
import net.sample.comics.shop.forms.RegistrationForm;
import org.apache.commons.lang.StringUtils;
import org.mercuriusframework.entities.AbstractUserEntity;
import org.mercuriusframework.entities.CustomerEntity;
import org.mercuriusframework.enums.AuthenticationType;
import org.mercuriusframework.enums.PasswordEncodingType;
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
     * @param socialNetworkId Social network id
     * @param firstName First name
     * @param lastName Last name
     * @param email Email (may be null)
     * @return Created customer
     */
    public CustomerEntity createCustomer(SocialNetworkType socialNetworkType, String socialNetworkId, String firstName, String lastName, String email) {
        CustomerEntity customerEntity = new CustomerEntity();
        customerEntity.setAuthenticationType(AuthenticationType.OAUTH);
        customerEntity.setSocialNetworkType(socialNetworkType);
        customerEntity.setSocialNetworkId(socialNetworkId);
        customerEntity.setName(lastName + " " + firstName);
        customerEntity.setFirstName(firstName);
        customerEntity.setLastName(lastName);
        customerEntity.setEmail(email);
        return entityService.save(customerEntity);
    }

    /**
     * Create customer
     * @param registrationForm Registration form
     * @return Created customer
     */
    @Override
    public CustomerEntity createCustomer(RegistrationForm registrationForm) {
        CustomerEntity customerEntity = new CustomerEntity();
        customerEntity.setCode(registrationForm.getEmail());
        customerEntity.setPhoneNumber(registrationForm.getPhoneNumber());
        customerEntity.setAuthenticationType(AuthenticationType.PASSWORD);
        customerEntity.setName(registrationForm.getLastName() + " " + registrationForm.getLastName());
        customerEntity.setFirstName(registrationForm.getFirstName());
        customerEntity.setLastName(registrationForm.getLastName());
        customerEntity.setEmail(registrationForm.getEmail());
        entityService.save(customerEntity);
        /** Update password */
        updateUserPassword(customerEntity, registrationForm.getPassword(), PasswordEncodingType.MD5);
        return customerEntity;
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
            if (userEntity.getAuthenticationType() == AuthenticationType.PASSWORD && StringUtils.isNotEmpty(personalInfoForm.getPassword())) {
                updateUserPassword(userEntity, personalInfoForm.getPassword(), PasswordEncodingType.MD5);
            }
            return true;
        } else {
            return false;
        }
    }
}

package net.sample.comics.shop.forms;

import org.mercuriusframework.entities.AbstractUserEntity;
import org.mercuriusframework.entities.CustomerEntity;
import org.mercuriusframework.enums.AuthenticationType;
import org.mercuriusframework.enums.SocialNetworkType;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

/**
 * Personal info form
 */
public class PersonalInfoForm {

    /**
     * Social network type
     */
    private SocialNetworkType socialNetworkType;

    /**
     * Use password authentication flag
     */
    private boolean usePasswordAuthentication;

    /**
     * First name
     */
    @Size(min = 2, max = 20)
    private String firstName;

    /**
     * Last name
     */
    @Size(min = 2, max = 20)
    private String lastName;

    /**
     * Email
     */
    @Pattern(regexp = "^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$")
    private String email;

    /**
     * Phone number
     */
    @Pattern(regexp = "^\\+\\d-[\\d]{3}\\-[\\d]{3}-[\\d]{4}$|^[ ]*$")
    private String phoneNumber;

    /**
     * Password
     */
    private String password;

    /**
     * Repeat password
     */
    private String repeatPassword;

    /**
     * Default constructor
     */
    public PersonalInfoForm() {
    }

    /**
     * Constructor
     * @param userEntity User entity
     */
    public PersonalInfoForm(AbstractUserEntity userEntity) {
        if (userEntity instanceof CustomerEntity) {
            this.socialNetworkType = ((CustomerEntity) userEntity).getSocialNetworkType();
        }
        this.usePasswordAuthentication = userEntity.getAuthenticationType() == AuthenticationType.PASSWORD;
        this.email = userEntity.getEmail();
        this.firstName = userEntity.getFirstName();
        this.lastName = userEntity.getLastName();
        this.phoneNumber = userEntity.getPhoneNumber();
    }

    /**
     * Get social network type
     * @return Social network type
     */
    public SocialNetworkType getSocialNetworkType() {
        return socialNetworkType;
    }

    /**
     * Set social network type
     * @param socialNetworkType Social network type
     */
    public void setSocialNetworkType(SocialNetworkType socialNetworkType) {
        this.socialNetworkType = socialNetworkType;
    }

    /**
     * Get use password authentication flag
     * @return Use password authentication flag
     */
    public boolean isUsePasswordAuthentication() {
        return usePasswordAuthentication;
    }

    /**
     * Set use password authentication flag
     * @param usePasswordAuthentication Use password authentication flag
     */
    public void setUsePasswordAuthentication(boolean usePasswordAuthentication) {
        this.usePasswordAuthentication = usePasswordAuthentication;
    }

    /**
     * Get first name
     * @return First name
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * Set first name
     * @param firstName First name
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /**
     * Get last name
     * @return Last name
     */
    public String getLastName() {
        return lastName;
    }

    /**
     * Set last name
     * @param lastName Last name
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    /**
     * Get email
     * @return Email
     */
    public String getEmail() {
        return email;
    }

    /**
     * Set email
     * @param email Email
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * Get phone number
     * @return Phone number
     */
    public String getPhoneNumber() {
        return phoneNumber;
    }

    /**
     * Set phone number
     * @param phoneNumber Phone number
     */
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    /**
     * Get password
     * @return Password
     */
    public String getPassword() {
        return password;
    }

    /**
     * Set password
     * @param password Password
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * Get repeat password
     * @return Repeat password
     */
    public String getRepeatPassword() {
        return repeatPassword;
    }

    /**
     * Set repeat password
     * @param repeatPassword Repeat password
     */
    public void setRepeatPassword(String repeatPassword) {
        this.repeatPassword = repeatPassword;
    }
}

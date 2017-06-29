package net.sample.comics.shop.forms;

import org.mercuriusframework.entities.AbstractUserEntity;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

/**
 * Personal info form
 */
public class PersonalInfoForm {

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
    @Pattern(regexp = "^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$|^[ ]*$")
    private String email;

    /**
     * Phone number
     */
    private String phoneNumber;

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
        this.email = userEntity.getEmail();
        this.firstName = userEntity.getFirstName();
        this.lastName = userEntity.getLastName();
        this.phoneNumber = userEntity.getPhoneNumber();
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
}

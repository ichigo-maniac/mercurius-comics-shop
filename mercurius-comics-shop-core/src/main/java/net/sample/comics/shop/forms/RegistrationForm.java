package net.sample.comics.shop.forms;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.io.Serializable;

/**
 * Registration form
 */
public class RegistrationForm implements Serializable {

    private static final long serialVersionUID = 1132404395570724876L;

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
    @Pattern(regexp = "^\\+\\d-[\\d]{3}\\-[\\d]{3}-[\\d]{4}$")
    private String phoneNumber;

    /**
     * Password
     */
    @Size(min = 8, max = 30)
    private String password;

    /**
     * Repeat password
     */
    @Size(min = 8, max = 30)
    private String repeatPassword;

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

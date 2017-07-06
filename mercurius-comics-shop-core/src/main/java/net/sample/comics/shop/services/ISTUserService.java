package net.sample.comics.shop.services;

/**
 * User service interface
 */
public interface ISTUserService {

    /**
     * Check - exist customer with specified email (only password authentication)
     * @param email Email
     * @return Check result
     */
    boolean existCustomerWithEmail(String email);
}

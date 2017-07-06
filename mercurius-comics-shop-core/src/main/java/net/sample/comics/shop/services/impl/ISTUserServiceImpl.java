package net.sample.comics.shop.services.impl;

import net.sample.comics.shop.services.ISTUserService;
import org.mercuriusframework.entities.CustomerEntity;
import org.mercuriusframework.enums.AuthenticationType;
import org.mercuriusframework.services.EntityService;
import org.mercuriusframework.services.query.QueryParameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * User service
 */
@Service("istUserService")
public class ISTUserServiceImpl implements ISTUserService {

    /**
     * Entity service
     */
    @Autowired
    protected EntityService entityService;

    /**
     * Check - exist customer with specified email (only password authentication)
     * @param email Email
     * @return Check result
     */
    public boolean existCustomerWithEmail(String email) {
        return entityService.getSingleResultByQuery("SELECT count(customer) FROM " + CustomerEntity.ENTITY_NAME +  " as customer " +
                "WHERE customer." + CustomerEntity.AUTHENTICATION_TYPE + " = :authType AND " +
                "customer." + CustomerEntity.CODE + " = :customerCode", Long.class,
                new QueryParameter("authType", AuthenticationType.PASSWORD), new QueryParameter("customerCode", email)) > 0;
    }
}

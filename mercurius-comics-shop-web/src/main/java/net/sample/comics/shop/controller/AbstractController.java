package net.sample.comics.shop.controller;

import net.sample.comics.shop.facades.ISTUserFacade;
import org.mercuriusframework.dto.UserEntityDto;
import org.mercuriusframework.entities.AbstractUserEntity;
import org.mercuriusframework.fillers.impl.UserEntityFiller;
import org.mercuriusframework.services.EntityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;

/**
 * Abstract controller
 */
public class AbstractController {

    /**
     * User facade
     */
    @Autowired
    protected ISTUserFacade userFacade;

    /**
     * User entity filler
     */
    @Autowired
    protected UserEntityFiller userEntityFiller;

    /**
     * Entity service
     */
    @Autowired
    protected EntityService entityService;

    /**
     * Current user model attribute
     * @return Current authenticated user
     */
    @ModelAttribute(value = "currentUser")
    public UserEntityDto currentUser() {
        UserEntityDto currentUser = userFacade.getCurrentUser();
        if (currentUser != null) {
            AbstractUserEntity currentUserEntity = entityService.findByUuid(currentUser.getUuid(), AbstractUserEntity.class);
            UserEntityDto result = new UserEntityDto();
            userEntityFiller.fillIn(currentUserEntity, result);
            return result;
        } else {
            return null;
        }
    }

}

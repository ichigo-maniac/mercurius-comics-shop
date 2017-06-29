package net.sample.comics.shop.controller;

import net.sample.comics.shop.constants.MercuriusComicsShopConstants;
import net.sample.comics.shop.facades.ISTUserFacade;
import net.sample.comics.shop.forms.PersonalInfoForm;
import org.mercuriusframework.dto.UserEntityDto;
import org.mercuriusframework.entities.CustomerEntity;
import org.mercuriusframework.services.EntityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;

/**
 * Personal info page controller
 */
@Controller
public class PersonalInfoPageController {

    /**
     * Constants
     */
    private static final String PERSONAL_INFO_PATH = "/personal_info";

    /**
     * User facade
     */
    @Autowired
    private ISTUserFacade userFacade;

    /**
     * Entity service
     */
    @Autowired
    private EntityService entityService;

    /**
     * Personal info page
     * @param model Attributes model
     * @return View path
     */
    @RequestMapping(method = RequestMethod.GET, value = PERSONAL_INFO_PATH)
    public String personalInfo(Model model) {
        if (!userFacade.isCurrentUserCustomer()) {
            return MercuriusComicsShopConstants.REDIRECT.HOME;
        }
        UserEntityDto currentUser = userFacade.getCurrentUser();
        model.addAttribute("personalInfoForm", new PersonalInfoForm(entityService.findByUuid(currentUser.getUuid(), CustomerEntity.class)));
        return MercuriusComicsShopConstants.VIEW.PERSONAL_INFO_PAGE;
    }

    /**
     * Update personal info
     * @param personalInfoForm Personal info form
     * @param result Binding result
     * @return Redirect path
     */
    @RequestMapping(method = RequestMethod.POST, value = "/update_personal_info")
    public String updatePersonalInfo(@Valid @ModelAttribute("personalInfoForm") PersonalInfoForm personalInfoForm, BindingResult result) {
        /** Check form for errors and authenticated user */
        if (result.hasErrors()) {
            return MercuriusComicsShopConstants.REDIRECT.HOME;
        }
        if (!userFacade.isCurrentUserCustomer()) {
            return MercuriusComicsShopConstants.REDIRECT.HOME;
        }
        /** Update user */
        UserEntityDto currentUser = userFacade.getCurrentUser();
        if (userFacade.updatePersonalInfo(currentUser.getUuid(), personalInfoForm)) {
            return "redirect:" + PERSONAL_INFO_PATH;
        } else {
            return MercuriusComicsShopConstants.REDIRECT.HOME;
        }
    }
}

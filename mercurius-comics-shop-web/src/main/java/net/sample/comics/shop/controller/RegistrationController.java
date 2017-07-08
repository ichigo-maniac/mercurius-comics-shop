package net.sample.comics.shop.controller;

import net.sample.comics.shop.constants.MercuriusComicsShopConstants;
import net.sample.comics.shop.facades.ISTUserFacade;
import net.sample.comics.shop.forms.RegistrationForm;
import net.sample.comics.shop.services.ISTUserService;
import org.mercuriusframework.entities.CustomerEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

/**
 * Registration controller
 */
@Controller
public class RegistrationController extends AbstractController {

    /**
     * Constants
     */
    private static final String REGISTRATION_FORM_ATTRIBUTE = "registrationForm";
    private static final String ERROR_MESSAGE_CODE_ATTRIBUTE = "errorCode";

    /**
     * Error code constants
     */
    private static final String DUPLICATE_EMAIL = "registration.duplicate.error";

    /**
     * User facade
     */
    @Autowired
    private ISTUserFacade userFacade;

    /**
     * User service
     */
    @Autowired
    private ISTUserService userService;

    /**
     * Registration page
     * @param model Attributes model
     * @return View path
     */
    @RequestMapping(method = RequestMethod.GET, value = "/registration")
    public String registrationPage(Model model) {
        if (!userFacade.isCurrentUserAnonymous()) {
            return MercuriusComicsShopConstants.REDIRECT.HOME;
        }
        /** Add registration form */
        if (model.containsAttribute(REGISTRATION_FORM_ATTRIBUTE)) {
            RegistrationForm form = (RegistrationForm) model.asMap().get(REGISTRATION_FORM_ATTRIBUTE);
            form.setPassword("");
            form.setRepeatPassword("");
            model.addAttribute(REGISTRATION_FORM_ATTRIBUTE, form);
        } else {
            model.addAttribute(REGISTRATION_FORM_ATTRIBUTE, new RegistrationForm());
        }
        return MercuriusComicsShopConstants.VIEW.REGISTRATION_PAGE;
    }

    /**
     * Complete registration
     * @param registrationForm Registration form
     * @param result Binding result
     * @return Redirect path
     */
    @RequestMapping(method = RequestMethod.POST, value = "/complete_registration")
    public String completeRegistration(@Valid @ModelAttribute(REGISTRATION_FORM_ATTRIBUTE) RegistrationForm registrationForm,
                                       BindingResult result, RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            return MercuriusComicsShopConstants.REDIRECT.HOME;
        }
        /** Create a new user */
        if (userService.existCustomerWithEmail(registrationForm.getEmail())) {
            redirectAttributes.addFlashAttribute(REGISTRATION_FORM_ATTRIBUTE, registrationForm);
            redirectAttributes.addFlashAttribute(ERROR_MESSAGE_CODE_ATTRIBUTE, DUPLICATE_EMAIL);
            return "redirect:/registration";
        }
        CustomerEntity newCustomer = userFacade.createCustomer(registrationForm);
        userFacade.logInUser(newCustomer);
        return MercuriusComicsShopConstants.REDIRECT.HOME;
    }
}

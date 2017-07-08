package net.sample.comics.shop.controller.authentication;

import net.sample.comics.shop.constants.MercuriusComicsShopConstants;
import org.mercuriusframework.facades.UserFacade;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletException;

/**
 * Login-logout controller
 */
@Controller
public class LoginLogoutController {

    /**
     * Constants
     */
    private static final String USERNAME_ATTRIBUTE = "username";

    /**
     * User facade
     */
    @Autowired
    private UserFacade userFacade;

    /**
     * Log in
     * @param username Username
     * @param password Password
     * @param redirectAttributes Redirect attributes
     * @return Redirect path
     */
    @RequestMapping(method = RequestMethod.POST, value = "/login")
    public String login(@RequestParam(USERNAME_ATTRIBUTE) String username, @RequestParam("password") String password, RedirectAttributes redirectAttributes) {
        if (userFacade.logInCustomer(username, password)) {
            return MercuriusComicsShopConstants.REDIRECT.HOME;
        } else {
            redirectAttributes.addFlashAttribute(USERNAME_ATTRIBUTE, username);
            return "redirect:/login_failure";
        }
    }

    /**
     * Log in failure page
     * @return View path
     */
    @RequestMapping(method = RequestMethod.GET, value = "/login_failure")
    public String loginFailure() {
        return MercuriusComicsShopConstants.VIEW.LOGIN_FAILURE_PAGE;
    }

    /**
     * Log out
     * @return Redirect path
     * @throws ServletException Servlet exception
     */
    @RequestMapping(method = RequestMethod.GET, value = "/logout")
    public String logout() throws ServletException {
        userFacade.logOutCurrentUser();
        return MercuriusComicsShopConstants.REDIRECT.HOME;
    }
}

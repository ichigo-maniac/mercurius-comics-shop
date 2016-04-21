package net.sample.comics.shop.controller;

import org.mercuriusframework.services.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * Index page controller
 */
@Controller
public class IndexPageController {

    @Autowired
    private CategoryService categoryService;

    @RequestMapping(method = RequestMethod.GET, value = "/")
    public String indexPage(HttpServletRequest request, Model model) {
        model.addAttribute("categories", categoryService.getAllCategoriesWithoutMainSuperCategory("online"));
        return "index";
    }
}

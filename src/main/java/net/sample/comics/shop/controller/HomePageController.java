package net.sample.comics.shop.controller;

import org.mercuriusframework.entities.CategoryEntity;
import org.mercuriusframework.services.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Home page controller
 */
@Controller
public class HomePageController extends AbstractController {

    /**
     * Category service
     */
    @Autowired
    private CategoryService categoryService;

    /**
     * Home page
     * @param model Model
     * @return View path
     */
    @RequestMapping(method = RequestMethod.GET, value = "/")
    public String homePage(Model model) {
        CategoryEntity mainCategory = categoryService.getAllCategoriesWithoutMainSuperCategory("master_catalog").get(0);
        List<CategoryEntity> categories = categoryService.getSubCategories(mainCategory.getCode(), "master_catalog");
        model.addAttribute("mainCategory", mainCategory);
        model.addAttribute("categories", categories);
        return "index";
    }
}

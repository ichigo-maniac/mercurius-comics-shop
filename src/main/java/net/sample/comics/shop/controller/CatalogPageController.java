package net.sample.comics.shop.controller;

import org.mercuriusframework.services.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Catalog page controller
 */
@Controller
public class CatalogPageController {

    @Autowired
    private CategoryService categoryService;

    @RequestMapping(method = RequestMethod.GET, value = "/catalog")
    public String catalogPage(Model model) {
        model.addAttribute("categories", categoryService.getAllCategoriesWithoutMainSuperCategory("online"));
        return "catalog/base_catalog";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/catalog/{catalogCode}")
    public String catalogPage(@PathVariable String catalogCode) {
        return "catalog/base_catalog";
    }
}

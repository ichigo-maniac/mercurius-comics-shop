package net.sample.comics.shop.controller;

import net.sample.comics.shop.constants.MercuriusComicsShopConstants;
import org.mercuriusframework.converters.impl.CategoryEntityConverter;
import org.mercuriusframework.entities.CategoryEntity;
import org.mercuriusframework.services.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
     * Category converter
     */
    @Autowired
    private CategoryEntityConverter categoryConverter;

    /**
     * Home page
     * @param model Model
     * @return View path
     */
    @RequestMapping(method = RequestMethod.GET, value = "/")
    public String homePage(Model model) {
        CategoryEntity mainCategory = categoryService.getAllCategoriesWithoutMainSuperCategory().get(0);
        List<CategoryEntity> categories = categoryService.getSubCategories(mainCategory.getCode());
        model.addAttribute("mainCategory", categoryConverter.convert(mainCategory));
        model.addAttribute("categories", categoryConverter.convertAll(categories));
        return MercuriusComicsShopConstants.VIEW.HOME_PAGE;
    }
}

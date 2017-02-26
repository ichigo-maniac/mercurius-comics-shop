package net.sample.comics.shop.controller;

import net.sample.comics.shop.constants.MercuriusComicsShopConstants;
import net.sample.comics.shop.services.ISTProductService;
import org.mercuriusframework.converters.impl.CategoryEntityConverter;
import org.mercuriusframework.converters.impl.ProductEntityConverter;
import org.mercuriusframework.entities.CategoryEntity;
import org.mercuriusframework.entities.ProductEntity;
import org.mercuriusframework.services.CategoryService;
import org.mercuriusframework.services.query.PageableResult;
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
     * Product service
     */
    @Autowired
    private ISTProductService productService;

    /**
     * Product entity converter
     */
    @Autowired
    private ProductEntityConverter productEntityConverter;

    /**
     * Home page
     * @param model Model
     * @return View path
     */
    @RequestMapping(method = RequestMethod.GET, value = "/")
    public String homePage(Model model) {
        /** Load categories */
        CategoryEntity mainCategory = categoryService.getAllCategoriesWithoutMainSuperCategory().get(0);
        List<CategoryEntity> categories = categoryService.getSubCategories(mainCategory.getCode());
        /** Load products */
        PageableResult<ProductEntity> products = productService.getNewReleasesProducts();
        /** Set attributes */
        model.addAttribute("products", productEntityConverter.convertAll(products.getEntries()));
        model.addAttribute("mainCategory", categoryConverter.convert(mainCategory));
        model.addAttribute("categories", categoryConverter.convertAll(categories));
        return MercuriusComicsShopConstants.VIEW.HOME_PAGE;
    }
}

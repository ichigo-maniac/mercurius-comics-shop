package net.sample.comics.shop.controller;

import net.sample.comics.shop.constants.MercuriusComicsShopConstants;
import org.mercuriusframework.converters.impl.CategoryEntityConverter;
import org.mercuriusframework.entities.CatalogEntity;
import org.mercuriusframework.entities.CategoryEntity;
import org.mercuriusframework.enums.CategoryLoadOptions;
import org.mercuriusframework.services.CatalogUniqueCodeEntityService;
import org.mercuriusframework.services.CategoryService;
import org.mercuriusframework.services.UniqueCodeEntityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * Category page controller
 */
@Controller
public class CategoryPageController extends AbstractController {

    /**
     * Category service
     */
    @Autowired
    private CategoryService categoryService;

    /**
     * Unique code entity service
     */
    @Autowired
    private UniqueCodeEntityService uniqueCodeEntityService;

    /**
     * Catalog unique code entity service
     */
    @Autowired
    private CatalogUniqueCodeEntityService catalogUniqueCodeEntityService;

    /**
     * Category converter
     */
    @Autowired
    private CategoryEntityConverter categoryConverter;

    /**
     * Main catalog page
     * @param model Model
     * @return View path
     */
    @RequestMapping(method = RequestMethod.GET, value = "/catalog")
    public String catalogPage(Model model) {
        CatalogEntity catalog = uniqueCodeEntityService.getEntityByCode("master_catalog", CatalogEntity.class);
        CategoryEntity categoryEntity = catalogUniqueCodeEntityService.getEntityByCodeAndCatalog("catalog", catalog, CategoryEntity.class);
        List<CategoryEntity> subCategories = categoryService.getSubCategories(categoryEntity.getUuid());
        model.addAttribute("category", categoryConverter.convert(categoryEntity, CategoryLoadOptions.BREAD_CRUMBS));
        model.addAttribute("categories", categoryConverter.convertAll(subCategories));
        return MercuriusComicsShopConstants.VIEW.CATEGORY_PAGE;
    }

    /**
     * Category page
     * @param categoryCode Category code
     * @param model Model
     * @return View path
     */
    @RequestMapping(method = RequestMethod.GET, value = "/catalog/**/{categoryCode}")
    public String catalogPage(@PathVariable String categoryCode, Model model) {
        CatalogEntity catalog = uniqueCodeEntityService.getEntityByCode("master_catalog", CatalogEntity.class);
        CategoryEntity categoryEntity = catalogUniqueCodeEntityService.getEntityByCodeAndCatalog(categoryCode, catalog, CategoryEntity.class);
        List<CategoryEntity> subCategories = categoryService.getSubCategories(categoryEntity.getUuid());
        model.addAttribute("category", categoryConverter.convert(categoryEntity, CategoryLoadOptions.BREAD_CRUMBS));
        model.addAttribute("categories", categoryConverter.convertAll(subCategories));
        return MercuriusComicsShopConstants.VIEW.CATEGORY_PAGE;
    }
}
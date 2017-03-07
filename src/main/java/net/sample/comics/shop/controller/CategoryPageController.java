package net.sample.comics.shop.controller;

import net.sample.comics.shop.constants.MercuriusComicsShopConstants;
import org.mercuriusframework.converters.impl.CategoryEntityConverter;
import org.mercuriusframework.converters.impl.ProductEntityConverter;
import org.mercuriusframework.dto.ProductEntityDto;
import org.mercuriusframework.entities.CategoryEntity;
import org.mercuriusframework.entities.ProductEntity;
import org.mercuriusframework.enums.CategoryLoadOptions;
import org.mercuriusframework.enums.ProductLoadOptions;
import org.mercuriusframework.services.CatalogUniqueCodeEntityService;
import org.mercuriusframework.services.CategoryService;
import org.mercuriusframework.services.ProductService;
import org.mercuriusframework.services.query.ConvertiblePageableResult;
import org.mercuriusframework.services.query.PageableResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.List;

/**
 * Category page controller
 */
@Controller
public class CategoryPageController extends AbstractController {
    /**
     * Constants
     */
    private static final Integer PAGE_SIZE = 20;

    /**
     * Category service
     */
    @Autowired
    private CategoryService categoryService;

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
     * Product service
     */
    @Autowired
    private ProductService productService;

    /**
     * Product entity converter
     */
    @Autowired
    private ProductEntityConverter productEntityConverter;

    /**
     * Main catalog page
     * @param model Model
     * @return View path
     */
    @RequestMapping(method = RequestMethod.GET, value = "/catalog")
    public String catalogPage(@RequestParam(name = "page", required = false, defaultValue = "0") Integer page, Model model) {
        CategoryEntity categoryEntity = catalogUniqueCodeEntityService.getEntityByCode("catalog", CategoryEntity.class);
        if (categoryEntity == null) {
            return MercuriusComicsShopConstants.VIEW.PAGE_NOT_FOUND;
        }
        List<CategoryEntity> subCategories = categoryService.getSubCategoriesByCategoryUuid(categoryEntity.getUuid());
        PageableResult<ProductEntity> products = new ConvertiblePageableResult<ProductEntity, ProductEntityDto>(
                productService.getAllProductsByCategoryUuid(categoryEntity.getUuid(), page, PAGE_SIZE),
                productEntityConverter, ProductLoadOptions.DEFAULT_CURRENCY_AND_UNIT_PRICE
        );
        /** Set attributes */
        model.addAttribute("category", categoryConverter.convert(categoryEntity, CategoryLoadOptions.BREAD_CRUMBS));
        model.addAttribute("categories", categoryConverter.convertAll(subCategories));
        model.addAttribute("productsResult", products);
        return MercuriusComicsShopConstants.VIEW.CATEGORY_PAGE;
    }

    /**
     * Category page
     * @param categoryCode Category code
     * @param model Model
     * @return View path
     */
    @RequestMapping(method = RequestMethod.GET, value = "/catalog/**/{categoryCode}")
    public String catalogPage(@PathVariable String categoryCode, @RequestParam(name = "page", required = false, defaultValue = "0") Integer page, Model model) {
        CategoryEntity categoryEntity = catalogUniqueCodeEntityService.getEntityByCode(categoryCode, CategoryEntity.class);
        if (categoryEntity == null) {
            return MercuriusComicsShopConstants.VIEW.PAGE_NOT_FOUND;
        }
        List<CategoryEntity> subCategories = categoryService.getSubCategoriesByCategoryUuid(categoryEntity.getUuid());
        PageableResult<ProductEntity> products = new ConvertiblePageableResult<ProductEntity, ProductEntityDto>(
                productService.getAllProductsByCategoryUuid(categoryEntity.getUuid(), page, PAGE_SIZE),
                productEntityConverter, ProductLoadOptions.DEFAULT_CURRENCY_AND_UNIT_PRICE
        );
        /** Set attributes */
        model.addAttribute("category", categoryConverter.convert(categoryEntity, CategoryLoadOptions.BREAD_CRUMBS));
        model.addAttribute("categories", categoryConverter.convertAll(subCategories));
        model.addAttribute("productsResult", products);
        return MercuriusComicsShopConstants.VIEW.CATEGORY_PAGE;
    }
}

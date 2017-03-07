package net.sample.comics.shop.controller;

import net.sample.comics.shop.constants.MercuriusComicsShopConstants;
import org.mercuriusframework.converters.impl.ProductEntityConverter;
import org.mercuriusframework.entities.ProductEntity;
import org.mercuriusframework.enums.ProductLoadOptions;
import org.mercuriusframework.services.CatalogUniqueCodeEntityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Product page controller
 */
@Controller
public class ProductPageController extends AbstractController {

    /**
     * Catalog unique code entity service
     */
    @Autowired
    private CatalogUniqueCodeEntityService catalogUniqueCodeEntityService;

    /**
     * Product entity converter
     */
    @Autowired
    private ProductEntityConverter productEntityConverter;

    /**
     * Product page view
     * @param productCode Product code
     * @param model Model
     * @return View path
     */
    @RequestMapping(method = RequestMethod.GET, value = "/product/{productCode}")
    public String productPage(@PathVariable String productCode, Model model) {
        ProductEntity product = catalogUniqueCodeEntityService.getEntityByCode(productCode, ProductEntity.class, ProductEntity.MAIN_CATEGORY, ProductEntity.DESCRIPTION);
        if (product == null) {
            return MercuriusComicsShopConstants.VIEW.PAGE_NOT_FOUND;
        }
        model.addAttribute("product", productEntityConverter.convert(product, ProductLoadOptions.BREAD_CRUMBS,
                ProductLoadOptions.DESCRIPTION, ProductLoadOptions.DEFAULT_UNIT_STOCKS, ProductLoadOptions.DEFAULT_CURRENCY_AND_UNIT_PRICE));
        return MercuriusComicsShopConstants.VIEW.PRODUCT_PAGE;
    }
}

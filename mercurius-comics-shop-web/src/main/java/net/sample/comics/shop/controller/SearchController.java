package net.sample.comics.shop.controller;

import net.sample.comics.shop.constants.MercuriusComicsShopConstants;
import org.mercuriusframework.converters.impl.ProductEntityConverter;
import org.mercuriusframework.dto.ProductEntityDto;
import org.mercuriusframework.entities.ProductEntity;
import org.mercuriusframework.enums.ProductLoadOptions;
import org.mercuriusframework.facades.SearchFacade;
import org.mercuriusframework.services.query.PageableResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * Search controller
 */
@Controller
public class SearchController {

    /**
     * Search facade
     */
    @Autowired
    private SearchFacade searchFacade;

    /**
     * Product entity converter
     */
    @Autowired
    private ProductEntityConverter productEntityConverter;

    /**
     * Search products
     * @param searchText Search text
     * @param page Current page
     * @param model Model
     * @param request Http-request
     * @return View path
     */
    @RequestMapping(method = RequestMethod.GET, value = "/search")
    public String searchProducts(@RequestParam String searchText, @RequestParam(name = "page", required = false, defaultValue = "0") Integer page,
                                 Model model, HttpServletRequest request) {
        PageableResult<ProductEntityDto> products = searchFacade.search("productSearchResolver", searchText, page,
                productEntityConverter,
                new ProductLoadOptions[]{ProductLoadOptions.DEFAULT_CURRENCY_AND_UNIT_PRICE}, ProductEntity.CATEGORIES);

        model.addAttribute("productsResult", products);
        model.addAttribute("searchText", searchText);
        model.addAttribute("builtUrl", request.getRequestURI());
        /** Create params map */
        Map<String, String> queryParams = new HashMap<>();
        queryParams.put("searchText", searchText);
        model.addAttribute("queryParams", queryParams);
        return MercuriusComicsShopConstants.VIEW.SEARCH_PAGE;
    }

}

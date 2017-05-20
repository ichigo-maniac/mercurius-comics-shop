package net.sample.comics.shop.controller;

import net.sample.comics.shop.constants.MercuriusComicsShopConstants;
import org.mercuriusframework.converters.impl.FacetEntityConverter;
import org.mercuriusframework.converters.impl.ProductEntityConverter;
import org.mercuriusframework.dto.ProductEntityDto;
import org.mercuriusframework.entities.FacetEntity;
import org.mercuriusframework.entities.ProductEntity;
import org.mercuriusframework.enums.ProductLoadOptions;
import org.mercuriusframework.enums.SolrCriteriaValueType;
import org.mercuriusframework.facades.SolrSearchFacade;
import org.mercuriusframework.facades.solr.SolrCriteriaParameter;
import org.mercuriusframework.services.FacetService;
import org.mercuriusframework.services.query.PageableResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * Search controller
 */
@Controller
public class SearchController {

    /**
     * Search facade
     */
    @Autowired
    private SolrSearchFacade searchFacade;

    /**
     * Product entity converter
     */
    @Autowired
    private ProductEntityConverter productEntityConverter;

    /**
     * Facet service
     */
    @Autowired
    private FacetService facetService;

    /**
     * Facet entity converter
     */
    @Autowired
    private FacetEntityConverter facetEntityConverter;

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
        PageableResult<ProductEntityDto> products = searchFacade.search(MercuriusComicsShopConstants.SOLR_SEARCH.PRODUCT_SEARCH_RESOLVER,
                searchText, createCriteriaParameters(request, model), page,
                productEntityConverter,
                new ProductLoadOptions[]{ProductLoadOptions.DEFAULT_CURRENCY_AND_UNIT_PRICE}, ProductEntity.CATEGORIES);

        List<FacetEntity> facets = facetService.getFacetsFolAllCategories();
        model.addAttribute("productsResult", products);
        model.addAttribute("searchText", searchText);
        model.addAttribute("builtUrl", request.getRequestURI());
        model.addAttribute("facets", facetEntityConverter.convertAll(facets));
        model.addAttribute("facetPrefix", MercuriusComicsShopConstants.SOLR_SEARCH.CATEGORY_FACET_PARAM_PREFIX);
        /** Create params map */
        Map<String, String> queryParams = new HashMap<>();
        queryParams.put("searchText", searchText);
        model.addAttribute("queryParams", queryParams);
        return MercuriusComicsShopConstants.VIEW.SEARCH_PAGE;
    }

    /**
     * Create solr criteria parameters
     * @param request Http-request
     * @param model View model
     * @return Array of parameters
     */
    private SolrCriteriaParameter[] createCriteriaParameters(HttpServletRequest request, Model model) {
        List<String> paramNames = Collections.list(request.getParameterNames());
        List<SolrCriteriaParameter> result = new ArrayList<>();
        /** Check facet parameters */
        for (String paramName : paramNames) {
            if (paramName.startsWith(MercuriusComicsShopConstants.SOLR_SEARCH.CATEGORY_FACET_PARAM_PREFIX)) {
                String fieldName = paramName.substring(MercuriusComicsShopConstants.SOLR_SEARCH.CATEGORY_FACET_PARAM_PREFIX.length());
                String[] values = request.getParameterValues(paramName);
                result.add(new SolrCriteriaParameter(fieldName, values, SolrCriteriaValueType.IN));
                model.addAttribute(paramName, values);
            }
        }
        return result.toArray(new SolrCriteriaParameter[result.size()]);
    }

}

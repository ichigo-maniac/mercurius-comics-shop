package net.sample.comics.shop.controller;

import net.sample.comics.shop.constants.MercuriusComicsShopConstants;
import net.sample.comics.shop.dto.ISTFacetEntityDto;
import org.apache.commons.lang.math.DoubleRange;
import org.mercuriusframework.converters.impl.FacetEntityConverter;
import org.mercuriusframework.converters.impl.ProductEntityConverter;
import org.mercuriusframework.dto.CurrencyEntityDto;
import org.mercuriusframework.dto.DictionaryItemEntityDto;
import org.mercuriusframework.dto.ProductEntityDto;
import org.mercuriusframework.dto.UnitEntityDto;
import org.mercuriusframework.entities.CategoryEntity;
import org.mercuriusframework.entities.FacetEntity;
import org.mercuriusframework.entities.ProductEntity;
import org.mercuriusframework.enums.ProductLoadOptions;
import org.mercuriusframework.enums.SolrCriteriaValueType;
import org.mercuriusframework.facades.CurrencyFacade;
import org.mercuriusframework.facades.SolrSearchFacade;
import org.mercuriusframework.facades.UnitFacade;
import org.mercuriusframework.facades.solr.SolrCriteriaParameter;
import org.mercuriusframework.fillers.impl.FacetEntityFiller;
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
     * Facet entity filler
     */
    @Autowired
    private FacetEntityFiller facetEntityFiller;

    /**
     * Currency facade
     */
    @Autowired
    private CurrencyFacade currencyFacade;

    /**
     * Unit facade
     */
    @Autowired
    private UnitFacade unitFacade;

    /**
     * Search products
     * @param searchText Search text
     * @param page Current page
     * @param bottomPrice Bottom price
     * @param topPrice Top price
     * @param model Model
     * @param request Http-request
     * @return View path
     */
    @RequestMapping(method = RequestMethod.GET, value = "/search")
    public String searchProducts(@RequestParam String searchText, @RequestParam(name = "page", required = false, defaultValue = "0") Integer page,
                                 @RequestParam(name = "bottom_price", required = false) Double bottomPrice,
                                 @RequestParam(name = "top_price", required = false) Double topPrice,
                                 Model model, HttpServletRequest request) {
        String sortCode = null;
        PageableResult<ProductEntityDto> products = searchFacade.search(MercuriusComicsShopConstants.SOLR_SEARCH.PRODUCT_SEARCH_RESOLVER,
                searchText, createCriteriaParameters(request, model, bottomPrice, topPrice), page, sortCode,
                productEntityConverter,
                new ProductLoadOptions[]{ProductLoadOptions.DEFAULT_CURRENCY_AND_UNIT_PRICE}, ProductEntity.CATEGORIES);

        List<FacetEntity> facets = facetService.getFacetsFolAllCategories();
        model.addAttribute("productsResult", products);
        model.addAttribute("searchText", searchText);
        model.addAttribute("builtUrl", request.getRequestURI());
        model.addAttribute("bottomPrice", bottomPrice != null ? bottomPrice : 0);
        model.addAttribute("topPrice", topPrice != null ? topPrice : 25000);
        model.addAttribute("facets", buildFacets(facets, searchText));
        model.addAttribute("facetPrefix", MercuriusComicsShopConstants.SOLR_SEARCH.CATEGORY_FACET_PARAM_PREFIX);
        model.addAttribute("queryParams", buildQueryParams(model, searchText));
        return MercuriusComicsShopConstants.VIEW.SEARCH_PAGE;
    }

    /**
     * Build query params
     * @param model Attributes model
     * @param searchText Search text
     * @return Map of params
     */
    private Map<String, Object> buildQueryParams(Model model, String searchText) {
        Map<String, Object> queryParams = new HashMap<>();
        queryParams.put("searchText", searchText);
        Map<String, Object> attributesMap = model.asMap();
        for (String attributeName : attributesMap.keySet()) {
            if (attributeName.startsWith(MercuriusComicsShopConstants.SOLR_SEARCH.CATEGORY_FACET_PARAM_PREFIX)) {
                String[] values = (String[]) attributesMap.get(attributeName);
                queryParams.put(attributeName, values);
            }
        }
        return queryParams;
    }

    /**
     * Create solr criteria parameters
     * @param request Http-request
     * @param model View model
     * @param bottomPrice Bottom price
     * @param topPrice Top price
     * @return Array of parameters
     */
    private SolrCriteriaParameter[] createCriteriaParameters(HttpServletRequest request, Model model, Double bottomPrice, Double topPrice) {
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
        /** Price range parameters */
        if (bottomPrice != null && topPrice != null) {
            CurrencyEntityDto currency = currencyFacade.getDefaultCurrency();
            UnitEntityDto unit = unitFacade.getDefaultUnit();
            if (currency != null && unit != null) {
                result.add(new SolrCriteriaParameter(MercuriusComicsShopConstants.SOLR_SEARCH.PRICE_SOLR_FIELD +
                        unit.getCode() + "_" + currency.getCode(),
                        new DoubleRange(bottomPrice, topPrice), SolrCriteriaValueType.BETWEEN));
            }
        }
        return result.toArray(new SolrCriteriaParameter[result.size()]);
    }

    /**
     * Build facets
     * @param facetEntities Facet entities
     * @param searchText Search text
     * @return List of facets
     */
    private List<ISTFacetEntityDto> buildFacets(List<FacetEntity> facetEntities, String searchText) {
        List<ISTFacetEntityDto> result = new ArrayList<>();
        for (FacetEntity facetEntity : facetEntities) {
            ISTFacetEntityDto facetEntityDto = new ISTFacetEntityDto();
            facetEntityFiller.fillIn(facetEntity, facetEntityDto);
            Map<String, Long> valuesCount = new HashMap<>();
            /** Load values */
            for (DictionaryItemEntityDto item : facetEntityDto.getAvailableValues()) {
                SolrCriteriaParameter facetParameter = new SolrCriteriaParameter(facetEntityDto.getSolrDocumentFieldName(), item.getCode(), SolrCriteriaValueType.IS);
                Long count = searchFacade.count(MercuriusComicsShopConstants.SOLR_SEARCH.PRODUCT_SEARCH_RESOLVER, searchText, facetParameter);
                if (count > 0) {
                    valuesCount.put(item.getCode(), count);
                }
            }
            if (!valuesCount.keySet().isEmpty()) {
                facetEntityDto.setValuesCounts(valuesCount);
                result.add(facetEntityDto);
            }
        }
        return result;
    }

}

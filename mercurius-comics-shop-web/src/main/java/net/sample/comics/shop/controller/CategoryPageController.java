package net.sample.comics.shop.controller;

import net.sample.comics.shop.constants.MercuriusComicsShopConstants;
import net.sample.comics.shop.dto.ISTFacetEntityDto;
import org.apache.commons.lang.math.DoubleRange;
import org.mercuriusframework.converters.impl.CategoryEntityConverter;
import org.mercuriusframework.converters.impl.ProductEntityConverter;
import org.mercuriusframework.dto.*;
import org.mercuriusframework.entities.CategoryEntity;
import org.mercuriusframework.entities.FacetEntity;
import org.mercuriusframework.entities.ProductEntity;
import org.mercuriusframework.enums.CategoryLoadOptions;
import org.mercuriusframework.enums.ProductLoadOptions;
import org.mercuriusframework.enums.SolrCriteriaValueType;
import org.mercuriusframework.facades.CurrencyFacade;
import org.mercuriusframework.facades.SolrSearchFacade;
import org.mercuriusframework.facades.UnitFacade;
import org.mercuriusframework.facades.solr.SolrCriteriaParameter;
import org.mercuriusframework.fillers.impl.FacetEntityFiller;
import org.mercuriusframework.services.CatalogUniqueCodeEntityService;
import org.mercuriusframework.services.CategoryService;
import org.mercuriusframework.services.FacetService;
import org.mercuriusframework.services.query.PageableResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

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
     * Search facade
     */
    @Autowired
    private SolrSearchFacade searchFacade;

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
     * Main catalog page
     * @param page Current page
     * @param bottomPrice Bottom price
     * @param topPrice Top price
     * @param model Model
     * @param request Http-request
     * @return View path
     */
    @RequestMapping(method = RequestMethod.GET, value = "/catalog")
    public String catalogPage(@RequestParam(name = "page", required = false, defaultValue = "0") Integer page,
                              @RequestParam(name = "bottom_price", required = false) Double bottomPrice,
                              @RequestParam(name = "top_price", required = false) Double topPrice,
                              Model model, HttpServletRequest request) {
        CategoryEntity categoryEntity = catalogUniqueCodeEntityService.getEntityByCode("catalog", CategoryEntity.class);
        if (categoryEntity == null) {
            return MercuriusComicsShopConstants.VIEW.PAGE_NOT_FOUND;
        }
        List<CategoryEntity> subCategories = categoryService.getSubCategoriesByCategoryUuid(categoryEntity.getUuid());
        List<FacetEntity> facets = facetService.getFacetsByCategory(categoryEntity);
        /** Products */
        String sortCode = null;
        PageableResult<ProductEntityDto> products = searchFacade.search(MercuriusComicsShopConstants.SOLR_SEARCH.PRODUCT_SEARCH_RESOLVER,
                "", createCriteriaParameters(request, model, categoryEntity, bottomPrice, topPrice), page, sortCode,
                productEntityConverter,
                new ProductLoadOptions[]{ProductLoadOptions.DEFAULT_CURRENCY_AND_UNIT_PRICE}, ProductEntity.CATEGORIES);
        /** Categories */
        List<CategoryEntityDto> categoriesDto = categoryConverter.convertAll(subCategories);
        Collections.sort(categoriesDto, (cat1, cat2) -> {
            Integer p1 = cat1.getPriority() != null ? cat1.getPriority() : 0;
            Integer p2 = cat2.getPriority() != null ? cat2.getPriority() : 0;
            return p2.compareTo(p1);
        });
        /** Set attributes */
        model.addAttribute("category", categoryConverter.convert(categoryEntity, CategoryLoadOptions.BREAD_CRUMBS));
        model.addAttribute("bottomPrice", bottomPrice != null ? bottomPrice : 0);
        model.addAttribute("topPrice", topPrice != null ? topPrice : 25000);
        model.addAttribute("categories", categoriesDto);
        model.addAttribute("productsResult", products);
        model.addAttribute("queryParams", new HashMap<String, String>());
        model.addAttribute("facets", buildFacets(facets, categoryEntity));
        model.addAttribute("builtUrl", request.getRequestURI());
        model.addAttribute("facetPrefix", MercuriusComicsShopConstants.SOLR_SEARCH.CATEGORY_FACET_PARAM_PREFIX);
        return MercuriusComicsShopConstants.VIEW.CATEGORY_PAGE;
    }

    /**
     * Category page
     * @param categoryCode Category code
     * @param page Current page
     * @param bottomPrice Bottom price
     * @param topPrice Top price
     * @param model Model
     * @param request Http-request
     * @return View path
     */
    @RequestMapping(method = RequestMethod.GET, value = "/catalog/**/{categoryCode}")
    public String catalogPage(@PathVariable String categoryCode, @RequestParam(name = "page", required = false, defaultValue = "0") Integer page,
                              @RequestParam(name = "bottom_price", required = false) Double bottomPrice,
                              @RequestParam(name = "top_price", required = false) Double topPrice,
                              Model model, HttpServletRequest request) {
        CategoryEntity categoryEntity = catalogUniqueCodeEntityService.getEntityByCode(categoryCode, CategoryEntity.class);
        if (categoryEntity == null) {
            return MercuriusComicsShopConstants.VIEW.PAGE_NOT_FOUND;
        }
        List<CategoryEntity> subCategories = categoryService.getSubCategoriesByCategoryUuid(categoryEntity.getUuid());
        List<FacetEntity> facets = facetService.getFacetsByCategory(categoryEntity);
        /** Products */
        String sortCode = null;
        PageableResult<ProductEntityDto> products = searchFacade.search(MercuriusComicsShopConstants.SOLR_SEARCH.PRODUCT_SEARCH_RESOLVER,
                "", createCriteriaParameters(request, model, categoryEntity, bottomPrice, topPrice), page, sortCode,
                productEntityConverter,
                new ProductLoadOptions[]{ProductLoadOptions.DEFAULT_CURRENCY_AND_UNIT_PRICE}, ProductEntity.CATEGORIES);
        /** Set attributes */
        model.addAttribute("category", categoryConverter.convert(categoryEntity, CategoryLoadOptions.BREAD_CRUMBS));
        model.addAttribute("bottomPrice", bottomPrice != null ? bottomPrice : 0);
        model.addAttribute("topPrice", topPrice != null ? topPrice : 25000);
        model.addAttribute("categories", categoryConverter.convertAll(subCategories));
        model.addAttribute("productsResult", products);
        model.addAttribute("facets", buildFacets(facets, categoryEntity));
        model.addAttribute("builtUrl", request.getRequestURI());
        model.addAttribute("facetPrefix", MercuriusComicsShopConstants.SOLR_SEARCH.CATEGORY_FACET_PARAM_PREFIX);
        model.addAttribute("queryParams", buildQueryParams(model));
        return MercuriusComicsShopConstants.VIEW.CATEGORY_PAGE;
    }

    /**
     * Build query params
     * @param model Attributes model
     * @return Map of params
     */
    private Map<String, Object> buildQueryParams(Model model) {
        Map<String, Object> queryParams = new HashMap<>();
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
     * @param category Category
     * @param bottomPrice Bottom price
     * @param topPrice Top price
     * @return Array of parameters
     */
    private SolrCriteriaParameter[] createCriteriaParameters(HttpServletRequest request, Model model, CategoryEntity category, Double bottomPrice, Double topPrice) {
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
        /** Category criteria parameter */
        result.add(new SolrCriteriaParameter(MercuriusComicsShopConstants.SOLR_SEARCH.CATEGORIES_SOLR_FIELD,
                category.getCode(), SolrCriteriaValueType.IS));
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
     * @param categoryEntity Category
     * @return List of facets
     */
    private List<ISTFacetEntityDto> buildFacets(List<FacetEntity> facetEntities, CategoryEntity categoryEntity) {
        List<ISTFacetEntityDto> result = new ArrayList<>();
        SolrCriteriaParameter categoryParameter = new SolrCriteriaParameter(MercuriusComicsShopConstants.SOLR_SEARCH.CATEGORIES_SOLR_FIELD,
                categoryEntity.getCode(), SolrCriteriaValueType.IS);
        for (FacetEntity facetEntity : facetEntities) {
            ISTFacetEntityDto facetEntityDto = new ISTFacetEntityDto();
            facetEntityFiller.fillIn(facetEntity, facetEntityDto);
            Map<String, Long> valuesCount = new HashMap<>();
            /** Load values */
            for (DictionaryItemEntityDto item : facetEntityDto.getAvailableValues()) {
                SolrCriteriaParameter facetParameter = new SolrCriteriaParameter(facetEntityDto.getSolrDocumentFieldName(), item.getCode(), SolrCriteriaValueType.IS);
                Long count = searchFacade.count(MercuriusComicsShopConstants.SOLR_SEARCH.PRODUCT_SEARCH_RESOLVER, "", categoryParameter, facetParameter);
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

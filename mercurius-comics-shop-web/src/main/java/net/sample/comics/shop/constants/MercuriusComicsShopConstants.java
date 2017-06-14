package net.sample.comics.shop.constants;

/**
 * Mercurius comics shop constants
 */
public class MercuriusComicsShopConstants {

    /**
     * Solr search constants
     */
    public class SOLR_SEARCH {
        public static final String PRODUCT_SEARCH_RESOLVER = "productSearchResolver";
        public static final String CATEGORY_FACET_PARAM_PREFIX = "category-facet-";
        public static final String CATEGORIES_SOLR_FIELD = "categories";
    }

    /**
     * JSP view constants
     */
    public class VIEW {
        public static final String PAGE_NOT_FOUND = "common/404_not_found";
        public static final String HOME_PAGE = "index";
        public static final String SEARCH_PAGE = "catalog/search_page";
        public static final String CATEGORY_PAGE = "catalog/category_page";
        public static final String PRODUCT_PAGE = "product/product_page";
    }

    /**
     * Parameters keys constants
     */
    public class PARAMETERS {
        public static final String APP_HOST_PATH = "comics.shop.application.host.path";
        public static final String VK_CLIENT_ID = "comics.shop.vk.com.clientId";
        public static final String VK_SECRET = "comics.shop.vk.com.clientSecret";
        public static final String VK_OAUTH_METHOD = "comics.shop.vk.com.oauth.method";
    }

    /**
     * Redirect constants
     */
    public class REDIRECT {
        public static final String HOME = "redirect:/";
        public static final String PAGE_NOT_FOUND = "redirect:/";
    }

}

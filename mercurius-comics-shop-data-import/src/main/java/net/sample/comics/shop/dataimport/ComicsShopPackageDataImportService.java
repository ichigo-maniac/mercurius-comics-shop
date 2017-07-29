package net.sample.comics.shop.dataimport;

import org.mercuriusframework.dataimport.services.DataImportService;
import org.mercuriusframework.dataimport.services.PackageDataImportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Comics shop data import service
 */
@Service("comicsShopPackageDataImportService")
public class ComicsShopPackageDataImportService implements PackageDataImportService {

    /**
     * Constants
     */
    private static final String RESOURCE_PATH = "/mercurius-comics-shop-data-import-data/comics-shop/";

    /**
     * Data import service
     */
    @Autowired
    private DataImportService dataImportService;

    /**
     * Import data
     * @return Log result
     */
    @Override
    public String importData() {
        StringBuilder logResult = new StringBuilder();
        /** Categories and dictionaries */
        logResult.append(dataImportService.importClasspathData(RESOURCE_PATH + "catalog-categories.xml"));
        logResult.append(dataImportService.importClasspathData(RESOURCE_PATH + "dictionaries.xml"));
        /** Products */
        logResult.append(dataImportService.importClasspathData(RESOURCE_PATH + "products/catalog-products-books-ranobe.xml"));
        logResult.append(dataImportService.importClasspathData(RESOURCE_PATH + "products/catalog-products-manga.xml"));
        logResult.append(dataImportService.importClasspathData(RESOURCE_PATH + "products/catalog-products-videogames-consoles-nintendo.xml"));
        logResult.append(dataImportService.importClasspathData(RESOURCE_PATH + "products/catalog-products-videogames-ps4.xml"));
        logResult.append(dataImportService.importClasspathData(RESOURCE_PATH + "products/catalog-products-videogames-xbox-one.xml"));
        logResult.append(dataImportService.importClasspathData(RESOURCE_PATH + "products/catalog-products-videogames-nintendo-switch.xml"));
        logResult.append(dataImportService.importClasspathData(RESOURCE_PATH + "products/catalog-products-videogames-nintendo-3ds.xml"));
        logResult.append(dataImportService.importClasspathData(RESOURCE_PATH + "products/catalog-products-comics-books.xml"));

        /** Features */
        logResult.append(dataImportService.importClasspathData(RESOURCE_PATH + "features/catalog-products-books-ranobe-features.xml"));
        logResult.append(dataImportService.importClasspathData(RESOURCE_PATH + "features/catalog-products-manga-features.xml"));
        logResult.append(dataImportService.importClasspathData(RESOURCE_PATH + "features/catalog-products-videogames-nintendo-switch-features.xml"));
        logResult.append(dataImportService.importClasspathData(RESOURCE_PATH + "features/catalog-products-videogames-nintendo-3ds-features.xml"));
        logResult.append(dataImportService.importClasspathData(RESOURCE_PATH + "features/catalog-products-videogames-ps4-features.xml"));
        logResult.append(dataImportService.importClasspathData(RESOURCE_PATH + "features/catalog-products-videogames-xbox-one-features.xml"));
        logResult.append(dataImportService.importClasspathData(RESOURCE_PATH + "features/catalog-products-videogames-consoles-nintendo-features.xml"));
        logResult.append(dataImportService.importClasspathData(RESOURCE_PATH + "features/catalog-products-comics-books-features.xml"));

        /** Prices */
        logResult.append(dataImportService.importClasspathData(RESOURCE_PATH + "prices/catalog-products-books-ranobe-prices.xml"));
        logResult.append(dataImportService.importClasspathData(RESOURCE_PATH + "prices/catalog-products-manga-prices.xml"));
        logResult.append(dataImportService.importClasspathData(RESOURCE_PATH + "prices/catalog-products-videogames-consoles-nintendo-prices.xml"));
        logResult.append(dataImportService.importClasspathData(RESOURCE_PATH + "prices/catalog-products-videogames-ps4-prices.xml"));
        logResult.append(dataImportService.importClasspathData(RESOURCE_PATH + "prices/catalog-products-videogames-xbox-one-prices.xml"));
        logResult.append(dataImportService.importClasspathData(RESOURCE_PATH + "prices/catalog-products-comics-books-prices.xml"));
        logResult.append(dataImportService.importClasspathData(RESOURCE_PATH + "prices/catalog-products-videogames-nintendo-switch-prices.xml"));
        logResult.append(dataImportService.importClasspathData(RESOURCE_PATH + "prices/catalog-products-videogames-nintendo-3ds-prices.xml"));

        /** Index */
        logResult.append(dataImportService.importClasspathData(RESOURCE_PATH + "index/index-properties.xml"));
        logResult.append(dataImportService.importClasspathData(RESOURCE_PATH + "index/facets.xml"));
        return logResult.toString();
    }
}

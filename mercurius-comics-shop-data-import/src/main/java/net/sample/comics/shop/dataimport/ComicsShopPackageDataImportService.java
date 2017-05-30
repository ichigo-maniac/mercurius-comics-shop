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
        logResult.append(dataImportService.importClasspathData(RESOURCE_PATH + "products/catalog-products-videogames-ps4.xml"));
        logResult.append(dataImportService.importClasspathData(RESOURCE_PATH + "products/catalog-products-videogames-xbox-one.xml"));
        /** Features */
        logResult.append(dataImportService.importClasspathData(RESOURCE_PATH + "features/catalog-products-books-ranobe-features.xml"));
        logResult.append(dataImportService.importClasspathData(RESOURCE_PATH + "features/catalog-products-manga-features.xml"));
        /** Index */
        logResult.append(dataImportService.importClasspathData(RESOURCE_PATH + "index/index-properties.xml"));
        logResult.append(dataImportService.importClasspathData(RESOURCE_PATH + "index/facets.xml"));
        return logResult.toString();
    }
}
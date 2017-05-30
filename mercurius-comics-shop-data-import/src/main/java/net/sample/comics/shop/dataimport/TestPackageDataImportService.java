package net.sample.comics.shop.dataimport;

import org.mercuriusframework.dataimport.services.DataImportService;
import org.mercuriusframework.dataimport.services.PackageDataImportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Test package data import service
 */
@Service("testPackageDataImportService")
public class TestPackageDataImportService implements PackageDataImportService {

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
        return dataImportService.importClasspathData("/mercurius-comics-shop-data-import-data/test-catalog-import.xml");
    }
}

package net.sample.comics.shop.services.impl;

import net.sample.comics.shop.services.ISTProductService;
import org.mercuriusframework.entities.ProductEntity;
import org.mercuriusframework.services.impl.ProductServiceImpl;
import org.mercuriusframework.services.query.PageableResult;
import org.springframework.stereotype.Service;

/**
 * Istari product service
 */
@Service("istProductService")
public class ISTProductServiceImpl extends ProductServiceImpl implements ISTProductService {

    /**
     * Get new releases products
     * @return Pageable products result
     */
    public PageableResult<ProductEntity> getNewReleasesProducts() {
        return entityService.getPageableResultByQueries(
            "SELECT DISTINCT product FROM " + ProductEntity.ENTITY_NAME + " as product " +
                    "ORDER BY product." + ProductEntity.MODIFICATION_TIME,
            "SELECT count(product) FROM " + ProductEntity.ENTITY_NAME + " as product",
            0, 3, ProductEntity.class
        );
    }
}

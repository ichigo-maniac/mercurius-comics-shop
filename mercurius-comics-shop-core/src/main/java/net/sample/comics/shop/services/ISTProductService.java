package net.sample.comics.shop.services;

import org.mercuriusframework.entities.ProductEntity;
import org.mercuriusframework.services.ProductService;
import org.mercuriusframework.services.query.PageableResult;

import java.util.List;

/**
 * Istari product service interface
 */
public interface ISTProductService extends ProductService {
    /**
     * Get new releases products
     * @return Pageable products result
     */
    PageableResult<ProductEntity> getNewReleasesProducts();
}

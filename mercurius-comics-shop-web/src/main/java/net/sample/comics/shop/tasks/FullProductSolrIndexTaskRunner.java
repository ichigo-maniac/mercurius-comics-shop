package net.sample.comics.shop.tasks;

import org.mercuriusframework.tasks.SolrIndexTaskRunner;
import org.springframework.stereotype.Service;

/**
 * Created by impi on 05.04.17.
 */
@Service("fullProductSolrIndexTaskRunner")
public class FullProductSolrIndexTaskRunner extends SolrIndexTaskRunner {
}

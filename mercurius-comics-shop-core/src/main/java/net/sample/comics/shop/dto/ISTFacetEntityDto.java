package net.sample.comics.shop.dto;

import org.mercuriusframework.dto.FacetEntityDto;

import java.io.Serializable;
import java.util.Map;

/**
 * Facet entity data transfer object
 */
public class ISTFacetEntityDto extends FacetEntityDto implements Serializable {

    private static final long serialVersionUID = 8492504686372247144L;

    /**
     * Available values counts map
     */
    private Map<String, Long> valuesCounts;

    /**
     * Get available values counts map
     * @return Available values counts map
     */
    public Map<String, Long> getValuesCounts() {
        return valuesCounts;
    }

    /**
     * Set available values counts map
     * @param valuesCounts Available values counts map
     */
    public void setValuesCounts(Map<String, Long> valuesCounts) {
        this.valuesCounts = valuesCounts;
    }
}

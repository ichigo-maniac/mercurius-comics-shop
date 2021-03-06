package net.sample.comics.shop.configuration;


import org.mercuriusframework.dataimport.constants.MercuriusDataImportConstants;
import org.mercuriusframework.filters.CurrentStoreSetterFilter;
import org.mercuriusframework.filters.DefaultCatalogSetterFilter;
import org.mercuriusframework.filters.DefaultCurrencySetterFilter;
import org.mercuriusframework.filters.DefaultUnitSetterFilter;
import org.mercuriusframework.mmc.constants.MercuriusMMCConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.DefaultSecurityFilterChain;
import org.springframework.security.web.FilterChainProxy;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import java.util.ArrayList;
import java.util.List;

/**
 * Security configuration
 */
@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

    /**
     * Default catalog setter filter
     */
    @Autowired
    private DefaultCatalogSetterFilter defaultCatalogSetterFilter;

    /**
     * Current store setter filter
     */
    @Autowired
    private CurrentStoreSetterFilter currentStoreSetterFilter;

    /**
     * Default unit setter filter
     */
    @Autowired
    private DefaultUnitSetterFilter defaultUnitSetterFilter;

    /**
     * Default currency setter filter
     */
    @Autowired
    private DefaultCurrencySetterFilter defaultCurrencySetterFilter;

    /**
     * Filter chain proxy (name of bean must be "springSecurityFilterChain")
     * @return Filter chain proxy
     */
    @Bean(name = "mercuriusFilterChain")
    public FilterChainProxy filterChainProxy() {
        List<SecurityFilterChain> filterChains = new ArrayList<SecurityFilterChain>();

        /** Resource filter chain */
        filterChains.add(new DefaultSecurityFilterChain(new AntPathRequestMatcher("/resources/**")));

        /** MMC filter chain */
        filterChains.add(new DefaultSecurityFilterChain(new AntPathRequestMatcher(
                MercuriusMMCConstants.URLS.BASE_PATH + "**")));

        /** Data import filter chain */
        filterChains.add(new DefaultSecurityFilterChain(new AntPathRequestMatcher(
                MercuriusDataImportConstants.URLS.BASE_PATH + "**")));

        /** Common filter chain */
        filterChains.add(new DefaultSecurityFilterChain(new AntPathRequestMatcher("/**"),
                defaultCatalogSetterFilter, currentStoreSetterFilter, defaultCurrencySetterFilter, defaultUnitSetterFilter));
        return new FilterChainProxy(filterChains);

    }

    /**
     * Configure
     * @param web Web security
     * @throws Exception Exception
     */
    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/resources/**");
    }

    /**
     * Configure
     * @param http Http-security
     * @throws Exception Exception
     */
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.logout().logoutUrl("/logout");
    }
}

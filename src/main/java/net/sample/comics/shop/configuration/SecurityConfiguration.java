package net.sample.comics.shop.configuration;

import org.mercuriusframework.filters.DefaultCatalogSetterFilter;
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
     * Filter chain proxy (name of bean must be "springSecurityFilterChain")
     * @return Filter chain proxy
     */
    @Bean(name = "springSecurityFilterChain")
    public FilterChainProxy filterChainProxy() {
        List<SecurityFilterChain> filterChains = new ArrayList<SecurityFilterChain>();

        /** Resource filter chain */
        filterChains.add(new DefaultSecurityFilterChain(new AntPathRequestMatcher("/resources/**")));

        /** Common filter chain */
        filterChains.add(new DefaultSecurityFilterChain(new AntPathRequestMatcher("/**"),
                defaultCatalogSetterFilter));
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

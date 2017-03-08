package net.sample.comics.shop;

import org.mercuriusframework.entities.*;
import org.mercuriusframework.services.CatalogUniqueCodeEntityService;
import org.mercuriusframework.services.ConfigurationService;
import org.mercuriusframework.services.EntityService;
import org.mercuriusframework.services.UniqueCodeEntityService;
import org.mercuriusframework.services.impl.EntityServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.PostConstruct;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;

/**
 * Created by impi on 05.02.16.
 */
@Service("ds")
public class TestBean {

    @Autowired
    private ConfigurationService configurationService;

    @Autowired
    private EntityService entityService;

    @Autowired
    private UniqueCodeEntityService uniqueCodeEntityService;

    @Autowired
    private CatalogUniqueCodeEntityService catalogUniqueCodeEntityService;



    @PostConstruct
    public void test() {
//        CustomerEntity customerEntity = new CustomerEntity();
//        customerEntity.setEmail("test@test.ru");
//        customerEntity.setName("Test customer");
//        entityService.save(customerEntity);
//
//        EmployeeEntity employeeEntity = new EmployeeEntity();
//        employeeEntity.setCode("admin");
//        employeeEntity.setName("Test admin");
//        employeeEntity.setEmail("admin@test.ru");
//
//        entityService.save(employeeEntity);
//        employeeEntity.toString();
    }
}

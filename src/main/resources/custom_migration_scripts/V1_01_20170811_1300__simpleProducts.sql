-- Products --

INSERT INTO PRODUCT(uuid, name, code, creationtime, modificationtime, shortName, catalog_uuid, main_category_uuid, main_unit_uuid) VALUES (
  uuid_generate_v1(), 'Sword Art Online vol. 01', 'product_sao_01', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Reki Kawahara',
  (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'),
  (SELECT uuid FROM CATEGORY WHERE code ='ranobe_fantasy' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM UNIT WHERE code ='pieces' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'))
);

INSERT INTO PRODUCT(uuid, name, code, creationtime, modificationtime, shortName, catalog_uuid, main_category_uuid, main_unit_uuid) VALUES (
  uuid_generate_v1(), 'Sword Art Online vol. 02', 'product_sao_02', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Reki Kawahara',
  (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'),
  (SELECT uuid FROM CATEGORY WHERE code ='ranobe_fantasy' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM UNIT WHERE code ='pieces' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'))
);

INSERT INTO PRODUCT(uuid, name, code, creationtime, modificationtime, shortName, catalog_uuid, main_category_uuid, main_unit_uuid) VALUES (
  uuid_generate_v1(), 'Sword Art Online vol. 03', 'product_sao_03', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Reki Kawahara',
  (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'),
  (SELECT uuid FROM CATEGORY WHERE code ='ranobe_fantasy' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM UNIT WHERE code ='pieces' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'))
);

INSERT INTO PRODUCT(uuid, name, code, creationtime, modificationtime, shortName, catalog_uuid, main_category_uuid, main_unit_uuid) VALUES (
  uuid_generate_v1(), 'Sword Art Online vol. 04', 'product_sao_04', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Reki Kawahara',
  (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'),
  (SELECT uuid FROM CATEGORY WHERE code ='ranobe_fantasy' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM UNIT WHERE code ='pieces' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'))
);

INSERT INTO PRODUCT(uuid, name, code, creationtime, modificationtime, shortName, catalog_uuid, main_category_uuid, main_unit_uuid) VALUES (
  uuid_generate_v1(), 'Sword Art Online vol. 05', 'product_sao_05', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Reki Kawahara',
  (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'),
  (SELECT uuid FROM CATEGORY WHERE code ='ranobe_fantasy' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM UNIT WHERE code ='pieces' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'))
);

INSERT INTO PRODUCT(uuid, name, code, creationtime, modificationtime, shortName, catalog_uuid, main_category_uuid, main_unit_uuid) VALUES (
  uuid_generate_v1(), 'Sword Art Online vol. 06', 'product_sao_06', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Reki Kawahara',
  (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'),
  (SELECT uuid FROM CATEGORY WHERE code ='ranobe_fantasy' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM UNIT WHERE code ='pieces' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'))
);

-- Links - units  --

INSERT INTO PRODUCTS_UNITS_LINK(product_uuid, unit_uuid) VALUES(
  (SELECT uuid FROM PRODUCT WHERE code ='product_sao_01' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM UNIT WHERE code ='pieces' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'))
);

INSERT INTO PRODUCTS_UNITS_LINK(product_uuid, unit_uuid) VALUES(
  (SELECT uuid FROM PRODUCT WHERE code ='product_sao_02' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM UNIT WHERE code ='pieces' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'))
);

INSERT INTO PRODUCTS_UNITS_LINK(product_uuid, unit_uuid) VALUES(
  (SELECT uuid FROM PRODUCT WHERE code ='product_sao_03' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM UNIT WHERE code ='pieces' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'))
);

INSERT INTO PRODUCTS_UNITS_LINK(product_uuid, unit_uuid) VALUES(
  (SELECT uuid FROM PRODUCT WHERE code ='product_sao_04' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM UNIT WHERE code ='pieces' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'))
);

INSERT INTO PRODUCTS_UNITS_LINK(product_uuid, unit_uuid) VALUES(
  (SELECT uuid FROM PRODUCT WHERE code ='product_sao_05' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM UNIT WHERE code ='pieces' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'))
);

INSERT INTO PRODUCTS_UNITS_LINK(product_uuid, unit_uuid) VALUES(
  (SELECT uuid FROM PRODUCT WHERE code ='product_sao_06' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM UNIT WHERE code ='pieces' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'))
);

-- Link - categories --

INSERT INTO PRODUCTS_CATEGORIES_LINK(product_uuid, category_uuid) VALUES(
  (SELECT uuid FROM PRODUCT WHERE code ='product_sao_01' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM CATEGORY WHERE code ='ranobe_fantasy' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'))
);

INSERT INTO PRODUCTS_CATEGORIES_LINK(product_uuid, category_uuid) VALUES(
  (SELECT uuid FROM PRODUCT WHERE code ='product_sao_02' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM CATEGORY WHERE code ='ranobe_fantasy' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'))
);

INSERT INTO PRODUCTS_CATEGORIES_LINK(product_uuid, category_uuid) VALUES(
  (SELECT uuid FROM PRODUCT WHERE code ='product_sao_03' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM CATEGORY WHERE code ='ranobe_fantasy' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'))
);

INSERT INTO PRODUCTS_CATEGORIES_LINK(product_uuid, category_uuid) VALUES(
  (SELECT uuid FROM PRODUCT WHERE code ='product_sao_04' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM CATEGORY WHERE code ='ranobe_fantasy' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'))
);

INSERT INTO PRODUCTS_CATEGORIES_LINK(product_uuid, category_uuid) VALUES(
  (SELECT uuid FROM PRODUCT WHERE code ='product_sao_05' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM CATEGORY WHERE code ='ranobe_fantasy' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'))
);

INSERT INTO PRODUCTS_CATEGORIES_LINK(product_uuid, category_uuid) VALUES(
  (SELECT uuid FROM PRODUCT WHERE code ='product_sao_06' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM CATEGORY WHERE code ='ranobe_fantasy' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'))
);
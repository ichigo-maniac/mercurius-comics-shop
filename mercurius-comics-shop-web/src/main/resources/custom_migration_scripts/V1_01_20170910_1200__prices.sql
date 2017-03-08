INSERT INTO PRICE(uuid, name, code, creationtime, modificationtime, priceValue, catalog_uuid, product_uuid, unit_uuid, currency_uuid) VALUES (
  uuid_generate_v1(), 'Sword Art Online vol. 01 - price', 'product_sao_01_price_pieces', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 500.0,
  (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'),
  (SELECT uuid FROM PRODUCT WHERE code ='product_sao_01' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM UNIT WHERE code ='pieces' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM CURRENCY WHERE code = 'rub')
);

INSERT INTO PRICE(uuid, name, code, creationtime, modificationtime, priceValue, catalog_uuid, product_uuid, unit_uuid, currency_uuid) VALUES (
  uuid_generate_v1(), 'Sword Art Online vol. 02 - price', 'product_sao_02_price_pieces', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 500.0,
  (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'),
  (SELECT uuid FROM PRODUCT WHERE code ='product_sao_02' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM UNIT WHERE code ='pieces' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM CURRENCY WHERE code = 'rub')
);

INSERT INTO PRICE(uuid, name, code, creationtime, modificationtime, priceValue, catalog_uuid, product_uuid, unit_uuid, currency_uuid) VALUES (
  uuid_generate_v1(), 'Sword Art Online vol. 03 - price', 'product_sao_03_price_pieces', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 550.0,
  (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'),
  (SELECT uuid FROM PRODUCT WHERE code ='product_sao_03' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM UNIT WHERE code ='pieces' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM CURRENCY WHERE code = 'rub')
);

INSERT INTO PRICE(uuid, name, code, creationtime, modificationtime, priceValue, catalog_uuid, product_uuid, unit_uuid, currency_uuid) VALUES (
  uuid_generate_v1(), 'Sword Art Online vol. 04 - price', 'product_sao_04_price_pieces', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 550.0,
  (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'),
  (SELECT uuid FROM PRODUCT WHERE code ='product_sao_04' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM UNIT WHERE code ='pieces' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM CURRENCY WHERE code = 'rub')
);

INSERT INTO PRICE(uuid, name, code, creationtime, modificationtime, priceValue, catalog_uuid, product_uuid, unit_uuid, currency_uuid) VALUES (
  uuid_generate_v1(), 'Sword Art Online vol. 05 - price', 'product_sao_05_price_pieces', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 600.0,
  (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'),
  (SELECT uuid FROM PRODUCT WHERE code ='product_sao_05' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM UNIT WHERE code ='pieces' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM CURRENCY WHERE code = 'rub')
);

INSERT INTO PRICE(uuid, name, code, creationtime, modificationtime, priceValue, catalog_uuid, product_uuid, unit_uuid, currency_uuid) VALUES (
  uuid_generate_v1(), 'Sword Art Online vol. 06 - price', 'product_sao_06_price_pieces', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 600.0,
  (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'),
  (SELECT uuid FROM PRODUCT WHERE code ='product_sao_06' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM UNIT WHERE code ='pieces' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM CURRENCY WHERE code = 'rub')
);
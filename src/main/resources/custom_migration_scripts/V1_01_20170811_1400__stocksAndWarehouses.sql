INSERT INTO WAREHOUSE(uuid, name, code, creationtime, modificationtime, enabled, store_uuid) VALUES (
  uuid_generate_v1(), 'Warehouse 1', 'warehouse_1', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, TRUE ,
  (SELECT uuid FROM STORE WHERE code = 'default_store')
);

INSERT INTO WAREHOUSE(uuid, name, code, creationtime, modificationtime, enabled, store_uuid) VALUES (
  uuid_generate_v1(), 'Warehouse 2', 'warehouse_2', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, TRUE ,
  (SELECT uuid FROM STORE WHERE code = 'default_store')
);

INSERT INTO WAREHOUSE(uuid, name, code, creationtime, modificationtime, enabled, store_uuid) VALUES (
  uuid_generate_v1(), 'Warehouse 3', 'warehouse_3', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, FALSE ,
  (SELECT uuid FROM STORE WHERE code = 'default_store')
);

-- Warehouse warehouse_1 --

INSERT INTO STOCK(uuid, name, code, creationtime, modificationtime, product_count, warehouse_uuid, product_uuid, unit_uuid) VALUES (
  uuid_generate_v1(), 'Sword Art Online vol. 01 - pieces', 'stock_product_sao_01_pieces_01', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1000,
  (SELECT uuid FROM WAREHOUSE WHERE code = 'warehouse_1'),
  (SELECT uuid FROM PRODUCT WHERE code ='product_sao_01' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM UNIT WHERE code ='pieces' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'))
);

INSERT INTO STOCK(uuid, name, code, creationtime, modificationtime, product_count, warehouse_uuid, product_uuid, unit_uuid) VALUES (
  uuid_generate_v1(), 'Sword Art Online vol. 02 - pieces', 'stock_product_sao_02_pieces_01', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1000,
  (SELECT uuid FROM WAREHOUSE WHERE code = 'warehouse_1'),
  (SELECT uuid FROM PRODUCT WHERE code ='product_sao_02' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM UNIT WHERE code ='pieces' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'))
);

INSERT INTO STOCK(uuid, name, code, creationtime, modificationtime, product_count, warehouse_uuid, product_uuid, unit_uuid) VALUES (
  uuid_generate_v1(), 'Sword Art Online vol. 03 - pieces', 'stock_product_sao_03_pieces_01', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2500,
  (SELECT uuid FROM WAREHOUSE WHERE code = 'warehouse_1'),
  (SELECT uuid FROM PRODUCT WHERE code ='product_sao_03' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM UNIT WHERE code ='pieces' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'))
);

INSERT INTO STOCK(uuid, name, code, creationtime, modificationtime, product_count, warehouse_uuid, product_uuid, unit_uuid) VALUES (
  uuid_generate_v1(), 'Sword Art Online vol. 04 - pieces', 'stock_product_sao_04_pieces_01', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2500,
  (SELECT uuid FROM WAREHOUSE WHERE code = 'warehouse_1'),
  (SELECT uuid FROM PRODUCT WHERE code ='product_sao_04' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM UNIT WHERE code ='pieces' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'))
);

INSERT INTO STOCK(uuid, name, code, creationtime, modificationtime, product_count, warehouse_uuid, product_uuid, unit_uuid) VALUES (
  uuid_generate_v1(), 'Sword Art Online vol. 05 - pieces', 'stock_product_sao_05_pieces_01', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 3000,
  (SELECT uuid FROM WAREHOUSE WHERE code = 'warehouse_1'),
  (SELECT uuid FROM PRODUCT WHERE code ='product_sao_05' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM UNIT WHERE code ='pieces' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'))
);

INSERT INTO STOCK(uuid, name, code, creationtime, modificationtime, product_count, warehouse_uuid, product_uuid, unit_uuid) VALUES (
  uuid_generate_v1(), 'Sword Art Online vol. 06 - pieces', 'stock_product_sao_06_pieces_01', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 3000,
  (SELECT uuid FROM WAREHOUSE WHERE code = 'warehouse_1'),
  (SELECT uuid FROM PRODUCT WHERE code ='product_sao_06' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM UNIT WHERE code ='pieces' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'))
);

-- Warehouse 02 --
INSERT INTO STOCK(uuid, name, code, creationtime, modificationtime, product_count, warehouse_uuid, product_uuid, unit_uuid) VALUES (
  uuid_generate_v1(), 'Sword Art Online vol. 01 - pieces', 'stock_product_sao_01_pieces_02', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 30,
  (SELECT uuid FROM WAREHOUSE WHERE code = 'warehouse_2'),
  (SELECT uuid FROM PRODUCT WHERE code ='product_sao_01' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM UNIT WHERE code ='pieces' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'))
);

INSERT INTO STOCK(uuid, name, code, creationtime, modificationtime, enabled, product_count, warehouse_uuid, product_uuid, unit_uuid) VALUES (
  uuid_generate_v1(), 'Sword Art Online vol. 02 - pieces', 'stock_product_sao_02_pieces_02', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, false, 35,
  (SELECT uuid FROM WAREHOUSE WHERE code = 'warehouse_2'),
  (SELECT uuid FROM PRODUCT WHERE code ='product_sao_02' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM UNIT WHERE code ='pieces' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'))
);

-- Warehouse 03 --
INSERT INTO STOCK(uuid, name, code, creationtime, modificationtime, product_count, warehouse_uuid, product_uuid, unit_uuid) VALUES (
  uuid_generate_v1(), 'Sword Art Online vol. 01 - pieces', 'stock_product_sao_01_pieces_03', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 15,
  (SELECT uuid FROM WAREHOUSE WHERE code = 'warehouse_3'),
  (SELECT uuid FROM PRODUCT WHERE code ='product_sao_01' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM UNIT WHERE code ='pieces' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'))
);
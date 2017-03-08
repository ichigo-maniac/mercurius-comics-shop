INSERT INTO CATEGORY(uuid, name, code, creationtime, modificationtime, catalog_uuid) VALUES (
  uuid_generate_v1(), 'Catalog', 'catalog',
  CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')
);

INSERT INTO CATEGORY(uuid, name, code, creationtime, modificationtime, catalog_uuid, main_supercategory_uuid) VALUES (
  uuid_generate_v1(), 'Blu-ray discs', 'bluray',
  CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'),
  (SELECT uuid FROM CATEGORY WHERE code = 'catalog' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'))
);

INSERT INTO CATEGORY(uuid, name, code, creationtime, modificationtime, catalog_uuid, main_supercategory_uuid) VALUES (
  uuid_generate_v1(), 'Manga', 'manga',
  CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'),
  (SELECT uuid FROM CATEGORY WHERE code = 'catalog' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'))
);

INSERT INTO CATEGORY(uuid, name, code, creationtime, modificationtime, catalog_uuid, main_supercategory_uuid) VALUES (
  uuid_generate_v1(), 'Fantasy', 'manga_fantasy',
  CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'),
  (SELECT uuid FROM CATEGORY WHERE code = 'manga' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'))
);

INSERT INTO CATEGORY(uuid, name, code, creationtime, modificationtime, catalog_uuid, main_supercategory_uuid) VALUES (
  uuid_generate_v1(), 'Science fiction', 'manga_sci_fi',
  CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'),
  (SELECT uuid FROM CATEGORY WHERE code = 'manga' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'))
);

INSERT INTO CATEGORY(uuid, name, code, creationtime, modificationtime, catalog_uuid, main_supercategory_uuid) VALUES (
  uuid_generate_v1(), 'Ranobe', 'ranobe',
  CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'),
  (SELECT uuid FROM CATEGORY WHERE code = 'catalog' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'))
);

INSERT INTO CATEGORY(uuid, name, code, creationtime, modificationtime, catalog_uuid, main_supercategory_uuid) VALUES (
  uuid_generate_v1(), 'Fantasy', 'ranobe_fantasy',
  CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'),
  (SELECT uuid FROM CATEGORY WHERE code = 'ranobe' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'))
);

INSERT INTO CATEGORY(uuid, name, code, creationtime, modificationtime, catalog_uuid, main_supercategory_uuid) VALUES (
  uuid_generate_v1(), 'Science fiction', 'ranobe_sci_fi',
  CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'),
  (SELECT uuid FROM CATEGORY WHERE code = 'ranobe' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'))
);

INSERT INTO CATEGORIES_SUPERCATEGORIES_LINK(CATEGORY_UUID, SUPERCATEGORY_UUID) VALUES
(
  (SELECT uuid FROM CATEGORY WHERE code = 'bluray' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM CATEGORY WHERE code = 'catalog' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'))
);

INSERT INTO CATEGORIES_SUPERCATEGORIES_LINK(CATEGORY_UUID, SUPERCATEGORY_UUID) VALUES
(
  (SELECT uuid FROM CATEGORY WHERE code = 'manga' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM CATEGORY WHERE code = 'catalog' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'))
);

INSERT INTO CATEGORIES_SUPERCATEGORIES_LINK(CATEGORY_UUID, SUPERCATEGORY_UUID) VALUES
(
  (SELECT uuid FROM CATEGORY WHERE code = 'ranobe' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM CATEGORY WHERE code = 'catalog' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'))
);

INSERT INTO CATEGORIES_SUPERCATEGORIES_LINK(CATEGORY_UUID, SUPERCATEGORY_UUID) VALUES
(
  (SELECT uuid FROM CATEGORY WHERE code = 'ranobe_fantasy' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM CATEGORY WHERE code = 'ranobe' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'))
);

INSERT INTO CATEGORIES_SUPERCATEGORIES_LINK(CATEGORY_UUID, SUPERCATEGORY_UUID) VALUES
(
  (SELECT uuid FROM CATEGORY WHERE code = 'ranobe_sci_fi' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM CATEGORY WHERE code = 'ranobe' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'))
);

INSERT INTO CATEGORIES_SUPERCATEGORIES_LINK(CATEGORY_UUID, SUPERCATEGORY_UUID) VALUES
(
  (SELECT uuid FROM CATEGORY WHERE code = 'manga_fantasy' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM CATEGORY WHERE code = 'manga' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'))
);

INSERT INTO CATEGORIES_SUPERCATEGORIES_LINK(CATEGORY_UUID, SUPERCATEGORY_UUID) VALUES
(
  (SELECT uuid FROM CATEGORY WHERE code = 'manga_sci_fi' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM CATEGORY WHERE code = 'manga' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'))
);


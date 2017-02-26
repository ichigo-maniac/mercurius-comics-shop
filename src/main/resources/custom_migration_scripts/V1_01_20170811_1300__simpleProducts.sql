-- Products --

INSERT INTO BIG_STRING(uuid, name, code, creationtime, modificationtime, catalog_uuid, value) VALUES (
  uuid_generate_v1(), 'Sword Art Online vol. 01 description', 'product_sao_01_description', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
  (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'),
  'A solo player named Kirito, who had the luck-of-the-draw to once play the beta version of the first VRMMORPG, «Sword Art Online» (SAO) , was among the 10,000 players who were trapped inside of the game during the first day of its official service. The only way for them to escape is by clearing all the floors of Aincrad, the floating castle that is the setting for the game, and defeating the final boss. Death in-game means death in the real world, due to the NerveGear, a console that simulates the in-game character controls by redirecting brain signals. Two years after the start of the death game, out of the original ten thousand players at the start, less than seven thousand remain with twenty-five floors left to clear.'
);

INSERT INTO PRODUCT(uuid, name, code, creationtime, modificationtime, shortName, catalog_uuid, main_category_uuid, main_unit_uuid, description_uuid) VALUES (
  uuid_generate_v1(), 'Sword Art Online vol. 01', 'product_sao_01', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Reki Kawahara',
  (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'),
  (SELECT uuid FROM CATEGORY WHERE code ='ranobe_fantasy' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM UNIT WHERE code ='pieces' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM BIG_STRING WHERE code ='product_sao_01_description' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'))
);

INSERT INTO BIG_STRING(uuid, name, code, creationtime, modificationtime, catalog_uuid, value) VALUES (
  uuid_generate_v1(), 'Sword Art Online vol. 02 description', 'product_sao_02_description', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
  (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'),
  'Linked up and logged into the deadly VMMORPG ''Sword Art Online'' in both the real and virtual worlds, Kirito is stuck in a hell of one man''s making, and like everyone else, unable to escape until the game is beaten. But while some players are crippled by fear and others throw themselves into completing the game, still others relax into everyday life in the face of their cruel predicament and live to the best of their ability...laughing, crying, but always enjoying the game. Among them are four women who make a mark upon the solo adventurer that Kirito has become: Silica, the best tamer; Lisbeth, the blacksmith; Yui, the mysterious orphan; and the tragic Sachi, never to be forgotten by the black swordsman... '
);

INSERT INTO PRODUCT(uuid, name, code, creationtime, modificationtime, shortName, catalog_uuid, main_category_uuid, main_unit_uuid, description_uuid) VALUES (
  uuid_generate_v1(), 'Sword Art Online vol. 02', 'product_sao_02', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Reki Kawahara',
  (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'),
  (SELECT uuid FROM CATEGORY WHERE code ='ranobe_fantasy' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM UNIT WHERE code ='pieces' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM BIG_STRING WHERE code ='product_sao_02_description' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'))
);

INSERT INTO BIG_STRING(uuid, name, code, creationtime, modificationtime, catalog_uuid, value) VALUES (
  uuid_generate_v1(), 'Sword Art Online vol. 03 description', 'product_sao_03_description', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
  (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'),
  'Kirito returned from «Sword Art Online» (SAO), only to find that Asuna, as well as 300 other people, was still asleep, and has been seen in a new game, «ALfheim Online» (ALO).'
);

INSERT INTO PRODUCT(uuid, name, code, creationtime, modificationtime, shortName, catalog_uuid, main_category_uuid, main_unit_uuid, description_uuid) VALUES (
  uuid_generate_v1(), 'Sword Art Online vol. 03', 'product_sao_03', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Reki Kawahara',
  (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'),
  (SELECT uuid FROM CATEGORY WHERE code ='ranobe_fantasy' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM UNIT WHERE code ='pieces' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM BIG_STRING WHERE code ='product_sao_03_description' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'))
);

INSERT INTO BIG_STRING(uuid, name, code, creationtime, modificationtime, catalog_uuid, value) VALUES (
  uuid_generate_v1(), 'Sword Art Online vol. 04 description', 'product_sao_04_description', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
  (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'),
  'After thwarting the would-be assault on the Sylph-Cait Sith conference, Kirito and Leafa set out for Alne, towards the World Tree, only to be sidetracked by an event and end up in the underworld, «Jötunheimr». With some help from an unlikely ally, they reached the city only to find that the way to the World Tree was locked. In the end, Kirito saved Asuna. Several months later, they, along with other Sword Art Online (SAO) players began attending a special school for SAO survivors, and playing ALfheim Online, but with a new feature added to the game, New Aincrad. Kirito vowed to complete all 100 floors as they all flew toward the castle.'
);

INSERT INTO PRODUCT(uuid, name, code, creationtime, modificationtime, shortName, catalog_uuid, main_category_uuid, main_unit_uuid, description_uuid) VALUES (
  uuid_generate_v1(), 'Sword Art Online vol. 04', 'product_sao_04', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Reki Kawahara',
  (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'),
  (SELECT uuid FROM CATEGORY WHERE code ='ranobe_fantasy' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM UNIT WHERE code ='pieces' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM BIG_STRING WHERE code ='product_sao_04_description' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'))
);

INSERT INTO BIG_STRING(uuid, name, code, creationtime, modificationtime, catalog_uuid, value) VALUES (
  uuid_generate_v1(), 'Sword Art Online vol. 05 description', 'product_sao_05_description', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
  (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'),
  'Read the novel that sparked an international phenomenon! Kirito reenters the world of VRMMOs, this time logging in to Gun Gale Online in order to investigate the Death Gun, an in-game item rumored to be responsible for real-world deaths. He immediately runs into trouble when, after transferring his old avatar into the new game, he discovers that he looks a bit more feminine than he''d anticipated! With the help of Sinon the sniper, he enters the Bullet of Bullets tournament and tries to adapt his old skills to the new gun-based combat of Gun Gale Online. He''ll need every friend he can get and every trick in the book, though, to crack the mystery of the Phantom Bullet and learn the truth about the Death Gun! '
);

INSERT INTO PRODUCT(uuid, name, code, creationtime, modificationtime, shortName, catalog_uuid, main_category_uuid, main_unit_uuid, description_uuid) VALUES (
  uuid_generate_v1(), 'Sword Art Online vol. 05', 'product_sao_05', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Reki Kawahara',
  (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'),
  (SELECT uuid FROM CATEGORY WHERE code ='ranobe_fantasy' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM UNIT WHERE code ='pieces' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM BIG_STRING WHERE code ='product_sao_05_description' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'))
);

INSERT INTO BIG_STRING(uuid, name, code, creationtime, modificationtime, catalog_uuid, value) VALUES (
  uuid_generate_v1(), 'Sword Art Online vol. 06 description', 'product_sao_06_description', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
  (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'),
  'Kirito entered the finals of the Bullet of Bullets (BoB) tournament to find the truth about the mysterious Death Gun. Assisted by the sniper Sinon, he fought for his life and others to stop a mysterious but lethal force.'
);

INSERT INTO PRODUCT(uuid, name, code, creationtime, modificationtime, shortName, catalog_uuid, main_category_uuid, main_unit_uuid, description_uuid) VALUES (
  uuid_generate_v1(), 'Sword Art Online vol. 06', 'product_sao_06', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Reki Kawahara',
  (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'),
  (SELECT uuid FROM CATEGORY WHERE code ='ranobe_fantasy' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM UNIT WHERE code ='pieces' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog')),
  (SELECT uuid FROM BIG_STRING WHERE code ='product_sao_06_description' AND catalog_uuid = (SELECT uuid FROM SHOP_CATALOG WHERE code = 'master_catalog'))
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
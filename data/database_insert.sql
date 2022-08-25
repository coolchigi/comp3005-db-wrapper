PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;

DROP TABLE IF EXISTS stores;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS reviews;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS purchases;
DROP TABLE IF EXISTS favorite_products;
DROP TABLE IF EXISTS favorite_stores;
DROP TABLE IF EXISTS hasP;

CREATE TABLE stores(
sid integer not null,
store_name text not null,
store_location text not null,

primary key(sid)

);

CREATE TABLE products(
pid integer not NULL,
product_name text not null, 
stock_levels integer not null,
category text not null,
price real not null,
primary key(pid)
);


CREATE TABLE customers(
uid integer not null,
uName text not null,
uPassword text not null,

primary key(uid)
);

CREATE TABLE reviews(
reviews_id integer not null,
user_id integer not null,
item_id integer not null, 
rating integer not null,
feedback text not null, 

PRIMARY KEY(reviews_id),
FOREIGN KEY(user_id) REFERENCES customers(uid)

FOREIGN KEY(item_id) REFERENCES products(pid)
);


CREATE TABLE category(

category_id integer NOT NULL,

category_name text NOT NULL,

PRIMARY KEY(category_id),

FOREIGN KEY(category_id) REFERENCES products(pid)
);


CREATE TABLE purchases(
p_user_id integer not null,
item_id integer not null,
primary key (p_user_id,item_id ),

FOREIGN KEY(p_user_id) REFERENCES customers(uid)

FOREIGN KEY(item_id) REFERENCES products(pid)

);

CREATE TABLE favorite_stores(
user_id integer NOT NULL,
sid integer NOT NULL,
PRIMARY key(user_id, sid),
FOREIGN key(user_id ) REFERENCES customers(uid),
FOREIGN KEY(sid) REFERENCES stores(sid)
);


CREATE TABLE favorite_products(
user_id integer NOT NULL,

item_id integer NOT NULL,

PRIMARY KEY(user_id,item_id),
FOREIGN key(user_id ) REFERENCES customers(uid),
FOREIGN key(item_id ) REFERENCES products(pid)
);

CREATE TABLE hasP(
store_id integer not null,
product_id integer not null,
PRIMARY KEY(product_id,store_id),
FOREIGN key(product_id) REFERENCES products(pid),
FOREIGN key(store_id ) REFERENCES stores(sid)
);

INSERT INTO customers VALUES(0,"chimoney","by7sdnjnu");
INSERT INTO customers VALUES(1,"autardris","pcm8k2vqjg4y89bn");
INSERT INTO customers VALUES(2,"lexiser","ts3s9ttw3qr9t64r");
INSERT INTO customers VALUES(3,"lenalyla","zy9z4bbzsw996pqs");
INSERT INTO customers VALUES(4,"dylanwhiz","phfgrhs6zfc7nhbq");
INSERT INTO customers VALUES(5,"peteshawp","gugcqs6sc2h3zhe3");
INSERT INTO customers VALUES(6,"adebolaka","uAhyVG9dfd");
INSERT INTO customers VALUES(7,"mayormaya","j4K8M9pgB");
INSERT INTO customers VALUES(8,"justingu","NhrckxWyx");
INSERT INTO customers VALUES(9,"stephP","8XfW3FrvTL");
INSERT INTO customers VALUES(10,"shaliene2003","Cv87R9qVsH");
INSERT INTO customers VALUES(11,"shyguy2003","zz6hspqaKt");
INSERT INTO customers VALUES(12,"andrewpostle","VTcxrUvtXr");
INSERT INTO customers VALUES(13,"mikasmither","e42mdsjpA5");
INSERT INTO customers VALUES(14,"ameliashepp","WdWfLFGNkkcK");
INSERT INTO customers VALUES(15,"teddyparker304","W8myjPNJqrj9");
INSERT INTO customers VALUES(16,"Eren","JMQxQqcxpePAA");
INSERT INTO customers VALUES(17,"Mikasa","GXR48EY2");
INSERT INTO customers VALUES(18,"Jean","TvxUeXfT");
INSERT INTO customers VALUES(19,"Reiner","FqtTNatb");
INSERT INTO customers VALUES(20,"Connie","w2vZK6h4p");
INSERT INTO customers VALUES(21,"Fred","Qy5zGukEMpvG");
INSERT INTO customers VALUES(22,"Connie B","k3EFcGTpsxCZ");
INSERT INTO customers VALUES(23,"Kimberly","aP8jg5uz7DQV");
INSERT INTO customers VALUES(24,"Nova","qken52AJPA37");

INSERT INTO stores VALUES(29325090 
,"Loblaws","1460 Merivale Rd, Ottawa");
INSERT INTO stores VALUES(34203176 
,"CF Rideau Centre", "50 Rideau Street, Ottawa");
INSERT INTO stores VALUES(84917297 
,"Circle K", "1859 Carling Ave, Ottawa");
INSERT INTO stores VALUES(55784092,
"Walmart","1375 Baseline Rd, Ottawa");
INSERT INTO stores VALUES(67571314 
,"Dollarama","1050 Somerset St W, Ottawa");
INSERT INTO stores VALUES(17177718 
,"Winners", "40 King Street West, Toronto");
INSERT INTO stores VALUES(40281278 
,"St. Lawrence Market", "95 Front St E, Toronto");
INSERT INTO stores VALUES(08450400, 
"Sobeys", "22 Fort York Boulevard Toronto"), (01804568 , "Amazon", "Online"), (67901879, "Costco","1900 Cyrville Rd, Ottawa"), (15456503 
,"Best Buy", "380 Coventry Rd.
Ottawa, ON K1K2C6");

INSERT INTO hasP values(01804568,37394874),(01804568, 04294119), (01804568,35853359), (01804568, 37894672), (67571314,69589354), (67571314,33552240), (67571314,89166122), (67571314,22880688), (67571314,25349941), (67571314,51746700), (15456503,70160341);

INSERT INTO products VALUES (93910762
,"3.25% Milk",10 ,"Bread Bakery",2.17), (90309140 
, "Persil", 20, "Health & Personal Care", 19.99 ), (14041177 
, "Jordan MA2", 62, "Clothing & Accessories", 170), (86188427, 
"Apple Pencil(1st Generation)",5, "Electronics", 129.99), (54354066 
,"JBL Tune 510BT", 20, "Electronics", 49.99), (09671305, "Whitney II Boot", 18, "Clothing & Accessories", 134.96),
(33001878 , "5x AA Carbon Zinc Batteries Panasonic", 60, "Electronics", 1.25), (49579154, "Vortex Stereo Headphones", 18, "Electronics", 4.00), (80998585 ,"Optical USB Wireless Mouse", 12, "Electronics",4.00), (35381762, "Stereo Earbuds", 21, "Electronics", 1.25), (65381644, "Microsoft Go 3", 12, "Electronics", 599.99), (96675626, "Blue Light Blocking Glasses", 4, "Vision Care", 21.99),(09924536, "Cloth Mask", 5, "Health & Personal Care", 9.97), (04294119, "USB-A Female Adapter", 10, "Electronics", 9.99), (37394874, "Massage Gaming Chair", 20, "Furniture", 265.99),(22497024, "Floor Lamp, Corner Standing Lamp", 12, "Furniture", 79.99), (18162582 ,"Wise Owl Genuine Leather", 20, "Clothing & Accessories", 55.19),(60389069, "Deluxe Gourmet Cheese", 10, "Food", 179.99),(06002540, "Oreo Carrot Cake Sandwich Cookies", 10, "Food", 4.29),(68227675, "SOUR by Olivia Rodrigo", 20, "Music", 15.13), (35853359, "30 Vinyl by Adele", 10, "Music", 24.99), (42999308, "30 Vinyl by Adele", 10, "Music", 44.99), (37894672, "Nature Nectar Cheddar Cheese", 12, "Bread Bakery", 10.99), (79111789, "Natrel Fine-Filtered Fat-Free Skim Milk", 23, "Bread Bakery", 4.98), (44662568 , "Bakers Roses Enriched Flour", 15, "Bread Bakery", 29.95), (06472540 , "TIMBERLAND PREMIUM 6' WATERPROOF BOOT", 40, "Clothing & Accessories", 120),(53557642, "Logo Fanny Pack", 20, "Clothing & Accessories", 23.97 ), (71798231, "Massage Gaming Chair", 12, "Furniture", 199.00), (70160341, "Niall Horan: Hearbreak Weather(LP Vinyl)", 12, "Music", 44.88
), (53378826, "Foo Fighters: Wasting Light(Vinyl)", 13, "Music", 34.99
), (55598740, "The Beatles: The White Album(4 LP", 14, "Music", 159.99 
), (26224311, "The Beatles: The White Album(4 LP", 14, "Music", 189.99
),(78657953, "Adele: 25(Vinyl)",15,"Music", 40.36
),(33552240, "Rectangular Plastic Woven Basket (Assorted Colours)", 12, "Home", 4.00), (89166122, "Pokémon Trading Cards 4PK", 12, "Toys", 1.25 ), (69589354, "10' Cylindrical Clear Glass Vase", 12, "Home", 4.00 ), (22880688, "9L Storage Box with Cover
PLASTICO", 12, "Home", 3.50), (25349941, "Rectangular Floor Mat", 90, "Home", 4.00), (49416153, "Duct Tape - White GP", 30, "Hardware", 1.25 ), (51746700, "2' Paintbrush", 24, "Hardware", 1.25 );

--Amazon - Adapter, Massage

--opticalMouse, earbuds, Vortex, Batteires- dollarama


INSERT INTO category VALUES(47634891 
, "Electronics")
, (06055369, "Health & Personal"
), (19407578 
, "Clothing & Accessories");

INSERT INTO purchases VALUES(0,48211447), (1, 90309140 ), (2,14041177 );

INSERT INTO favorite_stores VALUES(0,
67571314), (0, 01804568), (1, 29325090),(1,01804568), (2,34203176), (2, 01804568),(3,84917297), (16, 15456503), (16, 01804568);

INSERT INTO favorite_products VALUES(0,09671305), (0,90309140) ,(1, 90309140), (1,53557642), (1,70160341), (2,70160341), (2,18162582), (16,80998585), (16, 33001878), (16,37394874), (17,14041177), (18, 22497024), (18, 18162582), (20,18162582), (20, 60389069), (20,06002540),(20,68227675),(20,06472540), (21,35853359), (21,26224311);
COMMIT;




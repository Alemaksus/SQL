-- 1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

use vk

-- Снабжение БД нужными таблицами:

DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название раздела',
  UNIQUE unique_name(name(10))
) COMMENT = 'Разделы интернет-магазина';

INSERT INTO catalogs VALUES
  (NULL, 'Процессоры'),
  (NULL, 'Материнские платы'),
  (NULL, 'Видеокарты'),
  (NULL, 'Жесткие диски'),
  (NULL, 'Оперативная память');
 
DROP TABLE IF EXISTS products;
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название',
  desription TEXT COMMENT 'Описание',
  price DECIMAL (11,2) COMMENT 'Цена',
  catalog_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_catalog_id (catalog_id)
);

INSERT INTO products
  (name, description, price, catalog_id)
VALUES
  ('Intel Core i3-8100', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 7890.00, 1),
  ('Intel Core i5-7400', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 12700.00, 1),
  ('AMD FX-8320E', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', 4780.00, 1),
  ('AMD FX-8320', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', 7120.00, 1),
  ('ASUS ROG MAXIMUS X HERO', 'Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX', 19310.00, 2),
  ('Gigabyte H310M S2H', 'Материнская плата Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX', 4790.00, 2),
  ('MSI B250M GAMING PRO', 'Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX', 5060.00, 2);
 
DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  user_id BIGINT(20) UNSIGNED NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_user_id(user_id),
  
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES users(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_catalog_id` FOREIGN KEY (`catalog_id`) REFERENCES catalogs(`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO orders VALUES
  (DEFAULT, 1, DEFAULT, DEFAULT),
  (DEFAULT, 1, DEFAULT, DEFAULT),
  (DEFAULT, 2, DEFAULT, DEFAULT);

INSERT INTO users VALUES
  (DEFAULT, 'Maks70', '1995-05-01', NOW(), NOW()),
  (DEFAULT, 'admin', '1989-01-01', NOW(), NOW()),
  (DEFAULT, 'Elena84', '2001-05-07', NOW(), NOW());

  
-- sql quiry:
 
SELECT u.name
FROM users AS u
INNER JOIN orders AS o ON (o.user_id = u.id)
GROUP BY u.name
HAVING COUNT(o.id) > 0;
  
-- 2. Выведите список товаров products и разделов catalogs, который соответствует товару.

SELECT p.name, c.name
FROM products AS p
INNER JOIN catalogs AS c ON (p.catalog_id = c.id)
GROUP BY p.id

-- 3. Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). Поля from, to и label содержат английские названия городов, поле name — русское. 
-- Выведите список рейсов flights с русскими названиями городов.

DROP DATABASE IF EXISTS flights_eschedule;
CREATE DATABASE flights_eschedule;
USE flights_eschedule;


CREATE TABLE cities (
	label VARCHAR(100) PRIMARY KEY,
	name VARCHAR(100) NOT NULL
);

INSERT INTO cities(label, name)
VALUE ('moscow','Москва'),('irkutsk','Иркутск'), ('novgorod','Новгород'),('kazan','Казань'), ('omsk','Омск');

CREATE TABLE flights (
	id SERIAL PRIMARY KEY,
	`from` VARCHAR(100) NOT NULL,
	`to` VARCHAR(100) NOT NULL,
	
	CONSTRAINT `fk_from` FOREIGN KEY (`from`) REFERENCES cities (`label`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `fk_to` FOREIGN KEY (`to`) REFERENCES cities (`label`) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO flights(`from`, `to`)
VALUE ('moscow','omsk'),('irkutsk','kazan'), ('irkutsk','moscow'),('omsk','irkutsk'), ('moscow','kazan');

SELECT C.name AS `from`, C1.name as `to`
FROM flights F
INNER JOIN cities C ON C.label = F.`from`
INNER JOIN cities C1 ON C1.label = F.`to`
ORDER BY F.id




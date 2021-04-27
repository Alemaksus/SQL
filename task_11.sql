-- 1. Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, 
-- catalogs и products в таблицу logs помещается время и дата создания записи, название таблицы,
-- идентификатор первичного ключа и содержимое поля name.

use shop;

DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
	created_at DATETIME NOT NULL,
	table_name VARCHAR(65) NOT NULL,
	str_id BIGINT(15) NOT NULL,
	name_value VARCHAR(45) NOT NULL
) ENGINE = ARCHIVE;

-- Trigger for users inserts:

DROP TRIGGER IF EXISTS watchlog_users;

delimiter //

CREATE TRIGGER watchlog_users AFTER INSERT ON users
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, str_id, name_value)
	VALUES (NOW(), 'users', NEW.id, NEW.name);
END //

-- Trigger for catalogs inserts:

DROP TRIGGER IF EXISTS watchlog_catalogs;

CREATE TRIGGER watchlog_catalogs AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, str_id, name_value)
	VALUES (NOW(), 'catalogs', NEW.id, NEW.name);
END //

-- Trigger for products inserts:

CREATE TRIGGER watchlog_products AFTER INSERT ON products
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, str_id, name_value)
	VALUES (NOW(), 'products', NEW.id, NEW.name);
END //

delimiter ;

-- 2. Создайте SQL-запрос, который помещает в таблицу users миллион записей.

-- Ответ: Я не понимаю как можно создать запрос не имея источника - это файл, другая БД или вообще процесс типа парсинга данных с внешнего сайта?
-- Если речь идет просто о процессе вставления миллиона пользователей в таблицу, то вероятно он мог бы быть циклом и выглядеть таким образом:


-- Сначало создадим тестовую таблицу, чтобы не было проблем со старыми данными:

DROP TABLE IF EXISTS test_users; 
CREATE TABLE test_users (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	birthday_at DATE,
	`created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
 	`updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Потом делаем процедуру insert users в виде цикла от 1 млн до 0. Например так: 

DROP PROCEDURE IF EXISTS insert_into_users ;
delimiter //
CREATE PROCEDURE insert_into_users ()
BEGIN
	DECLARE i INT DEFAULT 1000000;
	DECLARE j INT DEFAULT 0;
	WHILE i > 0 DO
		INSERT INTO test_users(name, birthday_at) VALUES (CONCAT('user_', j), NOW());
		SET j = j + 1;
		SET i = i - 1;
	END WHILE;
END //
delimiter ;
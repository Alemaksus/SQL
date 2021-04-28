USE povar;

-- 1. Триггер увеличения счетчика photos таблицы users при добавлении строки таблицы photos:

DROP TRIGGER IF EXISTS users_photos_insert;
DELIMITER //
CREATE TRIGGER users_photos_insert BEFORE INSERT ON photos
FOR EACH ROW
BEGIN
	SET @us = NEW.user_id;
	SET @total = (SELECT photos FROM users WHERE id = @us);
	UPDATE users SET photos = @total + 1 WHERE id = @us;
END //
DELIMITER ;

-- 2. Триггер уменьшения счетчика photos таблицы users при удалении строки таблицы photos:

DROP TRIGGER IF EXISTS users_photos_delete;
DELIMITER //
CREATE TRIGGER users_photos_delete BEFORE DELETE ON photos
FOR EACH ROW
BEGIN
	SET @us = OLD.user_id;
	SET @total = (SELECT photos FROM users WHERE id = @us);
	UPDATE users SET photos = @total - 1 WHERE id = @us;
END //
DELIMITER ;

-- 3. Триггер увеличения счетчика friends таблицы users при добавлении строки таблицы friends:

DROP TRIGGER IF EXISTS users_friends_insert;
DELIMITER //
CREATE TRIGGER users_friends_insert BEFORE INSERT ON friends
FOR EACH ROW
BEGIN
	SET @us = NEW.user_id;
	SET @total = (SELECT friends FROM users WHERE id = @us);
	UPDATE users SET friends = @total + 1 WHERE id = @us;
END //
DELIMITER ;

-- 4. Триггер уменьшения счетчика friends таблицы users при удалении строки таблицы friends:

DROP TRIGGER IF EXISTS users_friends_delete;
DELIMITER //
CREATE TRIGGER users_friends_delete BEFORE DELETE ON friends
FOR EACH ROW
BEGIN
	SET @us = OLD.user_id;
	SET @total = (SELECT friends FROM users WHERE id = @us);
	UPDATE users SET friends = @total - 1 WHERE id = @us;
END //
DELIMITER ;

-- 5. Триггер увеличения счетчика likes таблицы users при добавлении строки таблицы likes:

DROP TRIGGER IF EXISTS users_likes_insert;
DELIMITER //
CREATE TRIGGER users_likes_insert BEFORE INSERT ON likes
FOR EACH ROW
BEGIN
	SET @us = NEW.user_id;
	SET @total = (SELECT likes FROM users WHERE id = @us);
	UPDATE users SET likes = @total + 1 WHERE id = @us;
END //
DELIMITER ;

-- 6. Триггер уменьшения счетчика likes таблицы users при удалении строки таблицы likes:

DROP TRIGGER IF EXISTS users_likes_delete;
DELIMITER //
CREATE TRIGGER users_likes_delete BEFORE DELETE ON likes
FOR EACH ROW
BEGIN
	SET @us = OLD.user_id;
	SET @total = (SELECT likes FROM users WHERE id = @us);
	UPDATE users SET likes = @total - 1 WHERE id = @us;
END //
DELIMITER ;

-- 7. Триггер увеличения счетчика messages таблицы users при добавлении строки таблицы messages:

DROP TRIGGER IF EXISTS users_messages_insert;
DELIMITER //
CREATE TRIGGER users_messages_insert BEFORE INSERT ON messages
FOR EACH ROW
BEGIN
	SET @us = NEW.from_user_id;
	SET @total = (SELECT messages FROM users WHERE id = @us);
	UPDATE users SET messages = @total + 1 WHERE id = @us;
END //
DELIMITER ;

-- 8. Триггер уменьшения счетчика messages таблицы users при удалении строки таблицы messages:

DROP TRIGGER IF EXISTS users_messages_delete;
DELIMITER //
CREATE TRIGGER users_messages_delete BEFORE DELETE ON messages
FOR EACH ROW
BEGIN
	SET @us = OLD.from_user_id;
	SET @total = (SELECT messages FROM users WHERE id = @us);
	UPDATE users SET messages = @total - 1 WHERE id = @us;
END //
DELIMITER ;

-- 9. Триггер увеличения счетчика recipes таблицы users при добавлении строки таблицы recipes:

DROP TRIGGER IF EXISTS users_recipes_insert;
DELIMITER //
CREATE TRIGGER users_recipes_insert BEFORE INSERT ON recipes
FOR EACH ROW
BEGIN
	SET @us = NEW.user_id;
	SET @total = (SELECT recipes FROM users WHERE id = @us);
	UPDATE users SET recipes = @total + 1 WHERE id = @us;
END //
DELIMITER ;

-- 10. Триггер уменьшения счетчика recipes таблицы users при удалении строки таблицы recipes:

DROP TRIGGER IF EXISTS users_recipes_delete;
DELIMITER //
CREATE TRIGGER users_recipes_delete BEFORE DELETE ON recipes
FOR EACH ROW
BEGIN
	SET @us = OLD.user_id;
	SET @total = (SELECT recipes FROM users WHERE id = @us);
	UPDATE users SET recipes = @total - 1 WHERE id = @us;
END //
DELIMITER ;

USE povar;

INSERT INTO menus(user_id, recipes_id) VALUES
(2, 49), (2, 78), (2, 115), (2, 207);

-- 1. Процедура расчета списка покупок на выбранные рецепты на выбранное количество порций:

DROP PROCEDURE IF EXISTS shopping_list;
DELIMITER //
CREATE PROCEDURE shopping_list(IN por INT)
BEGIN 
	-- создаем временную таблицу для агрегированния данных 
	CREATE TEMPORARY TABLE menu
	SELECT r.id id, 
		r.name recipe,
		round(sum(i.quantity)/c.portion, 1) portion
	FROM 
		recipes r
 		JOIN ingredients i ON r.id = i.recipes_id
 		JOIN categories c ON r.category_id = c.id
		JOIN menus m ON m.recipes_id = r.id
	GROUP BY 
		r.name;
	-- вывод агрегированных данных с учетом параметра por
	SELECT  f.name, round(sum(i.quantity / m.portion * por), 1) total 
	FROM ingredients i
		JOIN menu m ON i.recipes_id = m.id
		JOIN foods f ON i.food_id = f.id
 	GROUP BY
	 	i.food_id
	ORDER BY 
		total DESC;
	-- удаление временной таблицы
	DROP TABLE IF EXISTS menu;
END//
DELIMITER ;

CALL shopping_list(4);

-- 2. Процедура формирования облака 20 часто используемых основных продуктов рецептов:

DROP PROCEDURE IF EXISTS basic_food;
DELIMITER //
CREATE PROCEDURE basic_food()
BEGIN 
	SELECT f.name, count(i.recipes_id) num FROM ingredients i 
		JOIN foods f ON i.food_id = f.id
	WHERE i.basic IS TRUE
	GROUP BY i.food_id
	ORDER BY num DESC
	LIMIT 20;
END//
DELIMITER ;

CALL basic_food();

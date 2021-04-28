USE povar;

-- 1. View объединяющее таблицы: users, profiles & countries: 

DROP VIEW IF EXISTS fool_users;
CREATE VIEW fool_users AS 
	SELECT u.id, u.username, u.email, p.gender, p.birthday, c.name AS country, p.created 
	FROM users u
		JOIN profiles p ON u.id = p.user_id
		JOIN countries c ON p.country_id = c.id;
		
SELECT * FROM fool_users WHERE email RLIKE '^i.*' ORDER BY created;
SELECT concat('Средний возраст аудитории сайта - ', round(avg(timestampdiff (YEAR, birthday, now())))) AS average_age FROM fool_users;

-- 2. View расчитывающее количество порций в рецепте с id = 78 из подчиненной таблицы ingredients:

DROP VIEW IF EXISTS index_portion;
CREATE VIEW index_portion AS 
	SELECT DISTINCT r.id AS id, round((sum(quantity)/ c.portion), 1) AS portion 
		FROM ingredients i 
		JOIN recipes r ON i.recipes_id = r.id
		JOIN categories c ON r.category_id = c.id
	GROUP BY r.id;

SELECT * FROM index_portion WHERE id = 78;

-- 3. View расчет продуктов для рецепта с id = 78 на 1 порцию:

DROP VIEW IF EXISTS recipe_one_person;
CREATE VIEW recipe_one_person AS
	SELECT i.recipes_id AS recipe, f.name AS food, round((i.quantity / ip.portion), 1) quantity FROM ingredients i
		JOIN index_portion ip ON i.recipes_id = ip.id
		JOIN foods f ON i.food_id = f.id;
	
SELECT * FROM recipe_one_person WHERE recipe = 78;

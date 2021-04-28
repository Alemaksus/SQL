DROP DATABASE IF EXISTS povar;

CREATE DATABASE povar;
USE povar;

CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(100) NOT NULL,
  email VARCHAR(120) NOT NULL UNIQUE,
  photos INT NOT NULL DEFAULT 0,
  friends INT NOT NULL DEFAULT 0,
  likes INT NOT NULL DEFAULT 0,
  messages INT NOT NULL DEFAULT 0,
  recipes INT NOT NULL DEFAULT 0
)COMMENT = 'Пользователи, их фото, друзья, лайки, сообщения и рецепты - для ускорения чтения таблицы';

CREATE TABLE profiles (
  user_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,	
  gender CHAR(1) NOT NULL,
  birthday DATE,
  country_id INT UNSIGNED NOT NULL,
  photo_id INT UNSIGNED,
  created DATETIME DEFAULT NOW(),
  updated DATETIME DEFAULT NOW() ON UPDATE NOW()  
)COMMENT = 'Профиль пользователя';

CREATE TABLE categories (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	portion INT UNSIGNED NOT NULL
) COMMENT = 'тип рецепта: горячие блюда, супы, салаты и пр';

CREATE TABLE continents (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
	name VARCHAR(255) NOT NULL
) COMMENT = 'Континенты';

CREATE TABLE countries (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	continent_id INT UNSIGNED NOT NULL
) COMMENT = 'Страны';

ALTER TABLE countries 
	ADD CONSTRAINT country_continent_id_fk 
		FOREIGN KEY (continent_id) REFERENCES continents(id);
	
CREATE TABLE foods (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	calories FLOAT(5, 1) NOT NULL,
	protein FLOAT(5, 1) NOT NULL,
	fats FLOAT(5, 1) NOT NULL,
	carb FLOAT(5, 1) NOT NULL
) COMMENT = 'Продукты';

CREATE TABLE photos (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	user_id INT UNSIGNED NOT NULL,
	filename VARCHAR(255) NOT NULL,
	filesize INT NOT NULL,
	created DATETIME DEFAULT NOW()
)COMMENT = 'Каталог фото';

ALTER TABLE profiles 
ADD CONSTRAINT profiles_user_id_fk 
	FOREIGN KEY (user_id) REFERENCES users(id),
ADD CONSTRAINT profiles_country_id_fk 
	FOREIGN KEY (country_id) REFERENCES countries(id),
ADD CONSTRAINT profiles_photo_id_fk 
	FOREIGN KEY (photo_id) REFERENCES photos(id); 

ALTER TABLE photos 
ADD CONSTRAINT photo_user_id_fk 
	FOREIGN KEY (user_id) REFERENCES users(id);

CREATE TABLE recipes (
id INT UNSIGNED UNIQUE NOT NULL AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255) NOT NULL, 
country_id INT UNSIGNED NOT NULL, 
category_id INT UNSIGNED NOT NULL, 
user_id INT UNSIGNED NOT NULL, 
process_cook TEXT, 
time_cook TIME DEFAULT '00:00:00',
photo_id INT UNSIGNED UNSIGNED DEFAULT 0, 
created DATETIME DEFAULT NOW(),
updated DATETIME DEFAULT NOW() ON UPDATE NOW() 
)COMMENT = 'Каталог рецептов';

ALTER TABLE recipes
ADD CONSTRAINT recipes_country_id_fk 
	FOREIGN KEY (country_id) REFERENCES countries(id),
ADD CONSTRAINT recipes_category_id_fk 
	FOREIGN KEY (category_id) REFERENCES categories(id),
ADD CONSTRAINT recipes_user_id_fk 
	FOREIGN KEY (user_id) REFERENCES users(id),
ADD CONSTRAINT recipes_photo_id_fk 
	FOREIGN KEY (photo_id) REFERENCES photos(id);

CREATE TABLE menus (
id SERIAL PRIMARY KEY,
user_id INT UNSIGNED NOT NULL,
recipes_id INT UNSIGNED NOT NULL
)COMMENT = 'Таблица составления меню';

ALTER TABLE menus
ADD CONSTRAINT menus_recipes_id_fk 
	FOREIGN KEY (recipes_id) REFERENCES recipes(id),
ADD CONSTRAINT menus_user_id_fk
	FOREIGN KEY (user_id) REFERENCES users(id);

CREATE TABLE ingredients (
recipes_id INT UNSIGNED NOT NULL,
food_id INT UNSIGNED NOT NULL,
quantity INT UNSIGNED NOT NULL,
basic BOOL 
)COMMENT = 'Таблица расчета ингридиентов';

ALTER TABLE ingredients
ADD CONSTRAINT ingredients_recipes_id_fk 
	FOREIGN KEY (recipes_id) REFERENCES recipes(id),
ADD CONSTRAINT ingredients_food_id_fk 
	FOREIGN KEY (food_id) REFERENCES foods(id);

CREATE TABLE friend_statuses (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL
 )COMMENT = 'Статусы друзей';

CREATE TABLE friends (
  user_id INT UNSIGNED NOT NULL,
  friend_id INT UNSIGNED NOT NULL,
  status_id INT UNSIGNED NOT NULL,
  created DATETIME DEFAULT NOW(),
  updated DATETIME DEFAULT NOW() ON UPDATE NOW()
)COMMENT = 'Друзья';

ALTER TABLE friends
ADD CONSTRAINT friends_friend_id_fk 
	FOREIGN KEY (friend_id) REFERENCES users(id),
ADD CONSTRAINT friends_user_id_fk 
	FOREIGN KEY (user_id) REFERENCES users(id),
ADD CONSTRAINT friends_ustatus_id_fk 
	FOREIGN KEY (status_id) REFERENCES friend_statuses(id);

CREATE TABLE messages (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  from_user_id INT unsigned NOT NULL,
  to_user_id INT unsigned NOT NULL,
  body TEXT NOT NULL,
  is_important TINYINT(1) DEFAULT NULL,
  is_delivered TINYINT(1) DEFAULT NULL,
  created_at DATETIME DEFAULT NOW()
)COMMENT = 'Каталог сообщений';

ALTER TABLE messages
ADD CONSTRAINT messages_from_user_id_fk 
	FOREIGN KEY (from_user_id) REFERENCES users(id),
ADD CONSTRAINT messages_to_user_id_fk 
	FOREIGN KEY (to_user_id) REFERENCES users(id);

CREATE TABLE likes (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  pecipe_id INT UNSIGNED NOT NULL,
  created_at DATETIME DEFAULT NOW()
)COMMENT = 'Таблица лайков';

ALTER TABLE likes
ADD CONSTRAINT likes_user_id_fk 
	FOREIGN KEY (user_id) REFERENCES users(id),
ADD CONSTRAINT likes_pecipe_id_fk 
	FOREIGN KEY (pecipe_id) REFERENCES recipes(id);

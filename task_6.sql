-- 1. Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.

USE vk;

-- Мой неверный вариант:

-- SELECT count(*) mess, friend FROM 

	-- (SELECT initiator_user_id FROM friend_requests WHERE target_user_id = 1 AND status='approved')
  	-- union
	-- (SELECT target_user_id FROM friend_requests WHERE initiator_user_id = 1 AND status='approved')

-- WHERE

	-- (SELECT body, to_user_id AS mess_to FROM messages WHERE from_user_id = 5 AND confirmed_at IS NOT NULL 
	-- AND status IS NOT NULL) 
	-- UNION
	-- (SELECT body, from_user_id AS mess_from FROM messages WHERE to_user_id = 5 AND confirmed_at IS NOT NULL 
	-- AND status IS NOT NULL)

-- GROUP BY friend
-- ORDER BY mess DESC
-- LIMIT 3;

-- Верный вариант от Юрия:
USE vk

SELECT
	m.from_user_id,
	(SELECT CONCAT(lastname, ' ', firstname) FROM users WHERE id=m.from_user_id) as name,
	count(*) AS cnt
FROM messages m 	
WHERE m.to_user_id=1 AND from_user_id IN (
select initiator_user_id from friend_requests where (target_user_id = 1) AND status='approved'
union 
select target_user_id from friend_requests where (initiator_user_id = 1) AND status='approved'
)

GROUP  BY m.from_user_id 
ORDER BY cnt desc 
LIMIT 1;

-- 2. Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.

-- Мой вариант (нашел кто ставил, а нужно кого лайкали): 

-- SELECT COUNT(id) FROM likes AS sum_young_likes WHERE user_id IN (
    -- SELECT user_id FROM profiles 
    -- )
-- ORDER BY birthday 
-- DESC LIMIT 10;

-- Верный вариант:

SELECT COUNT(*) -- кол-во лайков
FROM likes
WHERE media_id in ( -- все медиа записи таких пользователей
	SELECT id 
	FROM media
	WHERE user_id IN ( -- все пользователи младше 18 лет
		SELECT 
			user_id
		--  , birthdat
		FROM profiles AS p
		WHERE TIMESTAMPDIFF(YEAR, birthday, NOW()) < 10)
);
	  
-- 3. Определить кто больше поставил лайков (всего) - мужчины или женщины?

-- Мой вариант

-- SELECT IF(
-- 	(SELECT COUNT(*) FROM LIKES WHERE user_id IN (
-- 		SELECT user_id FROM profiles WHERE gender = "m")
-- 	) 
-- 	> 
-- 	(SELECT COUNT(*) FROM LIKES WHERE user_id IN (
-- 		SELECT user_id FROM profiles WHERE gender = "f")
-- 	), 
--    'больше лайков было у мужчин', 'больше лайков было у женщин');
  
-- Вариант с вложенными запросами и количеством лайков:
  
select 
	gender,
	count(*)
from (
	select
		user_id as user,
		(
			select gender 
			from vk.profiles p 
			where user_id = user 
		) as gender 
	from likes
) as dummy
group by gender;	 
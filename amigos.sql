
SELECT  user_id, users.first_name, users.last_name, friend_id, users2.first_name, users2.last_name
FROM friendships
LEFT JOIN users on friendships.user_id = users.id
LEFT JOIN users AS users2 ON friendships.friend_id = users2.id

-- 1

select users.first_name, users.last_name
from friendships
LEFT JOIN users on friendships.user_id = users.id
LEFT JOIN users AS users2 ON friendships.friend_id = users2.id
where users2.first_name = 'Kermit'

-- 2
select users.first_name, COUNT(users2.first_name) as Numero_Amistades
from friendships
LEFT JOIN users on friendships.user_id = users.id
LEFT JOIN users AS users2 ON friendships.friend_id = users2.id
group by users.first_name
-- 3



-- 4

INSERT INTO users (first_name, last_name)
VALUES ('Anita', 'Bustos')

INSERT INTO friendships (user_id, friend_id)
VALUES (6, 2)
INSERT INTO friendships (user_id, friend_id)
VALUES (6, 4)
INSERT INTO friendships (user_id, friend_id)
VALUES (6, 5)

-- 5
SELECT  user_id, users.first_name, users.last_name, friend_id, users2.first_name, users2.last_name
FROM friendships
LEFT JOIN users on friendships.user_id = users.id
LEFT JOIN users AS users2 ON friendships.friend_id = users2.id
where users.id = 2
order by users2.first_name asc

-- 6 

delete from friendships where id = 5

-- 7


SELECT users.first_name, users.last_name, users2.first_name, users2.last_name
FROM friendships
LEFT JOIN users on friendships.user_id = users.id
LEFT JOIN users AS users2 ON friendships.friend_id = users2.id


select * from friendships
select * from users
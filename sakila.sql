-- 1
SELECT address.city_id, city.city, customer.first_name, customer.last_name, customer.email, address.address
 FROM address
 inner join customer on customer.address_id = address.address_id
 inner join city on city.city_id = address.city_id
 where address.city_id = 312;

2 -- 

SELECT film.title, film.description, film.release_year, film.rating, film.special_features, category.name AS genre
FROM film 
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id 
WHERE category.name = 'Comedy'

-- 3
 
 SELECT film.title, film.description, film.release_year
FROM film 
JOIN film_actor ON film.film_id = film_actor.film_id 
WHERE film_actor.actor_id = 5

-- 4

SELECT customer.first_name, customer.last_name, customer.email, address.address, city.city_id, store.store_id
FROM customer
JOIN store ON customer.store_id = store.store_id 
JOIN address ON customer.address_id = address.address_id 
JOIN city ON address.city_id = city.city_id
WHERE store.store_id = 1 AND city.city_id IN (1, 42, 312, 459)

-- 5

SELECT film.title, film.description, film.release_year, film.rating, film.special_features
FROM film
WHERE film.rating = "G" AND film.special_features LIKE 'behind the scenes'

-- 6 

SELECT film.film_id, film.title, actor.actor_id, actor.first_name, actor.last_name 
FROM film 
JOIN film_actor ON film.film_id = film_actor.film_id 
JOIN actor ON film_actor.actor_id = actor.actor_id 
WHERE film.film_id = 369

-- 7 

SELECT film.title, film.description, film.release_year, film.rating, film.special_features, category.name AS genre, film.rental_rate
FROM film 
JOIN film_category ON film.film_id = film_category.film_id 
JOIN category ON film_category.category_id = category.category_id 
WHERE film.rental_rate = 2.99 AND category.name = 'Drama'

-- 8 

SELECT film.title, film.description, film.release_year, film.rating, film.special_features, category.name AS genre, actor.first_name, actor.last_name 
FROM film 
JOIN film_category ON film.film_id = film_category.film_id 
JOIN category ON film_category.category_id = category.category_id 
JOIN film_actor ON film.film_id = film_actor.film_id 
JOIN actor ON film_actor.actor_id = actor.actor_id
WHERE category.name = 'Action' AND actor.first_name = 'SANDRA' AND actor.last_name = 'KILMER'

-- Find actors who acted in film "Lost Bird
SELECT concat(first_name, ' ',last_name)
from actor a 
join film_actor f on a.actor_id=f.actor_id
join film c on f.film_id=c.film_id
where c.title='LOST BIRD'

-- Find movies of "Sci-Fi" genre
SELECT title,
from film f
join film_category fc on f.film_id = fc.film_id
join category c on fc.category_id=c.category_id
where c.name like'%Sci-Fi%';



-- Find movies of actress 
	-- first_name: "PENELOPE"	
	-- last_name:"GUINESS"
SELECT title
from film a 
join film_actor f on a.film_id=f.film_id
join actor c on f.actor_id=c.actor_id
where c.first_name='PENELOPE' and last_name ='GUINESS'

-- list Genres, movies (in each Genre), actors in each movie
select a.first_name,a.last_name,f.title,c.name 
from actor a
join film_actor fa on a.actor_id = fa.actor_id
join film f on fa.film_id=f.film_id 
join film_category fc on f.film_id = fc.film_id 
join category c on fc.category_id=c.category_id 


-- List films that are rented from inventory
SELECT distinct title
from film f 
join inventory i on f.film_id=i.film_id
order by title
-- List genres corresponding movies rented by customer
SELECT c.name AS genre, f.title AS film_title, cu.first_name || ' ' || cu.last_name AS name
FROM inventory i
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
JOIN customer cu ON r.customer_id = cu.customer_id
ORDER BY c.name, f.title;

-- List 5 rows of customer which have renated "Horror" generes.

SELECT DISTINCT ON (c.customer_id) c.customer_id, c.first_name || ' ' || c.last_name AS customer_name
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c2 ON fc.category_id = c2.category_id
WHERE c2.name = 'Horror'
ORDER BY c.customer_id, r.rental_date
LIMIT 5;


-- List 5 staff members who have given maximum movies on rent (best performers)
SELECT s.staff_id, CONCAT(s.first_name, ' ', s.last_name) AS staff_name, COUNT(r.rental_id) AS rental_count
FROM staff s
JOIN rental r ON s.staff_id = r.staff_id
GROUP BY s.staff_id
ORDER BY rental_count DESC
LIMIT 5;
-- List top movies types Genre (by count) rented by customers.
SELECT c.name AS genre_name, COUNT(r.rental_id) AS rental_count
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY rental_count DESC;

-- List top movies (by count) by Genre (by count) in the inventory
SELECT c.name AS genre_name, f.title AS movie_title, COUNT(i.inventory_id) AS inventory_count
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
JOIN inventory i ON f.film_id = i.film_id
GROUP BY c.name, f.title
ORDER BY COUNT(i.inventory_id) DESC, c.name, f.title
limit 10;

-- List of actors who have not acted in any flim.
SELECT concat(first_name, ' ',last_name)
from actor a 
left join film_actor f on a.actor_id=f.actor_id
where f.film_id is null;

-- List of films that are not in inventory
select title 
from film f 
left join inventory i on f.film_id= i.film_id
where i.inventory_id is null;

-- List of actors who are not in inventory

SELECT a.actor_id, concat(first_name,' ',last_name) as name
FROM actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
LEFT JOIN inventory i ON fa.film_id = i.film_id
WHERE i.film_id IS NULL;

--  List of actors whose movies are not stores.
SELECT a.actor_id, a.first_name
FROM actor a
INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
INNER JOIN (
  SELECT DISTINCT i.film_id
  FROM inventory i
) i ON fa.film_id = i.film_id
LEFT JOIN (
  SELECT DISTINCT s.store_id, i.film_id
  FROM inventory i
  INNER JOIN store s ON i.store_id = s.store_id
) si ON fa.film_id = si.film_id
WHERE si.store_id IS NULL;

-- List of staff who have not rented movies.
SELECT s.staff_id, s.first_name
FROM staff s
LEFT JOIN rental r ON s.staff_id = r.staff_id
WHERE r.rental_id IS NULL;

-- categories which do not have movies.
SELECT c.category_id, c.name
FROM category c
LEFT JOIN film_category fc ON c.category_id = fc.category_id
WHERE fc.film_id IS NULL;

-- Actors who acted in all movie categories
SELECT a.actor_id, a.first_name,a.last_name
FROM actor a
INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
INNER JOIN film_category fc ON fa.film_id = fc.film_id
INNER JOIN category c ON fc.category_id = c.category_id
GROUP BY a.actor_id, a.first_name
HAVING COUNT(DISTINCT c.category_id) = (SELECT COUNT(*) FROM category);

-- Actors who did NOT act in all movie categories
SELECT a.actor_id, a.first_name,a.last_name
FROM actor a
INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
INNER JOIN film_category fc ON fa.film_id = fc.film_id
INNER JOIN category c ON fc.category_id = c.category_id
GROUP BY a.actor_id, a.first_name
HAVING COUNT(DISTINCT c.category_id) < (SELECT COUNT(*) FROM category);

-- List of stores with address, city, countries.
SELECT store_id, address, address2, city, country
FROM store
JOIN address ON store.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id;

 -- List of stores that do not have inventory.
select 	s.store_id
from store s
left join inventory i on s.store_id = i.store_id
where i.inventory_id is null;

-- List of customers who do not have movie rentals.
select 	c.customer_id,first_name
from customer c
left join rental r on c.customer_id = r.customer_id
where r.rental_id is null;

-- List of Customers in India with address.
SELECT customer_id, first_name, address, address2, city, country
FROM customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
WHERE country.country  like'%India%';

-- List of Customers with address all over the world.
SELECT customer_id, first_name, address, address2, city, country
FROM customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id

-- List of movies made in Japanese or Mandarin.
SELECT film_id, title, name AS language
FROM film
JOIN language ON film.language_id = language.language_id
WHERE language.name IN ('Japanese', 'Mandarin');

-- List of languages with no movies.
SELECT language.name AS language
FROM language
LEFT JOIN film ON language.language_id = film.language_id
WHERE film.film_id IS NULL;
















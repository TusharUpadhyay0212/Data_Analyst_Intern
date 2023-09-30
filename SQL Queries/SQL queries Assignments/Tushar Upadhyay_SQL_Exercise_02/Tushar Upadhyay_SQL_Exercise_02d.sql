-- Count of movies acted by actor with actor list in descending order (by count of movies acted).
SELECT a.actor_id, a.first_name,a.last_name,COUNT(*) AS "Movie Count"
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
GROUP BY a.actor_id, a.first_name
ORDER BY "Movie Count" DESC;

-- Which actor has highest "Average movie rating
SELECT a.actor_id, a.first_name,a.last_name, count(f.rating) AS "Average Rating"
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
GROUP BY a.actor_id, a.first_name
ORDER BY "Average Rating" DESC
LIMIT 1;

-- Count of movies per language
select l.name,count(f.title) as movies
from language l
join film f on f.language_id = l.language_id 
group by l.name
order by movies 

-- How many movies of same film are stored in each store
SELECT store.store_id, film.title, COUNT(inventory.film_id) AS movie_count
FROM store
JOIN inventory ON inventory.store_id = store.store_id
JOIN film ON film.film_id = inventory.film_id
GROUP BY store.store_id, film.title;
-- How many unique movies in each store.
SELECT store.store_id, COUNT(DISTINCT inventory.film_id) AS unique_movie_count
FROM store
JOIN inventory ON inventory.store_id = store.store_id
GROUP BY store.store_id;

-- Average length of movies.
select avg(length)
from film 

-- Which language movies are longest
SELECT language.name, max(film.length) AS max_length
FROM language
JOIN film ON film.language_id = language.language_id
GROUP BY language.name
ORDER BY max_length DESC
LIMIT 1;

-- Which language movies have highest rating
SELECT language.name, count(rating) as rating 
FROM language
JOIN film ON film.language_id = language.language_id
GROUP BY language.name
ORDER BY rating DESC 
LIMIT 1;

-- Count of movies by category
SELECT category.name, COUNT(film_category.film_id) AS film
FROM category
JOIN film_category ON film_category.category_id = category.category_id
GROUP BY category.name
order by film desc;

-- Top 3 actors who worked in horror movies
select a.actor_id,a.first_name,a.last_name,COUNT(*) AS number
from actor a
join film_actor fa on a.actor_id=fa.actor_id 
join film_category fc on fa.film_id =fc.film_id 
join category c on fc.category_id = c.category_id
where c.name like'%Horror%'
group by a.actor_id
order by number
limit 3;

-- Top 3 actors who acted in action or romantic movies.
SELECT a.actor_id, a.first_name, a.last_name, COUNT(*) AS num_movies
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film_category fc ON fa.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE c.name='Action' or c.name='Romantic'
GROUP BY a.actor_id
ORDER BY num_movies DESC
LIMIT 3;

-- Count of movies rented by Country
SELECT c.country, COUNT(DISTINCT f.film_id)
FROM rental r
JOIN inventory i ON i.inventory_id = r.inventory_id
JOIN film f ON f.film_id = i.film_id
JOIN customer cus ON cus.customer_id = r.customer_id
JOIN address a ON a.address_id = cus.address_id
JOIN city ci ON ci.city_id = a.city_id
JOIN country c ON c.country_id = ci.country_id
GROUP BY c.country
ORDER BY COUNT(DISTINCT f.film_id) DESC;

-- Top 3 film renting customers in each city of every country.
WITH ranked_customers AS (
  SELECT 
    c.customer_id, 
    c.first_name, 
    c.last_name, 
    c.address_id, 
    a.city_id, 
    ci.country_id, 
    RANK() OVER (PARTITION BY ci.country_id, a.city_id ORDER BY COUNT(DISTINCT r.rental_id) DESC) AS customer_rank
  FROM customer c
  JOIN rental r ON r.customer_id = c.customer_id
  JOIN inventory i ON i.inventory_id = r.inventory_id
  JOIN address a ON a.address_id = c.address_id
  JOIN city ci ON ci.city_id = a.city_id
  GROUP BY c.customer_id, a.city_id, ci.country_id
)
SELECT 
  co.country, 
  ci.city, 
  rc.first_name, 
  rc.last_name, 
  COUNT(DISTINCT r.rental_id) AS num_rentals
FROM ranked_customers rc
JOIN rental r ON r.customer_id = rc.customer_id
JOIN inventory i ON i.inventory_id = r.inventory_id
JOIN film f ON f.film_id = i.film_id
JOIN address a ON a.address_id = rc.address_id
JOIN city ci ON ci.city_id = a.city_id
JOIN country co ON co.country_id = ci.country_id
WHERE rc.customer_rank <= 3
GROUP BY co.country, ci.city, rc.first_name, rc.last_name
ORDER BY co.country, ci.city, num_rentals DESC;

-- Number of employees in each store
SELECT store.store_id, COUNT(staff.staff_id) AS num_employees
FROM store
INNER JOIN staff ON store.store_id = staff.store_id
GROUP BY store.store_id;

-- Which employee has rented move movies and what is earning amount per flim.
SELECT 
  s.staff_id,
  s.first_name || ' ' || s.last_name AS staff_name,
  COUNT(r.rental_id) AS num_rentals,
  SUM(f.rental_rate) AS total_earnings
FROM staff s
JOIN rental r ON s.staff_id = r.staff_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
GROUP BY s.staff_id
ORDER BY num_rentals DESC;









-- Actor table
select * from actor 
-- Get first_name , last_name for actors
select first_name,last_name from actor;

-- Get first_name, last_name only 5 rows.
SELECT first_name,last_name from actor 
limit 5;

-- Get first_name, last_name of 5 actors who have been modified last

SELECT first_name, last_name 
FROM actor 
ORDER BY last_update DESC 
LIMIT 5;

-- Get top 5 repeating last_names of actors.

SELECT last_name, COUNT(last_name) as count 
FROM actor 
GROUP BY last_name 
HAVING COUNT(last_name) > 1 
ORDER BY count DESC 
LIMIT 5;

-- Get top 6 repeating first_name of actors.
SELECT first_name, COUNT(first_name) as count 
FROM actor 
GROUP BY first_name 
HAVING COUNT(first_name) > 1 
ORDER BY count DESC 
LIMIT 6;

--Film table
SELECT * FROM film;
-- Get count of films in table
select count(*) from film;

-- What is average movie length (use length column)
select avg(length)from film;
 
-- Count of movies for each rating (use rating column) 
SELECT rating, COUNT(*) FROM Film 
GROUP BY rating;

-- Get list of horror movies
select *from film 
where  title Like '%HORROR%';

--  Movies that contain CAT in title.
select *from film 
where  title Like '%CAT%';

-- category
select * from category
-- How many movie categories are there?
select count(*) from category;
-- Are category names repeating ?
SELECT name, COUNT(*) FROM category 
GROUP BY name
HAVING COUNT(name) > 1 ;

--Country & City
select * FROM COUNTRY
SELECT * FROM city

-- how many countries and cities ?
SELECT 
    COUNT(distinct country) as num_countries,
    COUNT(city) as num_cities
FROM 
    country b
LEFT JOIN 
    city c ON b.country_id = c.country_id;
	
--  For each country get the list of cities.
SELECT 
    distinct country as countries,
    array_agg(city) as cities
FROM 
    country b
LEFT JOIN 
    city c ON b.country_id = c.country_id
Group by countries
order by countries,

--Customer
select * from customer

--Get list of active customers;
 select concat(first_name,' ',last_name) from customer 
 where active=1;
 
 -- Do any customer share same emailID
 select email, count(concat(first_name,' ',last_name))as name from customer 
 group by email 

-- List of customers with same lastname
SELECT DISTINCT m1.first_name, m1.last_name
FROM customer m1
JOIN customer m2 ON m1.last_name = m2.last_name AND m1.first_name <> m2.first_name
ORDER BY m1.last_name, m1.first_name;

--film_category
select * from film_category 

-- Total movies that are categoried
select count(*) from film_category

-- Total rows in inventory
SELECT COUNT(*) FROM inventory;





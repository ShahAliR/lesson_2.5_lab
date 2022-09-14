USE sakila;
-- 1. Select all the actors with the first name ‘Scarlett’
SELECT * FROM sakila.actor
WHERE first_name ='Scarlett';

-- 2. How many films (movies) are available for rent and how many films have been rented?
-- Available
SELECT COUNT(return_date) 
FROM sakila.rental;
-- 15861 
 -- have been rented
SELECT COUNT(rental_date) 
FROM sakila.rental;
-- 16044
-- 3. What are the shortest and longest movie duration? Name the values max_duration and min_duration
SELECT MAX(length) 
FROM sakila.film;

SELECT MIN(length) 
FROM sakila.film;

-- 4.What's the average movie duration expressed in format (hours, minutes)?
SELECT AVG(length) AS average 
FROM sakila.film;
-- 5. How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT last_name) 
FROM sakila.actor;
 -- 121
 
 -- 6. Since how many days has the company been operating (check DATEDIFF() function)l?
 
 SELECT DATEDIFF(MIN(rental_date) , "2022-09-14")
 FROM sakila.rental;
 
 -- 6322

 -- 7. Show rental info with additional columns month and weekday. Get 20 results.
 
SELECT * , MONTH(CONVERT(rental_date,DATE))  AS 'Month' 
FROM sakila.rental
LIMIT 20;

SELECT *,  DAYOFWEEK(CONVERT(rental_date,DATE)) as 'weekday'
FROM sakila.rental
limit 20;

-- 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

SELECT *, 
CASE
WHEN  DAYOFWEEK(CONVERT(rental_date,DATE)) BETWEEN 1 AND 5 THEN 'workday'
ELSE 'weekend' 
END AS 'day_type'
FROM sakila.rental;


-- 9. Get release years.

SELECT *,  YEAR(CONVERT(rental_date,DATE))  AS year 
FROM sakila.rental;


-- 10. Get all films with ARMAGEDDON in the title

SELECT *
FROM sakila.film
WHERE title LIKE '%ARMAGEDDON%';

-- 11. Get all films which title ends with APOLLO

SELECT *
FROM sakila.film
WHERE title like '%APOLLO';

-- 12. Get 10 the longest films
SELECT title, length 
FROM sakila.film   
ORDER BY length DESC
LIMIT 10;
 
-- 13. How many films include Behind the Scenes content?
SELECT * 
FROM sakila.film
WHERE special_features LIKE '%Behind the Scenes%';
 
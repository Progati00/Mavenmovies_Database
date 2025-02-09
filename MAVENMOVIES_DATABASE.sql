use mavenmovies;
select * from mavenmovies.actor;

# SQL Commands
# 1. Identify the primary keys and foreign keys in maven movies DB. Discuss the differences.

# Ans: Primary Key: A column or set of columns that uniquely identifies each record in a table. For example, in a table like customers, the customer_id might be the primary key.
# Foreign Key: A column or set of columns in one table that refers to the primary key in another table, establishing a relationship between the two tables. For example, actor_id in the films table could be a foreign key referencing actor_id in the actors table.

# 2. List all details of actors.
SELECT * FROM actor;

# 3. List all customer information from DB.
SELECT * FROM customer;

# 4. List different countries.
select * from country;

# 5. Display all active customers.
SELECT * FROM customer WHERE active = 1;

# 6. List of all rental IDs for customer with ID 1.
SELECT rental_id FROM rental WHERE customer_id = 1;

# 7. Display all the films whose rental duration is greater than 5.
SELECT * FROM film WHERE rental_duration > 5;

# 8. List the total number of films whose replacement cost is greater than $15 and less than $20.
SELECT COUNT(*) FROM film WHERE replacement_cost > 15 AND replacement_cost < 20;

# 9. Display the count of unique first names of actors.
SELECT COUNT(DISTINCT first_name) FROM actor;

# 10. Display the first 10 records from the customer table.
SELECT * FROM customer LIMIT 10;

# 11. Display the first 3 records from the customer table whose first name starts with ‘b’.
SELECT * FROM customer WHERE first_name LIKE 'B%' LIMIT 3;

# 12. Display the names of the first 5 movies which are rated as ‘G’.
SELECT title FROM film WHERE rating = 'G' LIMIT 5;

# 13. Find all customers whose first name starts with "a".
SELECT * FROM customer WHERE first_name LIKE 'A%';

# 14. Find all customers whose first name ends with "a".
SELECT * FROM customer WHERE first_name LIKE '%a';

# 15. Display the list of the first 4 cities which start and end with ‘a’.
select * from city;
SELECT * FROM city 
WHERE city LIKE 'A%' AND city LIKE '%A' 
LIMIT 4;

# 16. Find all customers whose first name has "NI" in any position.
SELECT * FROM customer WHERE first_name LIKE '%NI%';

# 17. Find all customers whose first name has "r" in the second position.
SELECT * FROM customer WHERE first_name LIKE '_r%';

# 18. Find all customers whose first name starts with "a" and is at least 5 characters in length.
SELECT * FROM customer 
WHERE first_name LIKE 'A%' AND LENGTH(first_name) >= 5;

# 19. Find all customers whose first name starts with "a" and ends with "o".
SELECT * FROM customer 
WHERE first_name LIKE 'A%' and first_name LIKE '%o';

# 20. Get the films with PG and PG-13 rating using the IN operator.
SELECT * FROM film 
WHERE rating IN ('PG', 'PG-13');

# 21. Get the films with length between 50 to 100 using the BETWEEN operator.
SELECT * FROM film WHERE length BETWEEN 50 AND 100;

# 22. Get the top 50 actors using the LIMIT operator.
SELECT * FROM actor LIMIT 50;

# 23. Get the distinct film ids from the inventory table.
SELECT DISTINCT film_id FROM inventory;

# 24. Perform aggregate functions (COUNT, SUM, MAX, MIN, AVG) on the payment table.
SELECT COUNT(*) FROM payment;
SELECT SUM(amount) FROM payment;
SELECT MAX(amount) FROM payment;
SELECT MIN(amount) FROM payment;
SELECT AVG(amount) FROM payment;

# 25. Rental counts per customer.
SELECT customer_id, COUNT(*) FROM rental GROUP BY customer_id;

# 26. Customers with more than 5 rentals.
SELECT * FROM rental;
SELECT COUNT(*) FROM rental 
GROUP BY customer_id 
HAVING COUNT(*) > 5;

# 27. Use window functions (ROW_NUMBER, RANK, NTILE, LAG) on the payment table.
SELECT customer_id, amount, ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY amount DESC) AS row_num 
FROM payment;

SELECT customer_id, amount, RANK() OVER (PARTITION BY customer_id ORDER BY amount DESC) AS rank_payment
FROM payment;

SELECT customer_id, amount, NTILE(4) OVER (PARTITION BY customer_id ORDER BY amount DESC) AS quartile 
FROM payment;

SELECT customer_id, amount, LAG(amount, 1) OVER (PARTITION BY customer_id ORDER BY amount DESC) AS previous_amount 
FROM payment;

# 28. Total payment joins: Perform INNER, LEFT, RIGHT customer and rental tables.
SELECT customer.customer_id, customer.first_name, rental.rental_id 
FROM customer INNER JOIN rental ON customer.customer_id = rental.customer_id;

SELECT customer.customer_id, rental.rental_id 
FROM customer LEFT JOIN rental ON customer.customer_id = rental.customer_id;

SELECT customer.customer_id, rental.rental_id 
FROM customer RIGHT JOIN rental ON customer.customer_id = rental.customer_id;



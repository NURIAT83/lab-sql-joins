
##First Question
USE sakila;
##First let's check the tables that might have what we are looking for
SELECT * FROM category;
SELECT * FROM film;
SELECT * FROM film_category;
SELECT COUNT(DISTINCT category.category_id) AS quantity__category FROM category LEFT JOIN film_category 
ON category.category_id=film_category.category_id ORDER BY category.category_id ASC;
##Now we know there are 16 categories
## We want to know how many films are in each category
SELECT COUNT(category.category_id) AS quantity__category, category.name FROM category LEFT JOIN film_category 
ON category.category_id=film_category.category_id 
GROUP BY category.category_id ORDER BY category.category_id ASC LIMIT 17;
##Counting the columns we check that there are 16 columns.
##SECOND Question
##Retrieve the store ID, city, and country for each store.
##Let's look at the tables we might use
SELECT * FROM store;
SELECT * FROM city;
SELECT * FROM country;
##We can see a clear connection btw city and country, they both have country_id
##We are in need of another table to join  the store table.
##We are going to look at the address table
SELECT * FROM address;
##We are going to connect the table store with the table address using the column address_id
##Then we are going to connect the table address with the table city using city_id
SELECT store.store_id FROM store INNER JOIN address.address_id ON store.address_id=address.address_id 
INNER JOIN address.city_id ON address.city_id=city.city_id 
INNER JOIN city.country_id ON city.country_id=country.country_id;
##Question 3
##Calculate the total revenue generated by each store in dollars.
##Let's check the tables we are going to use
SELECT * FROM payment;
SELECT * FROM store;
## First, we combine the 'payment' table with 'customer' table using as connector the customer_id column 
## Second, we combine the previous tables with 'store' table using store_id.
SELECT SUM(amount) AS total_revenue FROM payment
INNER JOIN  customer ON payment.customer_id=customer.customer_id
INNER JOIN store ON customer.store_id=store.store_id group by store.store_id;
##Determine the average running time of films for each category.
##We are interested in the variable length that represents the running time of a movie.
##We are going to combine the film table with the film_category table using film_id
##We are going to combine the film_category table with the category table using category_id.
SELECT * FROM film_category;
SELECT * FROM film;
SELECT AVG(film.length) AS average_running_time , name AS category_name FROM film
INNER JOIN film_category ON film.film_id=film_category.film_id 
INNER JOIN category ON film_category.category_id=category.category_id
GROUP BY category.name;
##Identify the film categories with the longest average running time. 
##We order the results of the last question by descending order.
##we have in the first row the category with the longest average running time.
SELECT AVG(film.length) AS average_running_time , name AS category_name FROM film
INNER JOIN film_category ON film.film_id=film_category.film_id 
INNER JOIN category ON film_category.category_id=category.category_id
GROUP BY category.name ORDER BY AVG(film.length) DESC;
##The longest average running time corresponds to the category 'Sports' with 128.2027 minutes.
##Display the top 10 most frequently rented movies in descending order.
SELECT * FROM film;
SELECT * FROM rental;
SELECT COUNT(payment.rental_id) AS rental_frequency FROM payment 
GROUP BY payment.rental_id ORDER BY rental_frequency DESC;
##Determine if "Academy Dinosaur" can be rented from Store 1.









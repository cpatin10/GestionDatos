-- Extracting data from sakila database 
-- Data is stored in the staging (In) tables
 
-- Filling Country 
INSERT INTO staging.Country (country_id,country)
SELECT sc.country_id, sc.country FROM sakila.country sc; 

-- Filling City
INSERT INTO staging.City (city_id, city, country_id)
SELECT sci.city_id, sci.city, sci.country_id FROM sakila.city sci;
 
-- Filling Address
INSERT INTO staging.Address (address_id, address, district, city_id)
SELECT sa.address_id, sa.address, sa.district, sa.city_id FROM sakila.address sa;

-- Filling Store
INSERT INTO staging.Store (store_id, address_id)
SELECT s.store_id, s.address_id FROM sakila.store s;

-- Filling Customer
INSERT INTO staging.Customer (customer_id, store_id, active, first_name, last_name, email, address_id)
SELECT c.customer_id, c.store_id, c.active, c.first_name, c.last_name, c.email, c.address_id FROM sakila.customer c;

-- Filling Language
INSERT INTO staging.Language (language_id, name)
SELECT sl.language_id, sl.name FROM sakila.language sl;

-- Filling Film
INSERT INTO staging.Film (film_id, title, release_year, language_id)
SELECT f.film_id, f.title, f.release_year, f.language_id FROM sakila.film f;

-- Filling Category
INSERT INTO staging.Category (category_id, name)
SELECT ca.category_id, ca.name FROM sakila.category ca;

-- Filling Film_category
INSERT INTO staging.Film_category (film_id, category_id)
SELECT fc.film_id, fc.category_id FROM sakila.film_category fc;

-- Filling Actor
INSERT INTO staging.Actor (actor_id, first_name, last_name)
SELECT a.actor_id, a.first_name, a.last_name FROM sakila.actor a;

-- Filling Inventory
INSERT INTO staging.Inventory (inventory_id, store_id, film_id)
SELECT si.inventory_id, si.store_id, si.film_id FROM sakila.inventory si;

-- Filling Film_actor
INSERT INTO staging.Film_actor (actor_id, film_id)
SELECT sfa.actor_id, sfa.film_id FROM sakila.film_actor sfa;

-- Filling Rental
INSERT INTO staging.Rental (rental_id, inventory_id, rental_date, return_date)
SELECT sr.rental_id, sr.inventory_id, sr.rental_date, sr.return_date FROM sakila.rental sr;

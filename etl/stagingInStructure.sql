-- Create Structure for receiving the extracted elements from data source (Sakila)
-- Only the needed register for answering the proposed questions are considered for the new structure
    
-- Tabla Country 1
CREATE TABLE IF NOT EXISTS staging.Country(
    country_id SMALLINT PRIMARY KEY,
    country VARCHAR(50)
);

-- Tabla City 2
CREATE TABLE IF NOT EXISTS staging.City(
    city_id SMALLINT PRIMARY KEY,
    city VARCHAR(50),
    country_id SMALLINT,
    FOREIGN KEY country_id (country_id) REFERENCES staging.Country (country_id)
);

-- Table Address 3
CREATE TABLE IF NOT EXISTS staging.Address(
    address_id SMALLINT PRIMARY KEY,
    address VARCHAR(50),
    district VARCHAR(20),
    city_id SMALLINT,
    FOREIGN KEY city_id (city_id) REFERENCES staging.City (city_id)
);

-- Table Store 4
CREATE TABLE IF NOT EXISTS staging.Store(
    store_id TINYINT PRIMARY KEY,
    address_id SMALLINT,
    FOREIGN KEY address_id (address_id) REFERENCES staging.Address (address_id)
);


-- Table Customer 5
CREATE TABLE IF NOT EXISTS staging.Customer(
    customer_id SMALLINT PRIMARY KEY,
    store_id TINYINT,
    active BOOLEAN,
    first_name VARCHAR(45),
    last_name VARCHAR(45),
    email VARCHAR(50),
    address_id SMALLINT,
    FOREIGN KEY  (address_id) REFERENCES staging.Address (address_id),
    FOREIGN KEY  (store_id) REFERENCES staging.Store (store_id)
);

-- staging in Lenguage 13
CREATE TABLE IF NOT EXISTS staging.Language (
    language_id TINYINT PRIMARY KEY,
    name CHAR(20)
);

-- staging in Film 6
CREATE TABLE IF NOT EXISTS staging.Film (
    film_id SMALLINT PRIMARY KEY,
    title VARCHAR(255),
    release_year YEAR,
    language_id TINYINT,
    FOREIGN KEY (language_id) REFERENCES staging.Language(language_id)
);

-- Table Category 7
CREATE TABLE IF NOT EXISTS staging.Category (
    category_id TINYINT PRIMARY KEY,
    name VARCHAR(25)
);

-- staging in Film_category 8
CREATE TABLE IF NOT EXISTS staging.Film_category (
    film_id SMALLINT,
    category_id TINYINT,
    FOREIGN KEY category_id (category_id) REFERENCES staging.Category (category_id),
    FOREIGN KEY film_id (film_id) REFERENCES staging.Film (film_id)
);

-- Table Actor 9
CREATE TABLE IF NOT EXISTS staging.Actor (
    actor_id SMALLINT PRIMARY KEY,
    first_name VARCHAR(45),
    last_name VARCHAR(45)
);

-- staging in Inventory 10
CREATE TABLE IF NOT EXISTS staging.Inventory (
    inventory_id MEDIUMINT PRIMARY KEY, 
    store_id TINYINT,
    film_id SMALLINT,
    CONSTRAINT FOREIGN KEY (store_id) REFERENCES staging.Store(store_id),
    FOREIGN KEY  (film_id) REFERENCES staging.Film (film_id)
);

-- Table Film_actor 11
CREATE TABLE IF NOT EXISTS staging.Film_actor (
    actor_id SMALLINT,
    film_id SMALLINT,
    FOREIGN KEY (film_id) REFERENCES staging.Film (film_id),
    FOREIGN KEY (actor_id) REFERENCES staging.Actor (actor_id)
    
);

-- staging in Rental 12
CREATE TABLE IF NOT EXISTS staging.Rental (
    rental_id INT PRIMARY KEY, 
    customer_id SMALLINT, 
    inventory_id MEDIUMINT,
    rental_date DATETIME, 
    return_date DATETIME,
    FOREIGN KEY inventory_id (inventory_id) REFERENCES staging.Inventory (inventory_id),
    FOREIGN KEY customer_id (customer_id) REFERENCES staging.Customer (customer_id)
);


    


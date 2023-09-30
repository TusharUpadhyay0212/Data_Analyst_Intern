--  Get list of tables 
SELECT table_name FROM information_schema.tables
WHERE table_schema = 'public' AND table_type = 'BASE TABLE';

-- Get list of columns and data types
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'actor';

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = '"store"';

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'payment';

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'payment_p2007_02';

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'payment_p2007_03';

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'payment_p2007_04';

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'payment_p2007_05';

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'payment_p2007_06';

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = '"payment_p2007_01';

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'address';

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'category';

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'city';

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'country';

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'customer';

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'film_actor';

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'film_category';

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'inventory';

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'language';

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'rental';

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'staff';


-- Get list of Schema, tables, columns.

SELECT table_schema, table_name, column_name, data_type
FROM information_schema.columns
WHERE table_schema NOT IN ('information_schema', 'pg_catalog')
ORDER BY table_schema, table_name;

-- Get list of constraints (Primary Key, Foreign Key, Check Constraints).

SELECT conname AS constraint_name, conrelid::regclass AS table_name, pg_get_constraintdef(oid) AS constraint_definition
FROM pg_constraint
WHERE conrelid::regclass::text NOT LIKE 'pg_%' AND conrelid::regclass::text NOT LIKE 'sql_%'
ORDER BY conname;

-- What is difference between Primary Key, Foreign Key and Unique Contraints.
Primary key: A primary key is a unique identifier for a record in a database table.
It ensures that each record in the table can be uniquely identified and distinguishes it from all other records. 
A primary key is typically composed of one or more columns in the table, and it must have a unique value for each record. 
It is used as a reference point for other tables that relate to the same data.

Foreign key: A foreign key is a field in one table that refers to the primary key of another table. 
It establishes a relationship between two tables, where the foreign key in one table is used to link to the primary key in another table. 
This is used to create relationships between tables in a relational database, and it allows data to be joined and queried across multiple tables.

Unique constraint: A unique constraint is a rule that ensures that a column or combination of columns in a table contains unique values.
It is similar to a primary key, but it allows for null values. This is useful when you need to ensure that certain columns in a table do not contain duplicate values, 
but you don't necessarily want them to serve as a primary key.

-- Get list of indexes for each tables.

SELECT 
    t.relname AS table_name, 
    i.relname AS index_name, 
    pg_get_indexdef(i.oid) AS index_definition
FROM 
    pg_class t, 
    pg_class i, 
    pg_index ix
WHERE 
    t.oid = ix.indrelid AND
    i.oid = ix.indexrelid AND
    t.relkind = 'r'
ORDER BY 
    t.relname, 
    i.relname;
	
-- Understand table structures along with relationships, for each table look at data and see if they are in 1 Normal form, 2nd Normal Form or 3rd Normal form. Format should be
<Table> <Name> <Normal Form Reason>

Table Name: actor
Normal Form: 1st Normal Form
Reason: All attributes are atomic and there are no repeating groups.

Table Name: address
Normal Form: 1st Normal Form
Reason: All attributes are atomic and there are no repeating groups.

Table Name: category
Normal Form: 1st Normal Form
Reason: All attributes are atomic and there are no repeating groups.

Table Name: city
Normal Form: 1st Normal Form
Reason: All attributes are atomic and there are no repeating groups.

Table Name: country
Normal Form: 1st Normal Form
Reason: All attributes are atomic and there are no repeating groups.

Table Name: customer
Normal Form: 1st Normal Form
Reason: All attributes are atomic and there are no repeating groups.

Table Name: film
Normal Form: 1st Normal Form
Reason: All attributes are atomic and there are no repeating groups.

Table Name: film_actor
Normal Form: 2nd Normal Form
Reason: The table has a composite primary key made up of two foreign keys, but there are no partial dependencies.

Table Name: film_category
Normal Form: 2nd Normal Form
Reason: The table has a composite primary key made up of two foreign keys, but there are no partial dependencies.

Table Name: inventory
Normal Form: 2nd Normal Form
Reason: The table has a composite primary key made up of two foreign keys, but there are no partial dependencies.

Table Name: language
Normal Form: 1st Normal Form
Reason: All attributes are atomic and there are no repeating groups.

Table Name: payment
Normal Form: 2nd Normal Form
Reason: The table has a composite primary key made up of three foreign keys, but there are no partial dependencies.

Table Name: rental
Normal Form: 2nd Normal Form
Reason: The table has a composite primary key made up of two foreign keys, but there are no partial dependencies.

Table Name: staff
Normal Form: 1st Normal Form
Reason: All attributes are atomic and there are no repeating groups.

Table Name: store
Normal Form: 1st Normal Form
Reason: All attributes are atomic and there are no repeating groups.

--  Create Database diagram for tables in shakila 
Table ACTOR {
  ACTOR_ID SMALLINT PK
  FIRST_NAME VARCHAR(45) 
  LAST_NAME VARCHAR(45) 
  LAST_UPDATE TIMESTAMP 
}

Table FILM_ACTOR{
 ACTOR_ID NUMBER(22)  
 FILM_ID NUMBER(22) PK
 LAST_UPDATE TIMESTAMP
}
Table FILM {
  FILM_ID NUMBER(22) PK
  TITLE VARCHAR2(255) 
  DESCRIPTION TEXT
  RELEASE_YEAR VARCHAR2(4)
  LANGUAGE_ID NUMBER(22) // [foreign key]
  ORIGINAL_LANGUAGE_ID NUMBER(22) //[foreign key]
  RENTAL_DURATION NUMBER(22)
  RENTAL_RATE DECIMAL(4,2)
  LENGTH  NUMBER(22)
  REPLACEMENT_COST DECIMAL(5,2) 
  rRATING VARCHAR2(10)
  SPECIAL_FEATURES VARCHAR2(100)
  LAST_UPDATE TIMESTAMP 
}

Table CATEGORY {
 CATEGORY_ID TINYINT PK
 NAME VARCHAR(25) 
 LAST_UPDATE TIMESTAMP
}

Table FILM_CATEGORY{
 FILM_ID NUMBER(22) PK
 CATEGORY_ID NUMBER(22) PK
 LAST_UPDATE TIMESTAMP
}

Table INVENTORY{
 INVENTORY_ID NUMBER(22) PK
 FILM_ID NUMBER(22) 
 STORE_ID NUMBER(22)
 LAST_UPDATE TIMESTAMP
}

Table RENTAL{
 RENTAL_ID NUMBER(22) PK
 RENTAL_DATE TIMESTAMP
 INVENTORY_ID NUMBER(22)
 CUSTOMER_ID NUMBER(22)
 RETURN_DATE TIMESTAMP
 STAFF_ID NUMBER(22)
 LAST_UPDATE TIMESTAMP
}

Table CUSTOMER {
  CUSTOMER_ID SMALLINT  PK
  STORE_ID TINYINT 
  FIRST_NAME VARCHAR(45) 
  LAST_NAME VARCHAR(45) 
  EMAIL VARCHAR(50) 
  ADDRESS_ID SMALLINT
  ACTIVE BOOLEAN 
  CREATE_DATE DATETIME
  LAST_UPDATE TIMESTAMP
}

Table STORE{
 STORE_ID NUMBER(22) PK
 MANAGER_STAFF_ID NUMBER(22) 
 ADDRESS_ID NUMBER(22)
 LAST_UPDATE TIMESTAMP
}

Table ADDRESS {
  ADDRESS_ID SMALLINT PK
  ADDRESS VARCHAR(50)
  ADDRESS2 VARCHAR(50)
  DISTRICT VARCHAR(20)
  CITY_ID SMALLINT 
  POSTAL_CODE VARCHAR(10) 
  PHONE VARCHAR(20) 
  LAST_UPDATE TIMESTAMP
}


Table CITY {
 CITY_ID TINYINT  PK
 CITY VARCHAR(25) 
 COUNTRY_ID NUMBER(22)
 LAST_UPDATE TIMESTAMP
}

Table COUNTRY {
 COUNTRY_ID TINYINT PK
 COUNTRY VARCHAR(25) 
 LAST_UPDATE TIMESTAMP
}



Table LANGUAGE{
 LANGUAGE_ID NUMBER(22) PK
 NAME CHAR(20)
 LAST_UPDATE TIMESTAMP
}

Table STAFF{
 STAFF_ID NUMBER(22) PK
 FIRST_NAME VARCHAR2(45)
 LAST_NAME VARCHAR2(45)
 ADDRESS_ID NUMBER(22)
 PICTURE BOOLEAN
 EMAIL VARCHAR2(50)
 STORE_ID NUMBER(22)
 ACTIVE NUMBER(22)
 USERNAME VARCHAR2(16)
 PASSWORD VARCHAR2(40)
 LAST_UPDATE TIMESTAMP
}

Table PAYMENT{
 PAYMENT_ID NUMBER(22) PK
 CUSTOMER_ID NUMBER(22)
 STAFF_ID NUMBER(22)
 RENTAL_ID NUMBER(22)
 AMOUNT DECIMAL(5,2)
 PAYMENT_DATE TIMESTAMP
 LAST_UPDATE TIMESTAMP
}



Ref: FILM_ACTOR.ACTOR_ID > ACTOR.ACTOR_ID

Ref: FILM_ACTOR.FILM_ID > FILM.FILM_ID

Ref: FILM_CATEGORY.CATEGORY_ID > CATEGORY.CATEGORY_ID

Ref: FILM_CATEGORY.FILM_ID > FILM.FILM_ID

Ref: FILM.LANGUAGE_ID > LANGUAGE.LANGUAGE_ID

Ref: INVENTORY.FILM_ID > FILM.FILM_ID

Ref: INVENTORY.STORE_ID > STORE.STORE_ID

Ref: STORE.ADDRESS_ID > ADDRESS.ADDRESS_ID

Ref: ADDRESS.CITY_ID > CITY.CITY_ID

Ref: CITY.COUNTRY_ID > COUNTRY.COUNTRY_ID

Ref: CUSTOMER.STORE_ID > STORE.STORE_ID

Ref: CUSTOMER.ADDRESS_ID > ADDRESS.ADDRESS_ID

Ref: STAFF.ADDRESS_ID > ADDRESS.ADDRESS_ID

Ref: RENTAL.CUSTOMER_ID > CUSTOMER.CUSTOMER_ID

Ref: PAYMENT.STAFF_ID > STAFF.STAFF_ID

Ref: RENTAL.STAFF_ID > STAFF.STAFF_ID

Ref: STORE.ADDRESS_ID > STAFF.ADDRESS_ID

Ref: STAFF.STORE_ID > STORE.STORE_ID

Ref: PAYMENT.CUSTOMER_ID > CUSTOMER.CUSTOMER_ID

Ref:PAYMENT.RENTAL_ID > RENTAL.RENTAL_ID

Ref:RENTAL.INVENTORY_ID > INVENTORY.INVENTORY_ID

// Ref: posts.user_id > users.id // many-to-one

// Ref: users.id < follows.following_user_id

// Ref: users.id < follows.followed_user_id

link:- https://dbdocs.io/upadhyaytushar99/shakila-database?view=relationships



-- Calculate size of each table and total database size.
SELECT 
    relname AS table_name, 
    pg_size_pretty(pg_total_relation_size(relid)) AS total_size
FROM pg_catalog.pg_statio_user_tables 
ORDER BY pg_total_relation_size(relid) DESC;







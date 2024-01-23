CREATE TABLE naukars (
	employee_id INT,
    first_name VARCHAR(20),
    last_name VARCHAR(50),
    hire_date date

);

SELECT * FROM naukars;


RENAME TABLE naukars TO workers;

RENAME TABLE workers to naukars;

DROP TABLE naukars;

ALTER TABLE naukars ADD phone_number VARCHAR(15);

SELECT * FROM naukars;

ALTER TABLE naukars CHANGE COLUMN phone_number email VARCHAR(20);

ALTER TABLE naukars MODIFY COLUMN email VARCHAR(100);

ALTER TABLE naukars MODIFY email VARCHAR(100) AFTER last_name;

SELECT * FROM naukars;

ALTER TABLE naukars ADD COLUMN hourly_pate INT;

SELECT * FROM naukars;

ALTER TABLE naukars DROP COLUMN hourly_pate;

INSERT INTO naukars VALUES (1, "Ashish", "Kumar", "imdigitalashish@gmail.com", "2023-04-12");


SELECT * FROM naukars WHERE first_name = "Ashish";

UPDATE naukars SET first_name = "NAME";

SELECT * FROM naukars;

COMMIT;

SELECT * FROM naukars;

ROLLBACK;

DELETE FROM naukars;

SELECT * FROM naukars;

CREATE TABLE products (
	product_id INT,
    product_name VARCHAR(25),
    price DECIMAL(4,2)
);

ALTER TABLE products ADD CONSTRAINT UNIQUE(product_name);

SELECT * FROM products;

INSERT INTO products 
VALUES (100, "hamburger", 3.99),
	   (101, "fries", 1.89),
       (102, "soda", 1.00),
       (103, "ice cream", 1.49);
       
SELECT * FROM products;

INSERT INTO products (101, "ice cream", 12);

ALTER TABLE naukars ADD COLUMN hourly_rate INT;

ALTER TABLE naukars ADD constraint CHECK(hourly_rate >= 10.00);

INSERT INTO naukars VALUES (1, "Ashish", "Verma", "imdigitalashish@gmail.com", "2022-20-20", 30);

SELECT * FROM naukars WHERE hourly_rate;


CREATE TABLE customers (
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);



SELECT * FROM customers;



INSERT INTO customers (first_name, last_name)
VALUES ("Fred", "Fish"),
("Larry", "Bash"),
("Hey hey", "Boy");


CREATE TABLE transactions (
	transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    amount DECIMAL(5,2),
    customer_id INT,
    foreign key(customer_id) REFERENCES customers(customer_id)
);

SELECT * FROM transactions;

ALTER TABLE transactions DROP foreign key transactions_ibfk_2;


ALTER TABLE transactions ADD CONSTRAINT transaction_fk FOREIGN KEY(customer_id)  REFERENCES customers(customer_id);

# JOINSSSS STARTED FROM HERE

# INNER JOIN

SELECT * FROM customers;

INSERT INTO customers VALUES (5, "Ashish", "Kumar");

INSERT INTO transactions (amount, customer_id)
VALUES (200, 3),
	   (2003, 2),
       (2001, 1);

SELECT transaction_id, amount, first_name, last_name 
FROM transactions RIGHT JOIN customers
ON transactions.customer_id = customers.customer_id;

SELECT * FROM transactions;


# FUNCTIONS
SELECT COUNT(amount) AS todays_transaction
FROM transactions;

SELECT MAX(amount) AS maximum
FROM transactions;


SELECT MIN(amount) AS maximum
FROM transactions;


SELECT SUM(amount) AS total_sales
FROM transactions;

SELECT CONCAT(first_name, " + ", last_name) AS full_name
FROM naukars;


ALTER TABLE naukars ADD COLUMN jobs VARCHAR(25)
AFTER hourly_rate;

SELECT * FROM naukars;

UPDATE naukars
SET jobs = "manager"
WHERE employee_id = 1;

SELECT * FROM naukars;


SELECT * FROM naukars 
WHERE last_name LIKE "k%";

SELECT * FROM transactions
ORDER BY amount, customer_id LIMIT 3;


# UNION REMOVES DUPLICATES
SELECT first_name, last_name FROM naukars
UNION
SELECT first_name, last_name FROM customers;

#UNION ALL DON'T REMOVE DUPLICATES
SELECT first_name, last_name FROM naukars
UNION ALL
SELECT first_name, last_name FROM customers;


ALTER TABLE customers DROP COLUMN refral_id;

INSERT INTO transactions (amount, customer_id) VALUES (389, 1);

SELECT COUNT(amount), customer_id
FROM transactions 
GROUP BY customer_id HAVING COUNT(amount) >= 3;

SELECT * FROM transactions AS t, customers AS c  WHERE t.customer_id = c.customer_id AND NOT t.amount > 400;



SELECT * FROM transactions;

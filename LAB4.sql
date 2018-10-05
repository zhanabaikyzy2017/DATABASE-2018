CREATE DATABASE lab5;
CREATE TABLE salesman(
    salesman_id INT PRIMARY KEY,
    name VARCHAR(255),
    city VARCHAR(255),
    commission FLOAT
);
CREATE TABLE customers(
  customer_id INT PRIMARY KEY,
  cust_name VARCHAR(255),
  city VARCHAR(255),
  grade INT,
  salesman_id INT REFERENCES salesman(salesman_id)
);
  CREATE TABLE orders(
    ord_no INT PRIMARY KEY,
    purch_amt FLOAT,
    ord_date DATE,
    customer_id INT REFERENCES customers(customer_id),
    salesman_id INT REFERENCES salesman(salesman_id)
  );

SELECT sum(purch_amt) FROM orders;
SELECT avg(purch_amt) FROM orders;
SELECT count(cust_name) from customers WHERE cust_name NOTNULL;
SELECT min(purch_amt) FROM orders;
SELECT * FROM customers WHERE cust_name LIKE '%b';
SELECT * FROM orders WHERE customer_id IN (SELECT customer_id FROM customers WHERE city='NEW York');
SELECT * FROM customers WHERE customer_id IN (SELECT customer_id FROM orders WHERE purch_amt>10);
SELECT sum(grade) FROM customers;
SELECT * FROM customers WHERE cust_name NOTNULL;
SELECT max(grade) FROM customers;
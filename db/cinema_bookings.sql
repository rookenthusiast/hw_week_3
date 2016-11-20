DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS films;
DROP TABLE IF EXISTS customers;


CREATE TABLE films(
title VARCHAR(255),
price INT4,
id  SERIAL8 primary key
);

CREATE TABLE customers(
name VARCHAR(255),
funds INT4,
id SERIAL8 primary key
);

CREATE TABLE tickets(
  id SERIAL8 primary key,
customer_id INT8 references customers(id),
film_id INT8 references films(id)
);
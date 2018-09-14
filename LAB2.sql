CREATE DATABASE lab2;

CREATE TABLE countries(
  country_id SERIAL CONSTRAINT primary_key PRIMARY KEY,
  coutry_name VARCHAR(200),
  region_id INT,
  population INT
);

INSERT INTO countries values (DEFAULT ,'Russia',2,3000000);

INSERT INTO countries (coutry_name, region_id, population) VALUES('Kazakhstan',1,17000000);

SELECT * FROM countries;

INSERT INTO countries VALUES (DEFAULT, 'Turkey', NULL, 900000);

INSERT INTO countries (country_id, coutry_name, region_id, population) VALUES (DEFAULT, 'USA', 6, 1700000),
                                                                               (DEFAULT, 'Canada', 90, 1500000),
                                                                               (DEFAULT, 'Mexico', 15, 3500000);

ALTER TABLE countries ALTER COLUMN coutry_name SET DEFAULT 'Kazakhstan';

INSERT INTO countries VALUES(DEFAULT ,DEFAULT,9,12000000);

CREATE TABLE countries_new (
  LIKE countries
);

INSERT INTO countries_new SELECT * FROM countries RETURNING *;


UPDATE countries_new SET region_id = 1 WHERE region_id = NULL;

UPDATE countries SET population = population * 1.1 RETURNING country_name, population as "New Population";

DELETE FROM countries WHERE population < 100000;

DELETE FROM countries_new AS c USING countries AS cn WHERE c.country_id = cn.country_id RETURNING *;

DELETE FROM countries RETURNING *;





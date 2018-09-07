CREATE DATABASE lab1;
CREATE TABLE users(
  id SERIAL ,
  firstname VARCHAR(50),
  lastname VARCHAR(50)
);

ALTER TABLE users ADD COLUMN isadmin INT;
SELECT * FROM users;

ALTER TABLE users ALTER COLUMN isadmin DROP DEFAULT;
ALTER TABLE users ALTER COLUMN isadmin TYPE bool USING isadmin:: boolean;

ALTER TABLE users ALTER COLUMN isadmin SET DEFAULT FALSE;

ALTER TABLE users ADD CONSTRAINT users_key PRIMARY KEY(id);

CREATE TABLE tasks(
  id SERIAL,
  name VARCHAR(50),
  user_id INT
);

DROP TABLE tasks;
DROP DATABASE lab1;
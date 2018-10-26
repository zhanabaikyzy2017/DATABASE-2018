create database lab7;
drop table departments;
create table locations (
  location_id    serial primary key,
  street_address varchar(25),
  postal_code    varchar(12),
  city           varchar(30),
  state_province varchar(12)
);

create table departments (
  department_id   serial primary key,
  department_name varchar(50) unique,
  budget          integer,
  location_id     integer references locations
  );

create table employees(
employee_id serial primary key,
first_name varchar(50),
last_name varchar(50),
email varchar(50),
phone_number varchar(20),
salary integer,
manager_id integer references employees,
department_id integer references departments
);

CREATE TABLE job_grades(
  grade CHAR(1),
  lowest_salary INTEGER,
  highest_salary INTEGER
);

SELECT first_name, last_name, department_name, city, state_province FROM employees
    INNER JOIN departments ON employees.department_id=departments.department_id
    INNER JOIN locations ON employees.employee_id IS  NOT NULL;

SELECT first_name, last_name, salary, grade FROM employees
INNER JOIN job_grades ON employee_id IS NOT NULL;

SELECT employees.first_name, employees.last_name, employees.salary FROM employees
INNER JOIN employees e ON e.employee_id=120
WHERE employees.salary>e.salary;

SELECT employees.first_name FROM employees
INNER JOIN employees e on employees.manager_id = e.employee_id;

SELECT first_name, last_name, departments.department_id FROM employees
LEFT OUTER JOIN departments ON employees.employee_id=departments.department_id;
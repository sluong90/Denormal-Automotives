DROP DATABASE IF EXISTS normal_cars;
DROP ROLE IF EXISTS normal_user;
CREATE USER normal_user;
CREATE DATABASE normal_cars OWNER normal_user;

\c normal_cars
\i scripts/denormal_data.sql;

--CREATE TABLES--

--create 1st table: makes
CREATE TABLE IF NOT EXISTS makes (
    id SERIAL PRIMARY KEY,
    make_code VARCHAR(125) NOT NULL,
    make_title VARCHAR(125) NOT NULL

);

--create 2nd table: models
CREATE TABLE IF NOT EXISTS models (
    id SERIAL PRIMARY KEY, 
    model_code VARCHAR(125) NOT NULL,
    model_title VARCHAR(125) NOT NULL
);

--create 3rd table: years
CREATE TABLE IF NOT EXISTS years (
    id SERIAL PRIMARY KEY,
    year INT NOT NULL
);



--INSERT DATA TO TABLES--

INSERT INTO makes (make_code, make_title) SELECT DISTINCT make_code, make_title FROM car_models;

INSERT INTO models (model_code, model_title) SELECT DISTINCT model_code, model_title FROM car_models;

INSERT INTO years (year)
SELECT DISTINCT year FROM car_models;











/*Queries that provide answers to the questions from all projects.*/

SELECT name
FROM animals
WHERE name LIKE '%mon%';
SELECT name
FROM animals
WHERE date_of_birth BETWEEN '2016-01-01' and '2019-01-01';
SELECT name
FROM animals
WHERE neutered = true and escape_attempts < 3;
SELECT date_of_birth
FROM animals
WHERE name = 'Agumon' or name = 'Pikachu';
SELECT name, escape_attempts 
FROM animals
WHERE weight_kg > 10.5;
SELECT name 
FROM animals
WHERE neutered = true;
SELECT name 
FROM animals
WHERE name != 'Gabumon';
SELECT name 
FROM animals
WHERE weight_kg <= 17.3 and weight_kg >= 10.4;

BEGIN;
UPDATE animals
   SET species = 'unspecified';
COMMIT;
BEGIN;
UPDATE animals
   SET species = 'unspecified';
ROLLBACK;

BEGIN;
UPDATE animals
   SET species = 'digimon'
   WHERE name LIKE '%mon%';
UPDATE animals
   SET species = 'pokemon'
   WHERE name NOT LIKE '%mon%';
COMMIT;
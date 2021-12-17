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
ROLLBACK;

BEGIN;
UPDATE animals
   SET species = 'digimon'
   WHERE name LIKE '%mon%';
UPDATE animals
   SET species = 'pokemon'
   WHERE name NOT LIKE '%mon%';
COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;

BEGIN;
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';
SAVEPOINT delete_animals;
UPDATE animals
SET weight_kg = weight_kg * -1;
ROLLBACK TO delete_animals;
UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(name) FROM animals;

SELECT COUNT(name) FROM animals
WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT SUM(escape_attempts) FROM animals
WHERE neutered = true;

SELECT SUM(escape_attempts) FROM animals
WHERE neutered = false;

SELECT neutered, MAX(weight_kg) FROM animals
GROUP BY neutered;

SELECT neutered, MIN(weight_kg) FROM animals
GROUP BY neutered;

SELECT AVG(escape_attempts) FROM animals
WHERE date_of_birth > '1990-01-01' and date_of_birth < '2000-01-01';
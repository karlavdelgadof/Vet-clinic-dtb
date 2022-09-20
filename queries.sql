/*Queries that provide answers to the questions from all projects.*/

/* Monday's queries*/
SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN DATE '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = 'true' AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = 'true';
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;


/* Tuesday's queries and transactions */

-- TRANSACTION #1
BEGIN;

-- set set species column to unspecified
UPDATE animals
SET species = 'unspecified';

-- roll back the transaction
ROLLBACK;


-- TRANSACTION #2 

BEGIN;

-- set the species column to digimon for all animals that have a name ending in mon
UPDATE animals
SET species = 'digimon' WHERE name LIKE '%mon';

-- set the species column to pokemon for all animals that don't have species already set.
UPDATE animals
SET species = 'pokemon' WHERE species IS NULL;

-- commit the transactions
COMMIT;

-- TRANSACTION #3
BEGIN;

-- delete all records in the animals table
DELETE FROM animals;

-- roll back the transaction
ROLLBACK;

-- TRANSACTION #4

BEGIN;

-- Delete all animals born after Jan 1st, 2022
DELETE FROM animals WHERE date_of_birth > '2022-01-01';

-- Create a savepoint for the transaction
SAVEPOINT SP1;

-- Update all animals' weight to be their weight multiplied by -1
UPDATE animals
SET weight_kg = weight_kg * -1;

-- Rollback to savepoint SP1
ROLLBACK TO SP1;

-- Update all animals' weights that are negative to be their weight multiplied by -1
UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;

-- commit the transaction
COMMIT;

-- Queries

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts < 1;
SELECT ROUND(AVG(weight_kg)) FROM animals;
SELECT neutered, ROUND(AVG(escape_attempts)) as attempts FROM animals GROUP BY neutered;
SELECT species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;

SELECT species, ROUND(AVG(escape_attempts)) as attempts FROM animals WHERE date_of_birth 
BETWEEN DATE '1990-01-01' AND '2000-12-31' GROUP BY species;



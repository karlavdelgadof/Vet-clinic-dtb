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
SELECT species from animals;
-- roll back the transaction
ROLLBACK;
SELECT species from animals;


-- TRANSACTION #2 

BEGIN;

-- set the species column to digimon for all animals that have a name ending in mon
UPDATE animals
SET species = 'digimon' WHERE name LIKE '%mon';

-- set the species column to pokemon for all animals that don't have species already set.
UPDATE animals
SET species = 'pokemon' WHERE species IS NULL;
SELECT species from animals;
-- commit the transactions
COMMIT;
SELECT species from animals;

-- TRANSACTION #3
BEGIN;

-- delete all records in the animals table
DELETE FROM animals;

SELECT COUNT(*) FROM ANIMALS;
-- roll back the transaction
ROLLBACK;
SELECT COUNT(*) FROM ANIMALS;

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

/* Wednesday queries */
SELECT name FROM animals JOIN owners ON owner_id = owners.id WHERE full_name = 'Melody Pond';
SELECT animals.name FROM animals JOIN species ON species_id = species.id WHERE species.name = 'Pokemon';
SELECT animals.name AS animal_name, owners.full_name AS owner_name FROM owners LEFT JOIN animals ON owners.id = owner_id;
SELECT species.name, COUNT(*) FROM animals JOIN species ON species_id = species.id GROUP BY species.name;
SELECT owners.full_name AS owner, animals.name AS digimon_animals FROM animals JOIN owners ON owner_id = owners.id WHERE species_id = 2 AND owners.full_name = 'Jennifer Orwell';
SELECT owners.full_name AS owner, animals.name AS non_escape_attempts FROM animals JOIN owners ON owner_id = owners.id WHERE escape_attempts = 0 AND owners.full_name = 'Dean Winchester';
SELECT COUNT(animals.name) AS number_of_animals, owners.full_name FROM animals JOIN owners ON animals.owner_id = owners.id GROUP BY owners.full_name ORDER BY number_of_animals DESC LIMIT 1;





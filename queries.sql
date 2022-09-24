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



/* Thursday queries */
SELECT animals.name AS animals_seen, vets.name AS vet, visits.visit_date AS date FROM animals JOIN visits ON animal_id = visits.animal_id JOIN vets ON visits.vet_id = vets.id WHERE vets.name = 'William Tatcher' ORDER BY visits.visit_date DESC LIMIT 1

SELECT COUNT(DISTINCT animals.name) AS total_animals, COUNT(DISTINCT animals.species_id) AS types_seen, vets.name AS vet FROM animals JOIN visits ON visits.animal_id = animals.id JOIN vets ON visits.vet_id = vets.id WHERE vets.name = 'Stephanie Mendez' GROUP BY vets.name;

SELECT vets.name AS vet_name, species.name FROM vets LEFT JOIN specializations ON specializations.vet_id = vets.id LEFT JOIN species ON specializations.species_id = species.id;

SELECT animals.name AS animals, vets.name As vet_name FROM animals JOIN visits ON visits.animal_id = animals.id JOIN vets ON visits.vet_id = vets.id WHERE visit_date BETWEEN DATE '2020-04-01' AND '2020-08-30' AND vets.name = 'Stephanie Mendez';

SELECT animals.name, COUNT(visit_date) AS number_of_visits FROM visits JOIN animals ON visits.animal_id = animals.id GROUP BY animals.name ORDER BY number_of_visits DESC LIMIT 1;

SELECT animals.name AS animal, visits.visit_date AS v_date FROM animals JOIN visits ON visits.animal_id = animals.id JOIN vets ON visits.vet_id = vets.id WHERE vets.name = 'Maisy Smith' ORDER BY visit_date ASC LIMIT 1;

SELECT animals.name AS animal, animals.date_of_birth,
animals.escape_attempts, animals.neutered, 
animals.weight_kg, species.name AS species,
owners.full_name AS owner, vets.name AS vet_name, vets.age,
vets.date_of_graduation AS grad_day,
visits.visit_date FROM animals
JOIN visits ON  animals.id = visits.animal_id
JOIN vets ON visits.vet_id = vets.id
JOIN species ON animals.species_id = species.id
JOIN owners ON animals.owner_id = owners.id
ORDER BY visits.visit_date DESC LIMIT 1;

SELECT COUNT(visits.animal_id) FROM visits JOIN animals 
ON animals.id = visits.animal_id
JOIN vets ON vets.id = visits.vet_id
WHERE animals.species_id NOT IN (
    SELECT species_id FROM specializations 
    WHERE vet_id = vets.id
    );

SELECT species.name, COUNT(animals.species_id) FROM visits
JOIN animals ON animals.id = visits.animal_id
JOIN species ON species.id = animals.species_id
JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name
ORDER BY COUNT(animals.species_id) DESC
LIMIT 1;





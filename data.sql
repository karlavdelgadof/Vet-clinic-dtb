/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', '2020-02-03', 0, true, 10.23);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', '2018-11-15', 2, true, 8);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', '2021-06-07', 1, false, 15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', '2017-05-12', 5, true, 11);

/* Insert new animals (Tuesday) */
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
  VALUES ('Charmander', '2020-02-08', 0, false, -11),
  ('Plantmon', '2021-11-15', 2, true, -5.7),
  ('Squirtle', '1993-04-02', 3, false, -12.13),
  ('Angemon', '2005-06-12', 1, true, -45),
  ('Boarmon', '2005-06-07', 7, true, 20.4),
  ('Blossom', '1998-10-13', 3, true, 17),
  ('Ditto', '2022-05-14', 4, true, 22);


/* Insert owners' table data */
INSERT INTO owners (full_name, age) 
  VALUES ('Sam Smith', 34),
  ('Jennifer Orwell', 19),
  ('Bob', 45),
  ('Melody Pond', 77),
  ('Dean Winchester', 14),
  ('Jodie Whittaker', 38);

/* Insert species' table data */
INSERT INTO species (name) 
  VALUES ('Pokemon'),
  ('Digimon');

UPDATE animals
vet_clinic-# SET species_id = 2
vet_clinic-# WHERE name LIKE '%mon';
UPDATE 6
vet_clinic=# UPDATE animals
SET species_id = 1
WHERE name NOT LIKE '%mon';

UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = 3 WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owner_id = 4 WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id = 5 WHERE name IN ('Angemon', 'Boarmon');

/*Insert data for vets table*/
INSERT INTO vets (name, age, date_of_graduation)                                                    
  VALUES('William Tatcher', 45, '2000-04-23'),
      ('Maisy Smith', 26, '2019-01-17'),
      ('Stephanie Mendez', 64, '1981-05-04'),
      ('Jack Harkness', 38, '2008-06-08');

/*Insert data for specializations table*/
INSERT INTO specializations (vet_id, species_id) 
  VALUES ((SELECT id FROM vets WHERE name = 'William Tatcher'),(SELECT id FROM species WHERE name = 'Pokemon')),
    ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'),(SELECT id FROM species WHERE name = 'Pokemon')),
    ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'),(SELECT id FROM species WHERE name = 'Digimon')),
    ((SELECT id FROM vets WHERE name = 'Jack Harkness'),(SELECT id FROM species WHERE name = 'Digimon'));

/*Insert data for visits table*/

INSERT INTO visits (animal_id, vet_id, visit_date) 
  VALUES ((SELECT id FROM animals WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'William Tatcher'), '2020-05-24'),
       ((SELECT id FROM animals WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2020-07-22'),
       ((SELECT id FROM animals WHERE name = 'Gabumon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2021-02-02'),
       ((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-01-05'),
       ((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-03-08'),
       ((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-05-14'),
       ((SELECT id FROM animals WHERE name = 'Devimon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2021-05-04'),
      ((SELECT id FROM animals WHERE name = 'Charmander'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2021-02-24'),
      ((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-12-21'),
      ((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'William Tatcher'), '2020-08-10'),
      ((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2021-04-07'),
      ((SELECT id FROM animals WHERE name = 'Squirtle'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2019-09-29'),
      ((SELECT id FROM animals WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2020-10-03'),
      ((SELECT id FROM animals WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2020-11-04'),
      ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-01-24'),
      ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-05-15'),
      ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-02-27'),
      ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-08-03'),
      ((SELECT id FROM animals WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2020-05-24'),
      ((SELECT id FROM animals WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'William Tatcher'), '2021-01-11');



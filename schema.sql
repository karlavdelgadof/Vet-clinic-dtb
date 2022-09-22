/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id BIGSERIAL NOT NULL PRIMARY KEY, /* For PostgreSQL version purposes I'll be implementing this sequential type instead of IDENTITY(1,1); */
    name VARCHAR(100),
    date_of_birth DATE NOT NULL,
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL
);

/* Add new column species */
ALTER TABLE animals ADD species VARCHAR(150);

/* Create new owners table */
CREATE TABLE owners (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    full_name VARCHAR(180),
    age INT NOT NULL;
);

/* Create new species table */
CREATE TABLE species (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(100),
);

/* Drop species_id column*/
ALTER TABLE animals DROP COLUMN species_id;

/* Add column species_id which is a foreign key referencing species table */
ALTER TABLE animals ADD species_id INT
ALTER TABLE animals ADD FOREIGN KEY(species_id) REFERENCES species(id);

/* Add column owner_id which is a foreign key referencing the owners table */
ALTER TABLE animals ADD owner_id INT;
ALTER TABLE animals ADD FOREIGN KEY(owner_id) REFERENCES owners(id);


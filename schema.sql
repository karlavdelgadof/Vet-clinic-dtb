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

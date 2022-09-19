/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT NOT NULL PRIMARY KEY,
    name VARCHAR(100),
    date_of_birth DATE NOT NULL,
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL
);

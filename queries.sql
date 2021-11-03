/*Queries that provide answers to the questions from all projects.*/

select * from animals where name like '%mon';
select name from animals where  date_of_birth between '20160101' and '20191231';
select name from animals where  neutered = true and escape_attemps <= 3;
select date_of_birth from animals where  name = 'Agumon' or name = 'Pikachu';
select name, escape_attemps from animals where weight_kg > 10.5;
select * from animals where neutered = true;
select * from animals where name not like 'Gabumon';
select * from animals where weight_kg between 10.4 and 17.3;

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species = '';
COMMIT;

BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '20220101';
savepoint sp1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO sp1;
UPDATE animals SET weight_kg = weight_kg * -1 where weight_kg < 0;
COMMIT;

SELECT count(*) FROM animals;
SELECT count(*) FROM animals WHERE escape_attempts < 1;
SELECT avg(weight_kg) FROM animals;
SELECT neutered, sum(escape_attempts) FROM animals GROUP BY neutered ORDER BY sum DESC;
SELECT species, min(weight_kg), max(weight_kg) FROM animals GROUP BY species;
SELECT species, avg(escape_attempts) FROM animals WHERE extract(year FROM date_of_birth) BETWEEN 1990 AND 2000 GROUP BY species;

/* Populate database with sample data. */

INSERT INTO animals values(default, 'Agumon', '20200203', 0, false, 10.23);
INSERT INTO animals values(default, 'Gabumon', '20181115', 2, true, 8.0);
INSERT INTO animals values(default, 'Pikachu', '20210107', 1, false, 15.04);
INSERT INTO animals values(default, 'Devimon', '20170512', 5, true, 11.0);

INSERT INTO animals values(default, 'Squirtle', '20200208', 0, false, -11.0);
INSERT INTO animals values(default, 'Plantmon', '20221115', 2, true, -5.7);
INSERT INTO animals values(default, 'Squirtle', '19930402', 3, false, -12.3);
INSERT INTO animals values(default, 'Angemon', '20050612', 1, true, -45.0);
INSERT INTO animals values(default, 'Boarmon', '20050607', 7, true, 20.4);
INSERT INTO animals values(default, 'Blossom', '19981013', 3, true, 17.0);

INSERT INTO owners values(default, 'Sam Smith', 34);
INSERT INTO owners values(default, 'Jennifer Orwell', 19);
INSERT INTO owners values(default, 'Bob', 45);
INSERT INTO owners values(default, 'Melody Pond', 77);
INSERT INTO owners values(default, 'Dean Winchester', 14);
INSERT INTO owners values(default, 'Jodie Whittaker', 38);

INSERT INTO species values('Pokemon');
INSERT INTO species values ('Digimon');

UPDATE animals
SET species_id = species.id
FROM species
WHERE animals.name LIKE '%mon'
  AND species.name LIKE 'Digimon';

UPDATE animals
SET species_id = species.id
FROM species
WHERE animals.species_id IS NULL
  AND species.name LIKE 'Pokemon';

UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animals.name = 'Agumon'
  AND owners.full_name = 'Sam Smith';

UPDATE animals
SET owner_id = owners.id
FROM owners 
WHERE animals."name" = 'Gabumon' 
	AND owners.full_name = 'Jennifer Orwell'
	OR animals."name" = 'Pikachu' 
	AND owners.full_name = 'Jennifer Orwell';

UPDATE animals
SET owner_id = owners.id
FROM owners 
WHERE animals."name" = 'Devimon' 
	AND owners.full_name = 'Bob'
	OR animals."name" = 'Plantmon' 
	AND owners.full_name = 'Bob';

UPDATE animals
SET owner_id = owners.id
FROM owners 
WHERE animals."name" = 'Charmander' 
	AND owners.full_name = 'Melody Pond'
	OR animals."name" = 'Squirtle' 
	AND owners.full_name = 'Melody Pond'
	OR animals."name" = 'Blossom' 
	AND owners.full_name = 'Melody Pond';

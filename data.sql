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

INSERT INTO species values(default, 'Pokemon');
INSERT INTO species values (default, 'Digimon');

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

INSERT INTO vets values(default, 'William Tatcher', 45,'20000423');
INSERT INTO vets values(default, 'Maisy Smith', 26,'20190117');
INSERT INTO vets values(default, 'Stephanie Mendez', 64,'19810504');
INSERT INTO vets values(default, 'Jack Harkness', 38,'20080608');

INSERT INTO specializations (vets_id, species_id)
SELECT v.id, s.id
FROM vets v
JOIN species s
ON v.name = 'William Tatcher' AND s.name = 'Pokemon';

INSERT INTO specializations (vets_id, species_id)
SELECT v.id, s.id
FROM vets v
JOIN species s
ON v.name = 'Stephanie Mendez' AND s.name = 'Pokemon';

INSERT INTO specializations (vets_id, species_id)
SELECT v.id, s.id
FROM vets v
JOIN species s
ON v.name = 'Stephanie Mendez' AND s.name = 'Digimon';

INSERT INTO specializations (vets_id, species_id)
SELECT v.id, s.id
FROM vets v
JOIN species s
ON v.name = 'Jack Harkness' AND s.name = 'Digimon';

INSERT INTO visits (vets_id, animals_id , date_of_visit) 
SELECT v.id, a.id, '20200524' 
FROM vets v 
JOIN animals a 
ON v.name = 'William Tatcher' AND a.name = 'Agumon';

INSERT INTO visits (vets_id, animals_id , date_of_visit) 
SELECT v.id, a.id, '20200622' 
FROM vets v 
JOIN animals a 
ON v.name = 'Stephanie Mendez' AND a.name = 'Agumon';

INSERT INTO visits (vets_id, animals_id , date_of_visit) 
SELECT v.id, a.id, '20210202' 
FROM vets v 
JOIN animals a 
ON v.name = 'Jack Harkness' AND a.name = 'Gabumon';

INSERT INTO visits (vets_id, animals_id , date_of_visit) 
SELECT v.id, a.id, '20200105' 
FROM vets v 
JOIN animals a 
ON v.name = 'Maisy Smith' AND a.name = 'Pikachu';

INSERT INTO visits (vets_id, animals_id , date_of_visit) 
SELECT v.id, a.id, '20200308' 
FROM vets v 
JOIN animals a 
ON v.name = 'Maisy Smith' AND a.name = 'Pikachu';

INSERT INTO visits (vets_id, animals_id , date_of_visit) 
SELECT v.id, a.id, '20200514' 
FROM vets v 
JOIN animals a 
ON v.name = 'Maisy Smith' AND a.name = 'Pikachu';

INSERT INTO visits (vets_id, animals_id , date_of_visit) 
SELECT v.id, a.id, '20210504' 
FROM vets v 
JOIN animals a 
ON v.name = 'Stephanie Mendez' AND a.name = 'Devimon';

INSERT INTO visits (vets_id, animals_id , date_of_visit) 
SELECT v.id, a.id, '20210224' 
FROM vets v 
JOIN animals a 
ON v.name = 'Jack Harkness' AND a.name = 'Charmander';

INSERT INTO visits (vets_id, animals_id , date_of_visit) 
SELECT v.id, a.id, '20191221' 
FROM vets v 
JOIN animals a 
ON v.name = 'Maisy Smith' AND a.name = 'Plantmon';

INSERT INTO visits (vets_id, animals_id , date_of_visit) 
SELECT v.id, a.id, '20200810' 
FROM vets v 
JOIN animals a 
ON v.name = 'William Tatcher' AND a.name = 'Plantmon';

INSERT INTO visits (vets_id, animals_id , date_of_visit) 
SELECT v.id, a.id, '20210407' 
FROM vets v 
JOIN animals a 
ON v.name = 'Maisy Smith' AND a.name = 'Plantmon';

INSERT INTO visits (vets_id, animals_id , date_of_visit) 
SELECT v.id, a.id, '20190929' 
FROM vets v 
JOIN animals a 
ON v.name = 'Stephanie Mendez' AND a.name = 'Squirtle';

INSERT INTO visits (vets_id, animals_id , date_of_visit) 
SELECT v.id, a.id, '20201003' 
FROM vets v 
JOIN animals a 
ON v.name = 'Jack Harkness' AND a.name = 'Angemon';

INSERT INTO visits (vets_id, animals_id , date_of_visit) 
SELECT v.id, a.id, '20201104' 
FROM vets v 
JOIN animals a 
ON v.name = 'Jack Harkness' AND a.name = 'Angemon';

INSERT INTO visits (vets_id, animals_id , date_of_visit) 
SELECT v.id, a.id, '20190124' 
FROM vets v 
JOIN animals a 
ON v.name = 'Maisy Smith' AND a.name = 'Boarmon';

INSERT INTO visits (vets_id, animals_id , date_of_visit) 
SELECT v.id, a.id, '20190515' 
FROM vets v 
JOIN animals a 
ON v.name = 'Maisy Smith' AND a.name = 'Boarmon';

INSERT INTO visits (vets_id, animals_id , date_of_visit) 
SELECT v.id, a.id, '20200227' 
FROM vets v 
JOIN animals a 
ON v.name = 'Maisy Smith' AND a.name = 'Boarmon';

INSERT INTO visits (vets_id, animals_id , date_of_visit) 
SELECT v.id, a.id, '20200803' 
FROM vets v 
JOIN animals a 
ON v.name = 'Maisy Smith' AND a.name = 'Boarmon';

INSERT INTO visits (vets_id, animals_id , date_of_visit) 
SELECT v.id, a.id, '20200524' 
FROM vets v 
JOIN animals a 
ON v.name = 'Stephanie Mendez' AND a.name = 'Blossom';

INSERT INTO visits (vets_id, animals_id , date_of_visit) 
SELECT v.id, a.id, '20210111' 
FROM vets v 
JOIN animals a 
ON v.name = 'William Tatcher' AND a.name = 'Blossom';


-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animals_id, vets_id, date_of_visit)
SELECT * FROM (SELECT id FROM animals) animals_ids,
(SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email)
select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';

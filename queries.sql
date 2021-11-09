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
DELETE FROM animals WHERE date_of_birth > '2022/01/01';
savepoint sp1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO sp1;
UPDATE animals SET weight_kg = weight_kg * -1 where weight_kg < 0;
COMMIT;

SELECT count(*) FROM animals;
SELECT count(*) FROM animals WHERE escape_attempts < 1;
SELECT avg(weight_kg) FROM animals;
SELECT neutered, AVG(escape_attemps) FROM animals GROUP BY neutered;
SELECT species, min(weight_kg), max(weight_kg) FROM animals GROUP BY species;
SELECT species, avg(escape_attempts) FROM animals WHERE extract(year FROM date_of_birth) BETWEEN 1990 AND 2000 GROUP BY species;

SELECT name
FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';

SELECT animals.name
FROM animals
JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

SELECT owners.full_name, animals.name 
FROM owners
LEFT JOIN animals ON owners.id = owner_id

SELECT species.name, count(*) 
from animals
join species on animals.species_id = species.id 
group by species.name

SELECT animals.name 
from animals
join species on species_id = species.id
join owners on owner_id = owners.id 
where owners.full_name = 'Jennifer Orwell' and species."name" = 'Digimon'

select name 
from animals 
join owners on owner_id = owners.id
where escape_attemps < 1 and owners.full_name = 'Dean Winchester';

select y.full_name, y.max_animal
from (select x.full_name, max(x.count_animals) as max_animal
	from (select full_name, count(*) as count_animals
		from owners
		join animals on owners.id = animals.owner_id
		group by full_name) x
	group by x.full_name) y 
where y.max_animal = (select max(x.count_animals)
	from (select full_name, count(*) as count_animals
		from owners
		join animals on owners.id = animals.owner_id
		group by full_name) x);

select a.name, v.date_of_visit 
from animals a 
join visits v on a.id = v.animals_id
join vets v2 on v.vets_id = v2.id
where v2.name = 'William Tatcher'
and v.date_of_visit = (select max(visits.date_of_visit)
		from animals  
		join visits on animals.id = visits.animals_id
		join vets on visits.vets_id = vets.id
		where vets.name = 'William Tatcher');

select count(distinct v.animals_id)
from visits v
join vets v2 on v.vets_id = v2.id
where v2."name" = 'Stephanie Mendez';

select v.name, s2.name
from vets v 
left join specializations s on v.id = s.vets_id 
left join species s2 on s.species_id = s2.id;

select a.name
from animals a 
join visits v on a.id = v.animals_id
join vets v2 on v.vets_id = v2.id
where v2.name = 'Stephanie Mendez' 
and v.date_of_visit between '20200401' and '20200830';

select resmax.name, resmax.animal_visits
from (select a.name, count(v.animals_id) as animal_visits
	from animals a 
	join visits v on a.id = v.animals_id
	group by a.name) as resmax
where resmax.animal_visits = (select max(rescount.visits)
	from (select count(v.animals_id) as visits
		from animals a 
		join visits v on a.id = v.animals_id
		group by a.name) as rescount);

select a.name, v.date_of_visit 
from animals a
join visits v on a.id = v.animals_id
join vets v2 on v.vets_id = v2.id
where v2.name = 'Maisy Smith'
and v.date_of_visit = (select min(visits.date_of_visit)
	from animals a2 
	join visits on a2.id = visits.animals_id
	join vets on visits.vets_id = vets.id
	where vets.name = 'Maisy Smith');

select a, v2, v.date_of_visit 
from animals a
join visits v on a.id = v.animals_id
join vets v2 on v.vets_id = v2.id
where v.date_of_visit = (select max(visits.date_of_visit)
	from animals a2 
	join visits on a2.id = visits.animals_id
	join vets on visits.vets_id = vets.id);

select count(*)
from visits v
left join animals a on a.id = v.animals_id
left join vets v2 on v2.id = v.vets_id 
where a.species_id not in (select a.species_id 
	from specializations s
	where s.vets_id = v2.id)

select s1.name, count(*)
from visits v
left join animals a on a.id = v.animals_id
left join vets v2 on v2.id = v.vets_id 
left join species s1 on a.species_id = s1.id 
where v2.name = 'Maisy Smith'
group by s1.name


EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animals_id = 4;
EXPLAIN ANALYZE SELECT * FROM visits where vets_id = 2;
EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';


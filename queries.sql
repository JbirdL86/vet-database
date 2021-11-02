/*Queries that provide answers to the questions from all projects.*/

select * from animals where name like '%mon';
select name from animals where  date_of_birth between '20160101' and '20191231';
select name from animals where  neutered = true and escape_attemps <= 3;
select date_of_birth from animals where  name = 'Agumon' or name = 'Pikachu';
select name, escape_attemps from animals where weight_kg > 10.5;
select * from animals where neutered = true;
select * from animals where name not like 'Gabumon';
select * from animals where weight_kg between 10.4 and 17.3;
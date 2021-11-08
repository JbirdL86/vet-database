/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(250), date_of_birth DATE,
  escape_attemps INT,
  neutered Boolean,
  weight_kg DECIMAL(10,2),
  PRIMARY KEY(id)
);

alter table animals add species varchar(250);

CREATE TABLE owners(
  id INT GENERATED ALWAYS AS IDENTITY,
  full_name VARCHAR(250),
  age INT,
  PRIMARY KEY(id)
);

CREATE TABLE species(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(250),
  PRIMARY KEY(id)
);

alter table animals drop column species;

alter table animals	
	add column species_id INT
references species(id);

alter table animals	
	add column owner_id INT
references owners(id);

CREATE TABLE vets(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(250),
  age INT,
  date_of_graduation DATE,
  PRIMARY KEY(id)
);

CREATE TABLE specializations (
	vets_id INT NOT NULL,
	species_id INT NOT NULL,
	FOREIGN KEY (vets_id) REFERENCES vets (id),
	FOREIGN KEY (species_id) REFERENCES species (id),
	PRIMARY KEY (vets_id, species_id)
);

CREATE TABLE visits (
	vets_id INT NULL,
	animals_id INT NULL,
	date_of_visit DATE NULL,
	FOREIGN KEY (vets_id) REFERENCES vets (id),
	FOREIGN KEY (animals_id) REFERENCES animals (id),
);

ALTER TABLE owners ADD COLUMN email VARCHAR(120);
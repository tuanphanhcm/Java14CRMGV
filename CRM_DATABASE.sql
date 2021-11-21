CREATE DATABASE crm_app;

USE crm_app;

CREATE TABLE IF NOT EXISTS crm_user (
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
	email VARCHAR(100) NOT NULL unique,
	password VARCHAR(255) NOT NULL,
	phone VARCHAR(36),
	address VARCHAR(255),
	role_id INT NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS crm_role (
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
	description VARCHAR(255),
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS crm_project (
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
	description VARCHAR(255),
	start_date date,
	end_date date,
	user_id INT NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS crm_status (
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
	description VARCHAR(255),
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS crm_task (
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
	description VARCHAR(255),
	start_date date,
	end_date date,
	user_id INT NOT NULL,
	status_id INT NOT NULL,
	project_id INT NOT NULL,
	PRIMARY KEY (id)
);

ALTER TABLE crm_user ADD CONSTRAINT fk_user_role_id FOREIGN KEY (role_id) REFERENCES crm_role (id);
ALTER TABLE crm_project ADD CONSTRAINT fk_project_user_id FOREIGN KEY (user_id) REFERENCES crm_user (id);
ALTER TABLE crm_task ADD CONSTRAINT fk_task_user_id FOREIGN KEY (user_id) REFERENCES crm_user (id);
ALTER TABLE crm_task ADD CONSTRAINT fk_task_status_id FOREIGN KEY (status_id) REFERENCES crm_status (id);
ALTER TABLE crm_task ADD CONSTRAINT fk_task_project_id FOREIGN KEY (project_id) REFERENCES crm_project (id);

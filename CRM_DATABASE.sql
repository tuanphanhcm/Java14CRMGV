create database if not exists crm;

use crm;

create table crm_role(
	id 				int auto_increment,
    name 			varchar(255) not null,
    description 	varchar(255),
    primary key (id)
);

create table crm_status(
	id 				int auto_increment,
    name 			varchar(255) not null,
    description 	varchar(255),
    primary key (id)
);

create table crm_user(
	id 				int auto_increment,
    name 			varchar(255) not null,
    email 			varchar(100) not null,
    password 		varchar(255) not null,
    phone 			varchar(36),
    address 		varchar(255),
    role 			int,
    primary key (id)
);

create table crm_task(
	id 				int auto_increment,
    assignee 		int,
    name 			varchar(255) not null,
    description 	varchar(255),
    start_date		date,
    end_date		date,
    project			int,
    status			int,
    primary key (id)
);

create table crm_project(
	id				int auto_increment,
    name 			varchar(255) not null,
    description 	varchar(255),
    start_date		date,
    end_date		date,
    create_user		int,
    primary key (id)
);

alter table crm_user add constraint fk_user_role foreign key (role) references crm_role (id);
alter table crm_project add constraint fk_project_create_user foreign key (create_user) references crm_user (id);
alter table crm_task add constraint fk_task_assignee_user foreign key (assignee) references crm_user (id);
alter table crm_task add constraint fk_task_status foreign key (status) references crm_status (id);
alter table crm_task add constraint fk_task_project foreign key (project) references crm_project (id);
CREATE TABLE authors
(
    id serial PRIMARY KEY,
    first_name varchar(255),
    last_name  varchar(255)
);

insert into authors(first_name, last_name) values ('Vicente', 'Fernandez');
insert into authors(first_name, last_name) values ('Ted', 'Corleon');
insert into authors(first_name, last_name) values ('Henry', 'Ferris');
insert into authors(first_name, last_name) values ('Sin', 'Esperanza');


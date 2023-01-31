ALTER TABLE books
    ADD author_id integer,
DROP COLUMN author
;


alter table books
    add constraint author_id
        foreign key (author_id)
            references authors (id);

update books
set author_id = 1
where id = 1;
update books
set author_id = 2
where id = 2;
update books
set author_id = 3
where id = 3;
update books
set author_id = 4
where id = 4;
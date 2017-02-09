create sequence sec_pelicula
start with 1
increment by 1
nomaxvalue;

create sequence sec_horario
start with 1
increment by 1
nomaxvalue;


CREATE TABLE pelicula (id_pelicula integer, titulo varchar2(40), sinopsis varchar2(300),
constraint pk_id_pelicula primary key(id_pelicula));

CREATE TABLE salas (num_sala integer,id_pelicula integer,
constraint pk_salas primary key(num_sala),
constraint fk1_id_pelicula foreign key(id_pelicula) references pelicula(id_pelicula));

CREATE TABLE horarios (id_horario integer, id_pelicula integer, fecha date,
constraint pk_horarios primary key(id_horario),
constraint fk2_id_pelicula foreign key(id_pelicula) references pelicula(id_pelicula));


--procedimientos

create or replace procedure guardar_pelicula (my_id_pelicula out integer, my_titulo in varchar2, my_sinopsis in varchar2) as
begin
select sec_pelicula.nextval into my_id_pelicula from dual;
insert into pelicula values(my_id_pelicula, my_titulo, my_sinopsis);
end;
/

create or replace procedure guardar_salas (my_num_sala in integer, my_id_pelicula in integer) as
begin
insert into salas values(my_num_sala, my_id_pelicula);
end;
/

create or replace procedure guardar_horarios (my_id_horarios out integer, my_id_pelicula in integer, my_fecha in date) as
begin
select sec_horarios.nextval into my_id_horarios from dual;
insert into horarios values (my_id_horarios, my_id_pelicula, my_fecha);
end;
/

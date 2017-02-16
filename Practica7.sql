create table trabajador(seguro integer primary key, nombre varchar2(25), edad integer);create table nomina (id_nomina integer, seguro integer, sueldo_base float, horas_laboradas integer, fecha_pago date,constraint pk_id_nomina primary key (id_nomina),constraint fk1_seguro foreign key(seguro) references trabajador(seguro));--create sequence sec_nominastart with 1increment by 1nomaxvalue;create or replace procedure guardar_nomina(my_id_nomina out integer, my_seguro in integer, my_sueldo_base in integer) asbeginselect sec_nomina.nextval into my_id_nomina from dual;insert into nomina(id_nomina, seguro, sueldo_base)values(my_id_nomina, my_seguro, my_sueldo_base);end;/create or replace procedure generar_trabajador(my_seguro in integer, my_nombre in varchar2,my_edad in integer,my_id_nomina out integer, my_sueldo_base in float) asbegininsert into trabajador values(my_seguro, my_nombre, my_edad);guardar_nomina(my_id_nomina, my_seguro, my_sueldo_base);end;/--guardamos el valor del id nomina para que no se autogeneredeclare valor integer;begin generar_trabajador(1,'ana',28,valor,6000);generar_trabajador(2,'pedro',20,valor,8000);generar_trabajador(3,'luis',45,valor,7000);generar_trabajador(4,'jose',70,valor,10000);end;/update nomina set horas_laboradas(seguro, horas)where seguro=1;

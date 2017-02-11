CREATE TABLE dance (id_dance integer, nombre varchar2(20), edad integer,
constraint pk_id_dance primary key(id_dance));

insert into dance values(1, 'juan', 16);

insert into dance values(2, 'pedro', 20);

insert into dance values(3, 'luis', 45);

insert into dance values(4, 'jose', 70);


select * from dance;


--imprimir el nombre y la edad del cliente, si el cliente es menor de 18 años debe aparecer en una nueva columna "precoz" y 
--si es mayor de edad una nueva columna "viejo"
set serveroutput on;

DECLARE
estatus varchar2(20);
cursor cur1 is select * from dance;
begin
dbms_output.put_line('nombre    edad    estatus');
dbms_output.put_line('---------------------------');
for rec in cur1 loop
if rec.edad <18 then 
estatus:= 'precoz';
dbms_output.put_line(' '|| rec.nombre || '  ' || rec.edad || '  ' || estatus);
else
estatus:= 'viejo';
dbms_output.put_line(' '|| rec.nombre || '  ' || rec.edad || '  ' || estatus);
end if;
end loop;
end;
/

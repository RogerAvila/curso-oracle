Generar un disparador que haga lo siguiente: Al guardar un registro en la tabla PAPA 
verificar si la edad es mayor a 18, si es asi guardar el registro ademas en la tabla 
hijomayor. Si la edad es menor de 18, guardar el registro en la tabla hijomenor

create or replace trigger disp_papa after insert on papa
for each row 
begin
--la logica va despues del begin
if :new.edad > 18 then 
insert into hijomayor values (:new.id, :new.nombre, new.edad);
else
insert into hijomenor values (:new.id, :new.nombre, new.edad);
end if;
end;
/


Probar que el disparador funcione correctamente insertar registros con edades mayor a 18
y menores a 18 unicamente en la tabla PAPA efectuar select para comprobar funcionalidad.

insert into papa values (1,'juan',23);
insert into papa values (2,'ana',15);

select * from papa;
select * from hijomayor;
select * from hijomenor;

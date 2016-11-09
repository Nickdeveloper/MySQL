create database HomeDepot;
use HomeDepot;
select* from HomeDepot;

delimiter $
create procedure punto_uno(in nomEdo varchar(40))
begin

select Asociado.nombre,Asociado.tel from Asociado,HomeDepot where Asociado.HomeDepot_idHD=HomeDepot.idHD and HomeDepot.estado like nomEdo;

end $ 

delimiter ;
call punto_uno('DF');

delimiter $
create procedure punto_dos(in nomEdo varchar(40))
begin 

select Socio.nombre,Socio.credito,Tarjeta.nombre as Nombre_tarjeta from Socio,Tarjeta,HdSocio,HomeDepot where HomeDepot.idHD=HdSocio.HomeDepot_idHD and HdSocio.Socio_idSocio=Socio.idSocio and Socio.idSocio=Tarjeta.Socio_idSocio and HomeDepot.estado like nomEdo;
end $

delimiter ;
drop procedure punto_dos;
call punto_dos('DF');
select* from Socio;
select*from HomeDepot where nombre like 'Los Mochis';

delimiter $

create procedure punto_tres(in apellido varchar(50))
begin
	delete from socio where nombre like concat(apellido,'%');
end $


create procedure punto_cuatro()
begin 

select count(Socio.idSocio) as numero_socios from Socio,HdSocio,HomeDepot where HomeDepot.idHD=HdSocio.HomeDepot_idHD and HdSocio.Socio_idSocio=Socio.idSocio and HomeDepot.nombre like 'Los Mochis';
select Socio.nombre from Socio,HdSocio,HomeDepot where HomeDepot.idHD=HdSocio.HomeDepot_idHD and HdSocio.Socio_idSocio=Socio.idSocio and HomeDepot.nombre like 'Los Mochis';

end$

create procedure punto_cinco(in nomHD varchar(60))
begin 
select Depto.nombre from Depto,HdDepto,HomeDepot where Depto.idDepto=HdDepto.Depto_idDepto and HdDepto.HomeDepot_idHD=HomeDepot.idHD and HomeDepot.nombre like nomHD; 


end $

create procedure punto_seis(in nomTarjeta varchar(50))
begin
select count(socio.idSocio) as Numero_socios from Socio,Tarjeta where Socio.idSocio=Tarjeta.Socio_idSocio and Tarjeta.nombre like nomTarjeta;

end $


delimiter ;
select * from Tarjeta;
select distinct nombre from Tarjeta;
drop procedure punto_seis;
call punto_tres('ARROYO');
call punto_cuatro();
call punto_cinco('Tijuana');
call punto_seis('CREDITO');
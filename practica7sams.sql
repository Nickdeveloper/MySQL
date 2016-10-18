create database sams;
use sams;
show tables;

#------------------------------------------------------------------------------------------------
delimiter #
show tables #

create procedure proc_uno()
begin
	select count(idGerente) as total_en_gerentes from gerente;
	select club.nombre,socio.nombre, estado.nombre from club,socioclub,socio,estado where club.idClub=socioclub.idClub and socio.idSocio=socioclub.idSocio and club.idEdo=estado.idEdo and estado.nombre like 'M%xico';
	select club.nombre from club,servicioclub,servicio where club.idClub=servicioclub.idClub and servicioclub.idServicio=servicio.idServicio and servicio.nombre='APPLE SHOP';
end #

create procedure proc_unopuntouno(in nombreSer varchar (30))

begin
	select count(idGerente) as total_en_gerentes from gerente;
	select club.nombre,socio.nombre, estado.nombre from club,socioclub,socio,estado where club.idClub=socioclub.idClub and socio.idSocio=socioclub.idSocio and club.idEdo=estado.idEdo and estado.nombre like 'M%xico';
	select club.nombre from club,servicioclub,servicio where club.idClub=servicioclub.idClub and servicioclub.idServicio=servicio.idServicio and servicio.nombre like nombreSer;
end #

delimiter ;
select nombre from servicio;
call proc_uno();
call proc_unopuntouno('Farmacia');
select gerente.nombre from gerente,club where gerente.idClub=club.idClub and club.nombre='TOLUCA';
desc proveedor;

#----------------------------------------------------------------------------------------------
delimiter # 

create procedure proc_dos(in nombrePr varchar(45))
begin
	select gerente.nombre from gerente,club where gerente.idClub=club.idClub and club.nombre='TOLUCA';
	select servicio.nombre from servicio,club,servicioclub where club.idClub=servicioclub.idClub and servicioclub.idServicio=servicio.idServicio and club.nombre='TOLUCA'; 
	select proveedor.nombre from club inner join proveedorsams on club.idClub=proveedorsams.idClub inner join proveedor on proveedorsams.idProveedor=proveedor.idProveedor where club.nombre like nombrePr;
end #

delimiter ;

call proc_dos('TOLUCA');
select * from proveedor;
#---------------------------------------------------------------------------------------------

delimiter $
create procedure proc_tres()
begin
	select nombre from socio where nombre like '%Gonzalez%';
	select count(idSocio) as numero_socios from socio;
	select producto.nombre, producto.precioUnitario from producto inner join proveedor on producto.idProveedor= proveedor.idProveedor and proveedor.nombre='Sabritas';
	select club.nombre,gerente.nombre,proveedor.nombre from proveedor,gerente,proveedorsams,estado,club where proveedor.idProveedor=proveedorsams.idProveedor and proveedorsams.idClub = club.idClub and club.idClub = gerente.idClub and club.idEdo=estado.idEdo and estado.nombre='Chiapas';

end $

delimiter ;
call proc_tres();
#-------------------------------------------------------------------------------------------------------
delimiter 7 
create procedure proc_cuatro()
begin
	select club.nombre, count(socio.idSocio) as numero_socios from club inner join socioclub on club.idClub = socioclub.idClub inner join socio on socioclub.idSocio = socio.idSocio group by club.nombre; 
end 7

#-------------------------------------------------------------------------------------------------
delimiter 7 
create procedure proc_cuatro_mejorado()
begin
	select club.nombre, count(socio.idSocio) as numero_socios from club inner join socioclub on club.idClub = socioclub.idClub inner join socio on socioclub.idSocio = socio.idSocio group by club.nombre having count(socio.idSocio)=2; 
end 7


delimiter ;

call proc_cuatro();
call proc_cuatro_mejorado();
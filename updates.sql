create database samsU;
use samsU;

#desc
desc socio;
desc producto;
select *from socio;
select* from proveedor;
#1
alter table proveedor add column credito double;
#2
update proveedor set credito=20000; 
#3
update socioclub set idClub=(select idClub from club where nombre='El molinito' ) where idClub=(select idClub from club where nombre='Tepeyac' );
#4
update proveedor set credito=credito*.91 where nombre='Sabritas';
#5
update producto set idProveedor=30 where idProveedor=22 or idProveedor=24 or idProveedor=25;
#6
update proveedor set credito=10000 where nombre like 's%';  
#punto 7 
update producto set precioUnitario=40 where idProducto=15;
#punto 8
update producto set precioUnitario=precioUnitario*1.1;
#punto 9
update club set nombre=upper(nombre);
#punto 10
update socio set direccion='Direccion de Juan' where nombre like '%Juan%';
#punto 11
alter table producto modify precioUnitario Decimal(7,2);
#punto 12
select* from gerente where idGerente not in(50,60,70,80,90,100,110,120,130,150,200,230,300);
#punto 13
select* from club where nombre like '_e%';
#punto 14
select* from socio where nombre like 'a%';
#punto 15 
select servicio.nombre from servicio,servicioclub,club where servicio.idServicio=servicioclub.idServicio and servicioclub.idClub=club.idClub and club.nombre='Tepeyac';
#punto 16
select * from proveedor where nombre regexp '^.[aeiou]';
#punto 17
select avg(precioUnitario) as Promedio_de_precio_Unitario from producto;
#punto 18
select proveedor.nombre from proveedor,proveedorsams,club where proveedor.idProveedor=proveedorsams.idProveedor and proveedorsams.idclub=club.idClub and club.nombre='Tepeyac';
#punto 19
select socio.nombre as socio_nombre,club.nombre as nombre_club, club.tel as club_telefono from socio,socioclub,club where socio.idSocio=socioclub.idSocio and socioclub.idClub=club.idClub;
#punto 20
select gerente.nombre from gerente,club where gerente.idClub=club.idClub and club.nombre='Hiperplaza Texcoco';
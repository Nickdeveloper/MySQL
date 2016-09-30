create database sams;
use sams;
#1
alter table proveedor add column credito double;
alter table proveedor drop column credito;
#2
update proveedor set credito = 20000;
select * from proveedor;
#3
update socioclub set idClub = (select idClub from club where nombre = "El molinito") where idClub = (select idClub from club where nombre = "Tepeyac");
#4
update proveedor set credito = credito*.91 where nombre = "Sabritas";
#5
select * from producto;
update producto set clave = 10 where clave = 5 or clave = 8 or clave = 3;

#6
update proveedor set credito = 10000 where nombre like 'S%';

#7
update producto set precioUnitario = 40 where idProducto = 15;

#8
update producto set precioUnitario = (precioUnitario*1.10);

#9
update club set nombre =  upper(nombre);
select * from club;

#10
update socio set direccion = "DIRECCION DE JUAN" where nombre like "% JUAN %";
select * from socio where direccion = "DIRECCION DE JUAN";

#11
alter table producto modify precioUnitario decimal(7,2);
desc producto;

#12
select * from gerente where idGerente != 50 and idGerente != 60 and idGerente != 70 and idGerente != 80 and idGerente != 90 and idGerente != 100 and  idGerente != 110
and idGerente != 120 and idGerente != 130 and idGerente != 150 and idGerente != 200 and  idGerente != 230 and idGerente != 300;

#13
select * from club where nombre like '_e%';

#14
select * from socio where nombre like 'A%';

#15
select servicio.nombre from servicio, club, servicioclub where club.idClub = servicioClub.idClub and servicioClub.idServicio = servicio.idServicio and club.nombre = 'QUER‚TARO';

#16
select * from proveedor where nombre like '_a%' or nombre like '_e%' or nombre like '_i%' or nombre like '_o%' or nombre like '_u%';

#17
select avg(precioUnitario) as 'PROMEDIO PRECIO UNITARIO' from producto;

#18
select proveedor.nombre from proveedor, club, proveedorsams where proveedor.idProveedor = proveedorsams.idProveedor and proveedorsams.idClub = club.idClub and club.nombre = 'Tepeyac'; 

#19
select club.nombre, club.tel, socio.nombre as 'nombre socio' from club, socio, socioclub where socio.idSocio = socioclub.idSocio and club.idClub = socioClub.idClub;

#20
select gerente.nombre from gerente, club where gerente.idClub = club.idClub and club.nombre = 'Hiperplaza Texcoco';
create database sams;
use sams;
desc club;
desc estado;
#punto 1
select nombre, direccion from socio order by nombre; 
# punto 2
select nombre, idClub from gerente where nombre like 'P%' order by nombre; 
# punto 3
select club.nombre,direccion,tel,estado.nombre from club,estado where club.idEdo = estado.idEdo and estado.nombre = 'Veracruz';
#punto 4
select nombre,precioUnitario from producto where precioUnitario > 20.00;
#punto 5
select* from club where nombre like '_a%' or nombre like '_e%' or nombre like '_i%'or nombre like '_o%' or nombre like '_u%';
#punto 6
select nombre,tel from socio where idSocio between 50 and 80 order by nombre desc;

use mixup;
#Consultas auxiliares
show tables;
desc mixup;
desc empleado;
desc mixprod;
desc produccion;
desc genero;
#Punto 1
select empleado.nombre, empleado.tel from empleado, mixup where empleado.MixUp_idMixUp = mixup.idMixUp and mixup.edo = "DF";
#Punto 2
select produccion.titulo from produccion, mixprod, mixup where produccion.idProduccion = mixprod.Produccion_idProduccion and mixprod.MixUp_idMixUp = mixup.idMixUp  and mixup.nombre = 'MixUp Santa Fe';
select produccion.titulo from produccion inner join mixprod  on (produccion.idProduccion = mixprod.Produccion_idProduccion) inner join mixup on(mixprod.MixUp_idMixUp = mixup.idMixUp) where mixup.nombre = 'MixUp Santa Fe';

#Punto 3
select nombre, email from socio;

#Punto 4
select e.nombre from empleado as e, mixup where e.MixUp_idMixUp = mixup.idMixUp and mixup.nombre  = "MixUp Santa Fe";
select e.nombre from empleado as e inner join mixup on(e.MixUp_idMixUp = mixup.idMixUp) where mixup.nombre  = "MixUp Santa Fe";

#Punto 5
select socio.nombre, socio.direccion from socio, mixup, mixsoc where socio.idSocio = mixsoc.Socio_idSocio and mixsoc.MixUp_idMixUp = mixup.idMixUp and mixup.edo = 'GUERRERO';
select socio.nombre, socio.direccion from socio inner join mixsoc on (socio.idSocio = mixsoc.Socio_idSocio) inner join mixup on (mixsoc.MixUp_idMixUp = mixup.idMixUp) where mixup.edo = 'GUERRERO';

#Punto 6
select produccion.titulo from produccion, genero where produccion.idProduccion = genero.Produccion_idProduccion;
select produccion.titulo from produccion inner join genero on (produccion.idProduccion = genero.Produccion_idProduccion);

#Punto 7
select nombre from genero;

#Punto 8
select autor from mixup, mixprod, produccion where mixup.idMixUp = mixprod.MixUp_idMixUp and mixprod.Produccion_idProduccion = produccion.idProduccion  and mixup.edo = 'GUERRERO';
select autor from mixup inner join mixprod on (mixup.idMixUp = mixprod.MixUp_idMixUp) inner join produccion on (mixprod.Produccion_idProduccion = produccion.idProduccion) and mixup.edo = 'GUERRERO';

#Punto 9
select empleado.nombre, empleado.nombre from empleado, socio, mixsoc, mixup where empleado.MixUp_idMixUp = mixup.idMixUp and socio.idSocio = mixsoc.Socio_idSocio and mixsoc.MixUp_idMixUp = mixup.idMixUp and socio.nombre like ('%ALEJANDRO%');

#Punto 10
select genero.nombre from genero, socio, mixup, mixsoc, mixprod, produccion where socio.idSocio = mixsoc.Socio_idSocio and mixsoc.MixUp_idMixUp = mixup.idMixUp  and mixup.idMixUp = mixprod.MixUp_idMixUp and mixprod.Produccion_idProduccion = produccion.idProduccion and genero.Produccion_idProduccion = produccion.idProduccion and socio.nombre like '%PEREZ MORALES MARCELA%';
select genero.nombre from socio inner join  mixsoc on (socio.idSocio = mixsoc.Socio_idSocio) inner join mixup on (mixsoc.MixUp_idMixUp = mixup.idMixUp  and mixup.idMixUp) inner join mixprod on (mixup.idMixUp = mixprod.MixUp_idMixUp) inner join produccion on(mixprod.Produccion_idProduccion = produccion.idProduccion) inner join genero on (genero.Produccion_idProduccion = produccion.idProduccion) and socio.nombre like '%PEREZ MORALES MARCELA%';

#Punto 11
select nombre, tel from mixup;

#Punto 12
select empleado.nombre from empleado inner join mixup on (empleado.MixUp_idMixUp =  mixup.idMixUp) where mixup.nombre = 'Mixup Perisur' or mixup.nombre = 'MixUp Santa Fe';
select empleado.nombre from empleado inner join mixup on (empleado.MixUp_idMixUp =  mixup.idMixUp) and( mixup.nombre = 'Mixup Perisur' or mixup.nombre = 'MixUp Santa Fe');

#Punton 13
select empleado.tel from empleado inner join mixup on (empleado.MixUp_idMixUp = mixup.idMixUp) inner join mixprod  on (mixprod.MixUp_idMixUp = mixup.idMixUp) inner join produccion on (mixprod.Produccion_idProduccion = produccion.idProduccion) inner join genero on (produccion.idProduccion = genero.Produccion_idProduccion) and genero.nombre = 'Pop & Rock';

#Punto 14
select nombre, dir from mixup;

#Punto 15
select socio.nombre, mixup.nombre from socio, mixup, mixsoc where socio.idSocio = mixsoc.Socio_idSocio and mixup.idMixUp = mixsoc.MixUp_idMixUp;
select socio.nombre, mixup.nombre from socio inner join mixsoc on (socio.idSocio = mixsoc.Socio_idSocio) inner join mixup on (mixup.idMixUp = mixsoc.MixUp_idMixUp);

#Punto 16
select mixup.nombre, socio.nombre, socio.tel from socio, mixsoc, mixup where socio.idSocio = mixsoc.Socio_idSocio and mixup.idMixUp = mixsoc.MixUp_idMixUp and socio.nombre like '%HERNANDEZ%';
select mixup.nombre, socio.nombre, socio.tel from socio inner join mixsoc on (socio.idSocio = mixsoc.Socio_idSocio) inner join mixup on (mixup.idMixUp = mixsoc.MixUp_idMixUp) where socio.nombre like '%HERNANDEZ%';
#Punto 17
select socio.nombre, mixup.nombre from socio, mixup, mixsoc where socio.idSocio = mixsoc.Socio_idSocio and mixup.idMixUp = mixsoc.MixUp_idMixUp and mixup.nombre = 'MixUp Perisur';
select socio.nombre, mixup.nombre from socio inner join mixsoc on (socio.idSocio = mixsoc.Socio_idSocio) inner join mixup on (mixup.idMixUp = mixsoc.MixUp_idMixUp) and mixup.nombre = 'MixUp Perisur';

#Punto 18
select nombre from mixup where dir like '%64050%' or dir like '%06000%' or dir like '%05109%';

#punto 19
select * from socio where nombre like '%GARCIA%' and nombre like '% % %e%';

#Punto 20
select count(nombre) as numero from mixup;

#Punton 21
select count(edo), edo from mixup group by edo;
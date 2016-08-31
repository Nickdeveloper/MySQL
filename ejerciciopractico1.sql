create database almacen;
use almacen;
create table almacen(
noAlmacen int primary key,
nombrealmacen varchar(50) not null default 'Sin nombre',
direccion varchar(70) not null default 'Sin direccion',
telefono varchar(12),
estado varchar(25) not null default 'Sin estado'
);
create table departamento(
nodepartamento char(3) primary key,
nombreDepto varchar(50) not null default 'Sin nombre'

);
create table almacen_Depto(
noAlmacenFK int not null,
nodepartamentoFK char(3) not null,
foreign key(noAlmacenFK) references almacen(noAlmacen),
foreign key(nodepartamentoFK) references departamento(nodepartamento),
primary key(noAlmacenFK,nodepartamentoFK)
);
alter table almacen
modify direccion varchar(150);

insert into almacen values(120,'Liverpool Perisur','Periferico Sur No. 4690 Col. Ampl. Pedregal de San Angel C.P 04500 Coyoacan. DF','55544712','DF');
insert into almacen values(106,'Liverpool Puebla','Av. Del Niño Poblano No. 2510. concepcion de la Cruz C.P. 72430 Puebla,Puebla','22297500','Puebla');
insert into almacen values(143,'Liverpool Insurgentes','Insurgentes sur No. 1310 Col. Del Valle C.p. 03100 Benito Juarez. DF','5554-8013','DF');

insert into departamento values('COM','Computacion');
insert into departamento values('PER','Perfumeria');
insert into departamento values('LB','Línea Blanca');
insert into departamento values('ELC','Electrónica');
insert into departamento values('MU','Muebles');

insert into almacen_Depto values(106,'LB');
insert into almacen_Depto values(120,'MU');
insert into almacen_Depto values(143,'ELC');
insert into almacen_Depto values(143,'LB');
insert into almacen_Depto values(106,'COM');
insert into almacen_Depto values(120,'PER');

select nombrealmacen,telefono from almacen;
select * from departamento order by nombreDepto desc;
alter table almacen add column email varchar(70) not null;
update almacen set email='perisur@liverpool.com.mx' where noAlmacen = 120;
update almacen set email='insur@liverpool.com.mx' where noAlmacen = 143;
select nombreDepto from departamento,almacen_Depto,almacen where departamento.nodepartamento = almacen_Depto.nodepartamentoFK and almacen_Depto.noAlmacenFK = almacen.noAlmacen and almacen.nombrealmacen='Liverpool Insurgentes';
update almacen_depto set nodepartamentoFK = 'COM' where nodepartamentoFK = 'ELC' and noAlmacenFK = 143;
select nombreDepto from departamento,almacen_Depto,almacen where departamento.nodepartamento = almacen_Depto.nodepartamentoFK and almacen_Depto.noAlmacenFK = almacen.noAlmacen and almacen.nombrealmacen='Liverpool Insurgentes';

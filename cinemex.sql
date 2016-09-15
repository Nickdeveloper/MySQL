create database cinemex;
use cinemex;

create table Cinemex(
	idCinemex int primary key not null,
    nombre varchar(45) not null,
    direccion varchar(45) not null,
    tel varchar(20) not null,
    email varchar(50) not null
);

create table Gerente(
	idGerente int primary key,
    nombre varchar(45) not null,
    noCel int not null,
	salario double not null,
    Cinemex_idCinemex int not null,
    foreign key (Cinemex_idCinemex) references Cinemex(idCinemex)
);
desc Gerente;

create table Asociado(
	idEmpleado varchar(20) primary key,
    nombre varchar(50) not null,
	direccion varchar(100) not null,
    tel varchar(20) not null,
	sex varchar(1) not null
);

create table CinemexEmpleado(
	Cinemex_idCinemex int not null,
	Empleado_idEmpleado varchar(20) not null,
    foreign key (Cinemex_idCinemex) references Cinemex (idCinemex) on update cascade on delete cascade,
    foreign key (Empleado_idEmpleado) references Asociado (idEmpleado) on delete cascade on update cascade,
    primary key (Cinemex_idCinemex, Empleado_idEmpleado)
);

#alter table Empleado add column (salario double not null, correo varchar(80) not null);
alter table Empleado add column salario double not null;
alter table Empleado add column correo varchar(50) not null;

#change.- permite cambiar nombre y el tipo de un atributo
#modify -  cambiar el tipo de dato

alter table Gerente modify noCel varchar(22);
alter table Asociado modify direccion varchar(50);

rename table Empleado to Asociado;
# also: alter table Empleado rename as Asociado

insert into Asociado values ('2016630055','JuanDaniel','Direccion de Juan', '5567879856','H',70000,'juan@gmail.com');
insert into Asociado values ('2016630056','JuanDaniel2','Direccion de Juan2', '5567879857','H',70001,'juan2@gmail.com');
insert into Asociado values ('2016630057','JuanDaniel3','Direccion de Juan3', '5567879858','H',70002,'juan3@gmail.com');

insert into Cinemex values (01,'Cinemex Coacalco',' Coacalco Edo. México','5567891243','coacalco@cinemex.com');
insert into Cinemex values (02,'Cinemex Tulti',' Tultitlan Edo. México','5567891009','tultitlan@cinemex.com');
insert into Cinemex values (03,'Cinemex Cuauti',' Cuautittlan Edo. México','5567891654','cuautitlan@cinemex.com');

insert into CinemexEmpleado values (01,'2016630055');
insert into CinemexEmpleado values (03,'2016630057');
insert into CinemexEmpleado values (02,'2016630056');

delete from Cinemex where idCinemex = 01;

drop table CinemexEmpleado;
show tables;

select * from CinemexEmpleado;
select * from Cinemex;

show create table Gerente;
show create table CinemexEmpleado;
show create table Cinemex;
alter table CinemexEmpleado drop foreign key cinemexempleado_ibfk_1;
alter table Gerente drop foreign key gerente_ibfk_1;
alter table Cinemex drop primary key ;
alter table Cinemex add primary key (idCinemex,nombre);

create table Cartelera(
	idCartelera int primary key,
    nombre_cartelera varchar(50) not null,
	fechainicio date not null,
    fechafin date not null,
    clasificacion varchar(5) not null,
    idCinemex int not null,
    nombre_cinemex varchar(45) not null,
    foreign key (idCinemex, nombre_cinemex) references Cinemex (idCinemex,nombre)
);
desc Cartelera;
show create table Cartelera;

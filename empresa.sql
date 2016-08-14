create database Empresa2;
use Empresa2;
create table empleado(
	rfc varchar(30) primary key,
	nombre varchar(50) not null default 'Sin nombre',
	telefono varchar(20) not null default 'Sin telefono',
	salario float not null default 0.0,
	fecha_ingreso date not null,
	id_depto int not null,
	foreign key (id_depto) references departamento(id_departamento)
);
create table hijos_empleados(
	id_hijo int primary key auto_increment,
	nacimiento date not null,
	id_padre varchar(30) not null,
	foreign key (id_padre) references empleado(rfc)
);
create table centro_trabajo(
	id_centro int primary key auto_increment,
	nombre varchar(30) not null default 'Sin nombre',
	direccion varchar(200) not null default 'Sin dirección',
	poblacion int not null,
	id_director varchar(30) not null,
	foreign key (id_director) references empleado(rfc)
);
create table departamento(
	id_departamento int primary key auto_increment,
	nombre varchar(50) not null default 'SIn nombre',
	presupuesto_anual float not null,
	id_centro int not null,
	foreign key (id_centro) references centro_trabajo(id_centro)
);

create table habilidades(
	id_habilidad int primary key auto_increment,
	nombre varchar(30) not null,
	descripcion varchar(200) not null
);

create table habilidades_empleados(
	id_empleado varchar(30),
	id_habilidad int,
	primary key(id_empleado,id_habilidad)
);

alter table centro_trabajo add column id_director varchar(30) not null;
alter table centro_trabajo add foreign key (id_director) references empleado(rfc);
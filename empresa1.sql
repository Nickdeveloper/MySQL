show databases;
create database Empresa1;
use Empresa1;
show tables;

#Del Modelo E-R en una relacion 1-N la tabla con N recibe la llave foránea
#En un atributo derivado ---- no se agrega a la tabla, se obtiene de la relacion o se calcula
#En un atributo multivariado se crea un catalogo.
#En una relación N-N creamos una tabla intermedia.
# Si la relacion es 1-n en ambos sentidos se convierte en N-N

desc cliente;

create table cliente(
	rfc varchar(20) not null primary key,
	nombre varchar(50) not null default 'Sin nombre',
	direccion varchar(100) not null default 'Sin direccion',
	telefono varchar(12) not null default 'Sin telefono',
	email varchar(50) not null default 'Sin email'
);

create table productos(
	id_producto int primary key auto_increment,
	nombre varchar(50) not null default 'Sin nombre',
	precio float not null default 0.0,
	id_proveedor varchar(20),
	foreign key (id_proveedor) references proveedores(rfc)
);

create table proveedores (
rfc varchar(20) not null primary key,
nombre varchar(50) not null default 'Sin nombre',
direccion varchar(100) not null default 'Sin direccion',
email varchar(50) not null default 'Sin E-mail'
);
#Telefono
create table proveedor_telefono(
	id_telefono int not null,
	rfc varchar(20) not null,
	telefono varchar(30) not null,
	primary key(rfc,id_telefono)
);
#Relacion muchos a muchos
create table cliente_producto(
	rfc varchar(20) not null,
	id_producto int not null,
	primary key (rfc, id_producto)
);

desc productos;
desc proveedores;
desc proveedor_telefono;

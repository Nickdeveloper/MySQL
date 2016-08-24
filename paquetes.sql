create database paquetes;
use paquetes;
#Silberchatz Modelo E-R
#Espcializacion ejemplo.- Usuario {cliente, admin, vendedor,...}
create table camioneros(
	rfc varchar(30) primary key,
	nombre varchar(30) not null 
);
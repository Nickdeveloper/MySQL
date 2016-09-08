CREATE DATABASE camiones_mexico;
USE camiones_mexico;
CREATE TABLE camioneros(
	rfc varchar(30) PRIMARY KEY,
	nombre varchar(45) NOT NULL,
	telefono varchar(12) NOT NULL,
	direccion varchar(80) NOT NULL,
	poblacion varchar(45) NOT NULL
);

CREATE TABLE municipio( 
	codigo int NOT NULL primary key,
	nombre varchar(45) NOT NULL
);

CREATE TABLE paquetes(
	idpaquetes int NOT NULL primary key,
	destino varchar(100) NOT NULL,
	destinatario varchar(80) NOT NULL,
	descripcion varchar(45) NOT NULL,
	camionerosrfc varchar(30) NOT NULL,
	municipiocodigo int NOT NULL,
	FOREIGN KEY (camionerosrfc) references camioneros(rfc),
	FOREIGN KEY (municipiocodigo) REFERENCES municipio(codigo)
);

CREATE TABLE camiones(
	matricula int PRIMARY KEY,
	modelo varchar(5) NOT NULL,
	tipo varchar(45) NOT NULL,
	potencia varchar(45)
);


CREATE TABLE camiones_has_camioneros(
	camionesmatricula int NOT NULL,
	camionerosRFC varchar(12) NOT NULL,
	fecha date,
	FOREIGN KEY (camionesmatricula) references camiones(matricula),
	FOREIGN KEY (camionerosRFC) references camioneros(rfc),
	PRIMARY KEY (camionesmatricula,camionerosRFC)
);

INSERT INTO camioneros VALUES('ABCDEFG', 'Juan Castillo', '556744122', 
'Bosques del Valle', 'Estado de Mexico');
INSERT INTO camioneros VALUES('HIJKLMN', 'Eduardo Armando', '5537081066', 
'Coalcalco', 'Distrito Federal');

INSERT INTO municipio VALUES(577710, 'Tultitla');
INSERT INTO municipio VALUES(317910, 'Coacalco');

desc paquetes;
INSERT INTO paquetes VALUES(0001,'Plaza Cosmopol Coacalco','Cinepolis Cosmopol','Paquetes de butacas para sala nueva', 'ABCDEFG',317910);
INSERT INTO paquetes VALUES(0002,'Plaza Bazar Tutlital','Oxxo Tultitlan','Paquetes de vasos', 'HIJKLMN',577710);

INSERT INTO camiones VALUES(4578941, 'X-45', 'CAMIONETA DE CARGA', '10');
INSERT INTO camiones VALUES(9679981, 'JK-45', 'CAMIONETA DE CARGA', '10');

INSERT INTO camiones_has_camioneros VALUES(4578941, 'ABCDEFG', '21-08-16');
INSERT INTO camiones_has_camioneros VALUES(9679981, 'HIJKLMN', '01-08-16');

alter table municipio add (estado varchar(50));

update municipio set estado =  'Mexico' where codigo = 577710;
update municipio set estado =  'Veracruz' where codigo = 317910;

update camioneros set telefono =  '57296000' where RFC = 'ABCDEFG' ;
update camiones_has_camioneros set fecha =  '2016-04-20' where 
camionerosRFC = 'ABCDEFG' ;
update camiones set modelo =  '2013' where matricula = 4578941;

ALTER TABLE camioneros drop poblacion; 
SELECT * FROM paquetes order by destino;
SELECT nombre,telefono FROM camioneros;

#DROP DATABASE camiones_mexico;
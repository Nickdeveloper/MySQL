CREATE DATABASE cursos;
USE cursos;

CREATE TABLE curso(
	codigo varchar(5) NOT NULL PRIMARY KEY,
    nombre varchar(20) NOT NULL,
    descripcion varchar(100) NOT NULL
);

CREATE TABLE prerrequisito(
	codigo_curso varchar(5) NOT NULL,
    codigo_prerrequisito varchar(5) NOT NULL,
    FOREIGN KEY (codigo_curso) REFERENCES curso(codigo),
    FOREIGN KEY (codigo_prerrequisito) REFERENCES curso(codigo),
    PRIMARY KEY (codigo_curso, codigo_prerrequisito)
);

CREATE TABLE tipo_edicion(
	id_tipo int NOT NULL PRIMARY KEY,
    descripcion varchar(20) NOT NULL
);

CREATE TABLE edicion(
	id_edicion int NOT NULL PRIMARY KEY,
    fecha varchar(7) NOT NULL,
    lugar varchar(10) NOT NULL,
    codigo_curso varchar(5) NOT NULL,
    id_tipo_fk int NOT NULL,
    FOREIGN KEY (codigo_curso) REFERENCES curso(codigo),
    FOREIGN KEY (id_tipo_fk) REFERENCES tipo_edicion(id_tipo)
);

CREATE TABLE empleado(
	codigo_empleado varchar(8) NOT NULL PRIMARY KEY,
    nombre varchar(20) NOT NULL,
    informacion varchar(172) NOT NULL
);

CREATE TABLE empleado_edicion(
	codigo_empleado_fk varchar(8) NOT NULL,
    id_edicion_fk int NOT NULL,
    fecha_inscripcion date NOT NULL,
    titulo varchar(20) NOT NULL,
    FOREIGN KEY (codigo_empleado_fk) REFERENCES empleado(codigo_empleado),
    FOREIGN KEY (id_edicion_fk) REFERENCES edicion(id_edicion),
	PRIMARY KEY (codigo_empleado_fk,id_edicion_fk)
);
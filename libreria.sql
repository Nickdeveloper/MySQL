use platzi;
show tables;
describe books;
#Notación:
/*
	1. Usar mayusculas en los comandos.
    2. Usar sustantivos para filas y clomunas.
    3. Usar nombre en ingles.
    4. INNODB vs MYSAMM
*/

CREATE TABLE books(
    book_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    #UNSIGNED no guarda el signo del identificador
    publisher_id INTEGER UNSIGNED NOT NULL,
    #Si uso una llave foranea poner el mismo tipo de dato en ambas tablas
    titulo VARCHAR(60) NOT NULL,
    #No permite un dato nulo
    autor VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(5,2),
    #DECIMAL(despues del punto, antes del punto)
    copies INT NOT NULL DEFAULT 0
);

CREATE TABLE publishers(
	publisher_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(20)
);

CREATE TABLE users(
	user_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(60) NOT NULL UNIQUE
    #UNIQUE no permite que ingresemos dos datos iguales
);

CREATE TABLE actions (
    action_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    book_id INTEGER UNSIGNED NOT NULL,
    user_id INTEGER UNSIGNED NOT NULL,
    action_type ENUM('venta','prestamo','devolucion') NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

#inserts
INSERT INTO users(nombre, email) VALUES
    ('Ricardo', 'ricardo@hola.com'),
    ('Laura', 'laura@hola.com'),
    ('Jose', 'jose@hola.com'),
    ('Sofia', 'sofia@hola.com'),
    ('Fernanda', 'fernanda@hola.com'),
    ('Jose Guillermo', 'memo@hola.com'),
    ('Maria', 'Maria@hola.com'),
    ('Susana', 'susana@hola.com'),
    ('Jorge', 'jorge@hola.com');
    
INSERT INTO publishers(name, country) VALUES
    ('OReilly', 'USA'),
    ('Santillana', 'Mexico'),
    ('MIT Edu', 'USA'),
    ('UTPC', 'Colombia'),
    ('Platzi', 'USA');

INSERT INTO books(publisher_id, titulo, autor, description, price, copies) VALUES
    (1, 'Mastering MySQL', 'John Goodman', 'Clases de bases de datos usando MySQL', 10.50, 4),
    (2, 'Trigonometria avanzada', 'Pi Tagoras', 'Trigonometria desde sus origenes', 7.30, 2),
    (3, 'Advanced Statistics', 'Carl Gauss', 'De curvas y otras graficas', 23.60, 1),
    (4, 'Redes Avanzadas', 'Tim Berners-Lee', 'Lo que viene siendo el internet', 13.50, 4),
    (2, 'Curvas Parabolicas', 'Napoleon TNT', 'Historia de la parabola', 6.99, 10),
    (1, 'Ruby On (the) Road', 'A Miner', 'Un nuevo acercamiento a la programacion', 18.75, 4),
    (1, 'Estudios basicos de estudios', 'John Goodman', 'Clases de bases de datos usando MySQL', 10.50, 4),
    (4, 'Donde esta Y?', 'John Goodman', 'Clases de bases de datos usando MySQL', 10.50, 4),
    (3, 'Quimica avanzada', 'John White', 'Profitable studies on chemistry', 45.35, 1),
    (4, 'Graficas Matematicas', 'Rene Descartes', 'De donde viene el plano', 13.99, 7),
    (4, 'Numeros Importantes', 'Leonhard Euler', 'De numeros que a veces nos sirven', 10, 3),
    (3, 'Modelado de conocimiento', 'Jack Friedman', 'Una vez adquirido, como se guarda el conocimiento', 29.99, 2),
    (3, 'Teoria de juegos', 'John Nash', 'A o B?', 12.55, 3),
    (1, 'Calculo de variables', 'Brian Kernhigan', 'Programacion mega basica', 9.50, 3),
    (5, 'Produccion de streaming', 'Juan Pablo Rojas', 'De la oficina a la pantalla', 23.49, 9),
    (5, 'ELearning', 'JFD & CvdH', 'Diseno y ejecucion de educacion online', 23.55, 4),
    (5, 'Pet Caring for Geeks', 'KC', 'Que tu perro aprenda a programar', 18.79, 3),
    (1, 'Algebra basica', 'Al Juarismi', 'Eso de encontrar X o Y, dependiendo', 13.50, 8);

INSERT INTO actions(book_id, user_id, action_type) VALUES
    (3, 2, 'venta'),
    (6, 1, 'prestamo'),
    (7, 7, 'prestamo'),
    (7, 7, 'devolucion'),
    (2, 5, 'venta'),
    (10, 9, 'venta'),
    (18, 8, 'prestamo'),
    (12, 4, 'venta'),
    (1, 3, 'venta'),
    (4, 5, 'prestamo'),
    (5, 2, 'venta');

#selects
select * from publishers;
select * from books;
select * from actions;
select * from users;

#deletes
delete from publishers where publisher_id=10;

#alter tables
alter table books add description VARCHAR(200);
alter table books add copies INT NOT NULL;
ALTER TABLE users ADD active tinyint(1) NOT NULL DEFAULT 1;

#descriptions
desc actions;
desc users;

#joins + IF
select a.action_id AS Credencial,
	   b.titulo,
       u.nombre,
       u.email,
       IF(a.action_type='venta',b.price,0) AS price
       FROM
       actions AS a LEFT JOIN books AS b ON a.book_id=b.book_id
       LEFT JOIN users AS u ON a.user_id=u.user_id;
#funcion ORDER BY
SELECT 
b.publisher_id AS pid,
b.titulo
FROM books AS b 
LEFT JOIN publishers AS p
ON b.publisher_id=p.publisher_id
ORDER BY pid;

#funcion COUNT + GROUP BY
SELECT
	p.publisher_id AS pid, 
    COUNT(b.book_id) AS libros
FROM books AS b
LEFT JOIN publishers AS p
ON b.publisher_id=p.publisher_id
GROUP BY pid;

#funcion SUM
SELECT 
	p.publisher_id AS pid,
	p.name,
    SUM(b.price*b.copies) AS suma_precios
FROM books AS b
LEFT JOIN publishers AS p
ON b.publisher_id=p.publisher_id
WHERE b.publisher_id=3
GROUP BY pid;

#funcion SUM + IF

SELECT 
	p.publisher_id AS pid,
	p.name,
    SUM(IF(b.price > 15,b.price*b.copies,0)) AS precios_15
FROM books AS b
LEFT JOIN publishers AS p
ON b.publisher_id=p.publisher_id
GROUP BY pid;

#update
UPDATE users SET active = 0 WHERE user_id=9;

#insert con ERROR
INSERT INTO users (nombre, email) VALUES ('perla','ricardo@hola.com')
ON DUPLICATE KEY update active =2;


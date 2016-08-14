use mysql;

#Mostrar los tipos de motores de almacenamiento disponibles en el SGDB
show engines;

#Muestra los detalles de cada tabla, posee una columna que muestra el tipo de ENGINE usado
show table status;

#set the default storage engine to be used during the current session
set default_storage_engine = MyISAM;

#por default esta tabla tendra un engine de tipo myisam
create table pruebita(
	id_prueba int(2) UNSIGNED primary KEY AUTO_INCREMENT
);

#Permite cambiar el tipo de engine para una tabla ya creada
alter table pruebita engine=INNODB;

#Crear una tabla con un engine especifico
create table especifica(
	id_especifica int(2) UNSIGNED primary KEY 
) ENGINE=innodb;

#INNO_DB = claves foranes físicas
#MyISAM = claves foraneas lógicas

#INNO DB Transactions in MySQL

#Las transacciones son utilizadas para efectos de inserciones en la bd, donde lo mas importante es la integridad de la información, encima de la velocidad de la BD
delimiter $
create procedure sp_transaccion(in sp_id_especifica int)
begin
	/*
    rollback
		Para ejecutar un rollback será necesario que ocurra un error, y la captura de ese error
		Para realizar la captura de un error se usara un handler de mysql
    */
    DECLARE EXIT HANDLER FOR sqlexception
    BEGIN
		rollback;
        select ('Realizo un rollback') AS msj;
    END;
    #-------------------------
    DECLARE EXIT HANDLER FOR sqlwarning
    BEGIN
		rollback;
    END;
    /*
	commit
		Para iniciar una transactionse usa la sentencia start transaction;
        Seguida de lo querys que deseamos ejecutar
        Finalizamos la transaction usamos la sentencia commit
    */
    START TRANSACTION;
		insert into especifica(id_especifica) values(sp_id_especifica);
        select ('Realizo un commit') AS msj;
    COMMIT;
end$
delimiter ;

call sp_transaccion(1);

/*
	Si hago el insert sin el handler regresara un error, con el handler retorno un msj y hago un rollback
	Con el rollback se van a deshacer todos los cambios que se hayan hecho en el procedure 
	de este forma se mantiene la consistencia de datos
*/
insert into especifica(id_especifica) values(0);
select * from especifica;
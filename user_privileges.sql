#Creación de un usuario 
	SELECT USER from mysql.user;
	CREATE USER 'norma'@'localhost' IDENTIFIED BY 'normita';

#--------------Privilegios mysql---------------------
#Nota: Al crear al nuevo usuario de preferencia no usar *.* sino solo la bd.*, o bd.table.
#GRANT [privilegio] ON [bd].[table] TO 'usuario'@'localhost'
	GRANT ALL privileges ON *.* TO 'norma'@'localhost';
    #Solo se tendra acceso a esta tabla y solo se usara select;
		GRANT SELECT ON prueba.books TO 'norma'@'localhost';
		GRANT SELECT ON prueba.publishers TO 'norma'@'localhost';
        
#Guardar cambios en los privilegios
	FLUSH privileges;

#Remover privilegios
	REVOKE INSERT ON prueba.books FROM 'norma'@'localhost'; 
    REVOKE SELECT ON prueba.publishers FROM 'norma'@'localhost';
#Ver privilegios
	SHOW GRANTS FOR 'norma'@'localhost'; 

#Eliminar usuario
	DROP USER 'norma'@'localhost';
    

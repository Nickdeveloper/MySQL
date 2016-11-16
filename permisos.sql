create database empressa;
use empressa;

create database samss;
use samss;
desc club;


select user from mysql.user;
create user 'ana'@'localhost' IDENTIFIED BY 'pato';

#punto 1
grant all on sams.*To ana@localhost identified by 'pato';
#punto 2
grant all on sams.*To pedro@localhost identified by 'cuarzo';
#punto 3
grant all on sams.*To mary@localhost identified by 'diamante';
#punto 4
grant all on *.* to felipe@localhost identified by 'topaz' with grant option;
#punto 5
grant update(nombre, direccion, tel) on samss.club to asistente@localhost identified by 'asistente';
#punto 6
#primero usar database mysql
revoke all on *.* from felipe@localhost;
mysql -u -root -p root
delete from user where user='felipe' and Host='localhost';
flush privileges

#punto 7
set password for ana@localhost = password("naranja");

#punto 8
grant select on samss.*To fulano@localhost identified by 'lagarto';

#punto 9
grant update on samss.club to sutano@localhost identified by 'lagartito';
grant insert on samss.socio to sutano@localhost;
#punto 10
cd C:\Program Files\MySQL\MySQL Server 5.6\bin
mysqladmin ping



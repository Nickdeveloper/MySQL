create database empresap8;
use empresap8;
#------------------------------------------------------------------------------------------
show tables;
desc employee;
select * from employee;
select * from department;
create view vista1 as 
select concat(employee.firstnme,employee.lastname),department.deptname from employee,department where department.deptno=employee.workdept;
select * from vista1;

drop view vista2;

create view vista2 as
select concat(employee.firstnme,employee.lastname) as nombre, employee.salary,department.deptname from employee,department where department.mgrno=employee.empno;
select * from vista2;

desc project;
select * from project;

drop view vista3;
create view vista3 as
select project.projname,concat(employee.firstnme,employee.lastname) as nombre from employee,project,empprojact where employee.empno=empprojact.empno and empprojact.projno=project.projno group by employee.empno;
select * from vista3;


select act.actkwd as actividad,employee.empno from act,empprojact,employee where act.actno=empprojact.actno and empprojact.empno=employee.empno group by employee.empno;

drop view vista4;
create view vista4 as
select act.actkwd as actividad from act,empprojact,employee where act.actno=empprojact.actno and empprojact.empno=employee.empno group by employee.empno;
select * from vista4;

create view vista5 as
select project.projname,concat(employee.firstnme,employee.lastname) as nombre,employee.job from employee,project,empprojact 
where employee.empno=empprojact.empno and empprojact.projno=project.projno group by employee.empno;
select * from vista5;


#---------------------------------------------------------------------------------------------}
select * from employee;
select * from department;
select * from empprojact;

desc department;

insert into employee values('2CM666','Juan','J','Castillo','D11','1478',current_date,'Manager',14,'M',current_date,50000.13,800,3060);
insert into empprojact values('2CM666','AD3111','180',1,'2016-10-11','2016-10-17');
update department set mgrno='2CM666' where deptno='D11';



select * from vista1;
select * from vista2;
select * from vista3;
select * from vista4;
select * from vista5;
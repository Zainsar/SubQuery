-- SubQuery

select * from emp;
select Name , sal from emp where sal in (select max(sal) from emp);
select Name , sal from emp where sal in (select min(sal) from emp);
select Name , sal from emp where sal in (select avg(sal) from emp);
select Name , sal from emp where sal in (select count(sal) from emp);
select Name , sal from emp where sal in (select sum(sal) from emp);
select Name from Employeetable where Dept = ( select D_ID from departmenttable where D_Location = "Texas");

insert into Employeetable values(1001,"Pete","Clerk",1000,3002),
(1002,"David","Manager",2500,3002),
(1003,"Michael","Salesman",800,3001),
(1004,"Ruby","Clerk",1500,3003),
(1005,"Clinton","Salesman",2750,3006),
(1006,"Julie","Manager",3000,3004),
(1007,"Smith","Clerk",3200,3003),
(1008,"Fuler","Clerk",1200,3004);
-- database select

use ttseve;

-- insert statement

CREATE TABLE EmployeeInCalifornia(
EmployeeID int,
Name varchar(20),
Poistion varchar(50),
Salary int(15),
primary key(EmployeeID)
); 

insert into EmployeeInCalifornia select EmployeeID , Name , Position , Salary From Employeetable Where Dept in (Select D_ID from Departmenttable Where D_Location = "California");

-- update statement

update Employeetable set Salary = salary + salary * 0.1 where dept = (select D_ID from Departmenttable where D_Ranking = 1);

-- delete Statement

delete from Employeetable where dept = (select D_ID from departmenttable where D_Name = "Finance");

-- From Clause avg

select * from ( select avg(salary) as avgsal from employeetable) as average_Salary,Employeetable as e where e.salary > Average_Salary.Avgsal;

-- from clause avg & Sum

select avg(total_salary) from (select sum(salary) as total_salary from employeetable group by position) as s;

-- in keyword

select * from employeetable where dept in (select D_ID from Departmenttable where D_Ranking = 1 or D_Ranking = 2 or D_Ranking = 3 );

-- not in keyword

select * from employeetable where dept not in (select D_ID from Departmenttable Where D_Location = "Texas" or D_Location = "California" );

-- exists

select * from departmenttable d where exists (select * from employeetable e where e.dept = d.D_ID);

-- not Exists

select * from departmenttable d where NOT exists (select * from employeetable e where e.dept = d.D_ID);

-- single Row SubQuery

select * from EmployeeTable e where salary = (select max(salary) from employeetable);

-- multi row SubQuery

select * from Employeetable where salary > any (select salary from Employeetable where position = "manager");

-- multiple Column SubQuery

select * from Employeetable where (position ,salary) in (select position,max(salary) from Employeetable group by position);

select count(name) from employeetable;
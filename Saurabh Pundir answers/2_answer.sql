create database 2_build_schema;
use 2_build_schema;

CREATE TABLE Departments (
  Code INTEGER PRIMARY KEY,
  Name varchar(255) NOT NULL ,
  Budget decimal NOT NULL 
);

CREATE TABLE Employees (
  SSN INTEGER PRIMARY KEY,
  Name varchar(255) NOT NULL ,
  LastName varchar(255) NOT NULL ,
  Department INTEGER NOT NULL , 
  foreign key (department) references Departments(Code) 
);

/* inserted elements
INSERT INTO Departments(Code,Name,Budget) VALUES(14,'IT',65000);
INSERT INTO Departments(Code,Name,Budget) VALUES(37,'Accounting',15000);
INSERT INTO Departments(Code,Name,Budget) VALUES(59,'Human Resources',240000);
INSERT INTO Departments(Code,Name,Budget) VALUES(77,'Research',55000);

INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('123234877','Michael','Rogers',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('152934485','Anand','Manikutty',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('222364883','Carol','Smith',37);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('326587417','Joe','Stevens',37);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('332154719','Mary-Anne','Foster',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('332569843','George','ODonnell',77);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('546523478','John','Doe',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('631231482','David','Smith',77);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('654873219','Zacary','Efron',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('745685214','Eric','Goldsmith',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('845657245','Elizabeth','Doe',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('845657246','Kumar','Swamy',14);
*/

select lastname from employees;

select distinct lastname from employees;

select * from employees where lastname='Smith';

select * from employees where lastname in ('Smith','Doe');

select * from employees where department=14;

select * from employees where department in (37,77);

select * from employees where lastname like 'S%';

select sum(budget) from departments;

select department,count(*) from employees group by department;

select e.*,d.name as 'department name',d.budget as 'department budget' from employees e, departments d where e.department=d.code;

select name,lastname from employees where department in (select code from departments where budget>60000);

select name from departments where budget>(select avg(budget) from departments);

select d.name from departments d inner join employees e on d.code=e.department group by d.name having count(*)>2;

select e.name,e.lastname from employees e where e.department=(select var.code from
		(select * from departments order by budget limit 2)var order by var.budget desc limit 1); 
        
        insert into departments values(11,'Quality Assurance',40000);
        insert into employees values(847219811,'Mary','Moore',11);
        
update departments set budget=budget*0.9;

update employees set department=14 where department=77;

delete from employees where department=14;

delete from employees where department in (select code from departments where budget>=60000);

delete from employees;
        

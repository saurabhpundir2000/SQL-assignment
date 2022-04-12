create database 1_answer;
use 1_answer;
CREATE TABLE Manufacturers (
  Code INTEGER,
  Name VARCHAR(255) NOT NULL,
  PRIMARY KEY (Code)   
);

CREATE TABLE Products (
  Code INTEGER,
  Name VARCHAR(255) NOT NULL ,
  Price DECIMAL NOT NULL ,
  Manufacturer INTEGER NOT NULL,
  PRIMARY KEY (Code), 
  FOREIGN KEY (Manufacturer) REFERENCES Manufacturers(Code)
) ENGINE=INNODB;

/* inserted elements
INSERT INTO Manufacturers(Code,Name) VALUES(1,'Sony');
INSERT INTO Manufacturers(Code,Name) VALUES(2,'Creative Labs');
INSERT INTO Manufacturers(Code,Name) VALUES(3,'Hewlett-Packard');
INSERT INTO Manufacturers(Code,Name) VALUES(4,'Iomega');
INSERT INTO Manufacturers(Code,Name) VALUES(5,'Fujitsu');
INSERT INTO Manufacturers(Code,Name) VALUES(6,'Winchester');

INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(1,'Hard drive',240,5);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(2,'Memory',120,6);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(3,'ZIP drive',150,4);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(4,'Floppy disk',5,6);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(5,'Monitor',240,1);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(6,'DVD drive',180,2);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(7,'CD drive',90,2);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(8,'Printer',270,3);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(9,'Toner cartridge',66,3);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(10,'DVD burner',180,2);
*/

select name from products;

select name,price from products;

select name,price from products where price<=200;

select * from products where price between 60 and 120;

select name,price*100 as 'price in cents' from products;

select avg(price) from products;

select avg(price) from products where manufacturer=2;

select count(*) from products where price>=180;

select name,price from products where price>=180 group by price,name order by price desc,name asc;

select p.code,p.name,p.price,p.manufacturer,m.name from products p, manufacturers m where p.manufacturer=m.code order by p.code;

select p.name,p.price,m.name as 'manufacturer name' from products p, manufacturers m where p.manufacturer=m.code order by p.code;

select manufacturer,avg(price) from products group by manufacturer;

select m.name,avg(p.price) from manufacturers m join products p on m.code=p.manufacturer group by m.name;

select m.name,avg(p.price) from manufacturers m,products p where m.code=p.manufacturer
group by m.name having avg(price)>=150;

select name,price from products order by(price) limit 1;

select name,price from products order by price desc limit 1;

select m.name as 'manufacturers name', p.name as 'product price',p.price from products p inner join manufacturers m on m.code=p.manufacturer
and p.price=(select max(p.price) from products p where p.manufacturer=m.code) order by m.name; 

insert into products values(11,'Loudspeakers',70,2);

update products set name='Laser Printer' where code=8;

# to remove error 1175 use the following command
set sql_safe_updates=0;

update products set price=price*0.9;

update products set price=price*0.9 where price >=120;


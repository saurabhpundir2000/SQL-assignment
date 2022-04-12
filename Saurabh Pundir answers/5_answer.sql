create database 5_build_schema;
use 5_build_schema;
CREATE TABLE Pieces (
 Code INTEGER PRIMARY KEY NOT NULL,
 Name TEXT NOT NULL
 );
CREATE TABLE Providers (
 Code VARCHAR(40) 
 PRIMARY KEY NOT NULL,  
 Name TEXT NOT NULL 
 );
CREATE TABLE Provides (
 Piece INTEGER, 
 FOREIGN KEY (Piece) REFERENCES Pieces(Code),
 Provider VARCHAR(40), 
 FOREIGN KEY (Provider) REFERENCES Providers(Code),  
 Price INTEGER NOT NULL,
 PRIMARY KEY(Piece, Provider) 
 );
  
/* inserted elements 
INSERT INTO Providers(Code, Name) VALUES('HAL','Clarke Enterprises');
INSERT INTO Providers(Code, Name) VALUES('RBT','Susan Calvin Corp.');
INSERT INTO Providers(Code, Name) VALUES('TNBC','Skellington Supplies');

INSERT INTO Pieces(Code, Name) VALUES(1,'Sprocket');
INSERT INTO Pieces(Code, Name) VALUES(2,'Screw');
INSERT INTO Pieces(Code, Name) VALUES(3,'Nut');
INSERT INTO Pieces(Code, Name) VALUES(4,'Bolt');

INSERT INTO Provides(Piece, Provider, Price) VALUES(1,'HAL',10);
INSERT INTO Provides(Piece, Provider, Price) VALUES(1,'RBT',15);
INSERT INTO Provides(Piece, Provider, Price) VALUES(2,'HAL',20);
INSERT INTO Provides(Piece, Provider, Price) VALUES(2,'RBT',15);
INSERT INTO Provides(Piece, Provider, Price) VALUES(2,'TNBC',14);
INSERT INTO Provides(Piece, Provider, Price) VALUES(3,'RBT',50);
INSERT INTO Provides(Piece, Provider, Price) VALUES(3,'TNBC',45);
INSERT INTO Provides(Piece, Provider, Price) VALUES(4,'HAL',5);
INSERT INTO Provides(Piece, Provider, Price) VALUES(4,'RBT',7);
*/

select name from pieces;

select * from providers;

select piece,avg(price) from provides group by piece;

select providers.name from providers,provides where providers.code=provides.provider and provides.piece=1;

select pieces.name from pieces,provides where pieces.code=provides.piece and provides.provider='HAL';

select pieces.name, providers.name,price from 
pieces inner join provides on pieces.code=piece join providers on providers.code=provider
where price=(select max(price) from provides where piece=pieces.code);

insert into provides values(1,'TNBC',7);

update provides set price=price+1;

delete from provides where provider='RBT' and piece=4;

delete from provides where provider='RBT';
										
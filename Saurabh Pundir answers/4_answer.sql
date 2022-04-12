create database 4_build_schema;
use 4_build_schema;

CREATE TABLE Movies (
  Code INTEGER PRIMARY KEY,
  Title VARCHAR(255) NOT NULL,
  Rating VARCHAR(255) 
);

CREATE TABLE MovieTheaters (
  Code INTEGER PRIMARY KEY,
  Name VARCHAR(255) NOT NULL,
  Movie INTEGER,  
    FOREIGN KEY (Movie) REFERENCES Movies(Code)
) ENGINE=INNODB;

/* inserted elements
INSERT INTO Movies(Code,Title,Rating) VALUES(1,'Citizen Kane','PG');
 INSERT INTO Movies(Code,Title,Rating) VALUES(2,'Singin'' in the Rain','G');
 INSERT INTO Movies(Code,Title,Rating) VALUES(3,'The Wizard of Oz','G');
 INSERT INTO Movies(Code,Title,Rating) VALUES(4,'The Quiet Man',NULL);
 INSERT INTO Movies(Code,Title,Rating) VALUES(5,'North by Northwest',NULL);
 INSERT INTO Movies(Code,Title,Rating) VALUES(6,'The Last Tango in Paris','NC-17');
 INSERT INTO Movies(Code,Title,Rating) VALUES(7,'Some Like it Hot','PG-13');
 INSERT INTO Movies(Code,Title,Rating) VALUES(8,'A Night at the Opera',NULL);
 
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(1,'Odeon',5);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(2,'Imperial',1);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(3,'Majestic',NULL);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(4,'Royale',6);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(5,'Paraiso',3);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(6,'Nickelodeon',NULL);*/
 
 select title from movies;
 
 select distinct rating from movies where rating is not null;
 
 select * from movies where rating is null;
 
 select * from movietheaters where movie is null;
 
 select * from movietheaters mt left join movies m on mt.movie=m.code; 
 
 select * from movietheaters mt right join movies m on m.code=mt.movie ;
 
 select title from movies where code not in (select movie from movietheaters where movie is not null);
 
 insert into movies(code,title,rating) values(9,'One, Two, Three',Null); 
 
 update movies set rating='G' where rating is null;
 
 delete from movietheaters where movie in (select code from movies where rating='NC-17');
 
 
 
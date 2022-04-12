create database csv;
use csv;

#all the data is stored in logs table
select * from logs;

select count(*) from logs;

select count(distinct package) from logs;

select count(package) from logs where package='Rcpp';

select count(package) from logs where country='CN';

select package as 'package name', count(*) from logs group by package order by 2 desc;

select package,count(*) from (select * from logs where 
		substr(time,1,5)<"11:00" and substr(time,1,5)>"09:00")p group by package order by 2 desc;

select count(*) from logs where country in('CN','JP','SG');

select p.country from (select country,count(*) as downloads from logs group by country)as p where p.downloads > (select count(*) from logs where country='CN');

select avg(length(package)) from logs where package in (select distinct package from logs);

select tmp.a package, tmp.b count from (select package a, count(*) b from logs group by package order by b desc limit 2)tmp order by tmp.b asc limit 1;

select package from logs group by package having count(*)>1000;

select r_os as 'OS', count(*) as 'Download counts',
		(count(*)/((select count(*) from logs)*1.0)*100) as '% as proportion' from logs
        group by r_os;
        
        

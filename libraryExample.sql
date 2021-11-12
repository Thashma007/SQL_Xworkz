select * from sakila.actor;

CREATE DATABASE library;
USE library;

create table Book_Details(

   Book_id TINYINT,
   Book_Name varchar(20),
   Author_Name varchar(30),
   Book_price float,
   Publish_year year,
   Book_volume char(10)
);

show tables; 

select *from Book_details;

describe Book_details;

-- ways to insert
insert into Book_details value(1,'DBMS','Ballguru Swamy',345.45,'1999',"V6");

insert into Book_details value(2,'Data Structure','Padma Reddy',500.00,'1995',"V3"),(3,'Algorithm','Jeff',400.00,'2010',"V4"),(4,'The jungle book','Rudyaurd Aipling',600.50,'2000',"V1");

insert into Book_details value(1,'DBMS','Ballguru Swamy',345.45,'1999',"V1");

-- second way to insert 
insert into Book_details(Book_id,Book_Name,Author_Name,Book_Price,Publish_year)value (4,'C','Chethan Bhagat',456.90,'1999');
insert into Book_details(Book_id,Book_Name,Book_Price,Publish_year)value (5,'Hierarchy',656.90,'1908');

select Book_id,Book_Name,Author_Name from Book_details;

select * from Book_details where publish_year='1999';

select * from Book_details where publish_year='1908';
select * from Book_details where publish_year>='2005';
select * from Book_details where publish_year>=1999 and Book_price<=400;
select * from Book_details where publish_year>=1999 or Book_price<=400;
select * from Book_details where publish_year>=1999 and Book_price<=400 and Author_Name='Ballguru Swamy';

-- Alter tables
alter table Book_details add column No_of_pages int;
select * from Book_details;
alter table Book_details add column No_of_pages int after Book_Name;
alter table Book_details drop column No_of_pages;
alter table Book_details rename column Book_price to Book_Amount;
alter table Book_details rename to books;

select * from books;
truncate books;
 
 drop table Book_details;-- books
 drop database library;-- to delete
alter table books rename to Book_details;
alter table Book_details rename column Book_Amount to Book_price;

-- order by
select * from Book_details order by Book_price;
select * from Book_details order by Book_volume;
select * from Book_details order by Book_price desc;
select * from Book_details order by Book_Name;
select * from Book_details order by Book_Name desc;

select * from Book_details limit 4;
select * from Book_details limit 5;

select * from Book_details order by Book_id asc limit 4;
select * from Book_details order by Book_Name desc limit 3;

select * from Book_details where Book_Name='The jungle book'or Book_Name='DBMS';
select * from Book_details where Book_Name in('The jungle book','400 Days','DBMS');
select * from Book_details where Book_id in(1,3,5);
select * from Book_details where Book_price between 500 and 1000;
select * from Book_details where Book_price between 100 and 500 order by Publish_year;

-- AS
select Book_price as Book_with_amount_greater_than_500 from Book_details where book_price >500;
select B.Book_price as Book_amount from Book_details B; -- book!!!!!!!!!!!!!
select Book_price from Book_details;

select * from Book_details where Book_name='S';-- !!!!!!!!!!!!!
select * from Book_details where Book_name like '%book';
select * from Book_details where Book_name like '%s';
select * from Book_details where Book_name like 'the%';
select * from Book_details where Book_name like 'd%';
select * from Book_details where Book_name like '%a%';
select * from Book_details where Book_name like '___a%';
select * from Book_details where Book_name like '_a_a%';

-- Date and Time
select curdate();
select curdate()as Present_Date;
select curtime()as Present_Time;
select now()as Present_DateTime;

select date('2021-11-11 21:03:53')as extracted_date;
select date (now())as extracted_date;
select time('2021-11-11 21:03:53')as extracted_time;
select time (now())as extracted_time;
select dayofmonth(('2021-11-11 21:03:53'))as extracted_day;
select monthname(('2021-11-11 21:03:53'))as extracted_month;
select year(('2021-11-11 21:03:53'))as extracted_year;
select week(('2021-11-11 21:03:53'))as extracted_week;
select dayname(('2021-11-11 21:03:53'))as extracted_week;

-- highest and lowest cost of book
select max(Book_price)from Book_details;
select min(Book_price)from Book_details;
select min(Book_price)as lowest_price from Book_details;
select avg(Book_price)as average_cost_price from Book_details;-- average

select sum(Book_price)as total_cost_price from Book_details;-- sum of all books
select sum(Book_id)as no_of_book from Book_details;
select sum(Book_name)as no_of_book_id from Book_details;

select count(Book_id)as no_of_book from Book_details;

-- get the number of book written by author by using group by clause

select Author_name, count(Book_name) from book_details group by Author_name;

select Author_name, count(Book_name) as no_of_bookby_author from book_details group by Author_name;

select Author_name, count(Book_name) from book_details group by Author_name;

select Book_Price, count(Book_Price) as no_in_Price from book_details group by Book_Price;

select *from book_details;

select Publish_year, count(Book_name) as No_of_books_in_year from book_details group by Publish_year;

select Publish_year, count(Book_name) as No_of_books_in_year from book_details where Publish_year>2004 group by Publish_year;










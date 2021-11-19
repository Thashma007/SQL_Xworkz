CREATE DATABASE vehicles;

USE vehicles;

CREATE TABLE bike_details
(
     Bike_Id INT PRIMARY KEY,
     Bike_Brand VARCHAR(30) NOT NULL,
     Bike_Model VARCHAR(30) DEFAULT'A10',
     Bike_Price DECIMAL CHECK(Bike_Price>=50000),
     Bike_colour VARCHAR(10),
     Engine_No VARCHAR(20)UNIQUE
     );
     
SELECT Bike_Id,Bike_Brand FROM bike_details;

SELECT*FROM bike_details;

DESCRIBE bike_details;

INSERT INTO bike_details VALUE(1,'Suzuki','Dio',70000,'Black','EN32456789');

INSERT INTO bike_details value(2,'Honda','Pulsar',80000,'Blue','EN11113'),(3,'Hero','Deluxe',100000,'White','EN13455666667');

INSERT INTO bike_details(Bike_Id,Bike_Brand)VALUE(4,'Apachi');

UPDATE bike_details SET Bike_Price=100000.9877 WHERE Bike_Id=4;

UPDATE bike_details SET Bike_colour='Red',Engine_No='EN1234567'WHERE Bike_Id=4;

UPDATE bike_details SET Bike_Price=70000 WHERE Bike_Id=1;

SELECT * FROM bike_details ORDER BY Bike_Price;

SELECT * FROM bike_details ORDER BY Bike_Price DESC;

SELECT * FROM bike_details ORDER BY Bike_Brand;

SELECT * FROM bike_details ORDER BY Bike_Model DESC;

SELECT * FROM bike_details LIMIT 2;

SELECT * FROM bike_details ORDER BY Bike_Price DESC LIMIT 3;

SELECT * FROM bike_details WHERE Bike_Brand='Hero' OR Bike_Brand='Honda';

SELECT * FROM bike_details WHERE Bike_Brand IN('Hero','Suzuki','Honda');

SELECT * FROM bike_details WHERE Bike_Price IN(70000,80000);

SELECT * FROM bike_details WHERE Bike_Price BETWEEN 70000 AND 100000;

SELECT * FROM bike_details WHERE Bike_Price BETWEEN 70000 AND 100000 ORDER BY Bike_Brand;

SELECT Bike_Price AS Bike_with_amount_greater_than_80000 FROM bike_details WHERE Bike_Price>80000;

SELECT Bike_Price AS Bike_Amount FROM bike_details;

SELECT * FROM bike_details;

SELECT * FROM bike_details WHERE Bike_Brand='He';

SELECT * FROM bike_details WHERE Bike_Brand LIKE 'He%';

SELECT * FROM bike_details WHERE Bike_Brand LIKE '_o_%';

SELECT * FROM bike_details WHERE Bike_Brand LIKE '%z%';

SELECT CURDATE();
SELECT CURDATE() AS Present_Date;

SELECT CURTIME();
SELECT CURTIME() AS Present_Time;

SELECT NOW() AS Present_DateTime;

SELECT DATE('2021-11-12 15:32:50')AS Extracted_Date;

SELECT DATE(NOW())AS Extracted_Date;

SELECT DAYOFMONTH('2021-11-12 15:32:50')AS Extracted_Day;

SELECT MONTH('2021-11-12 15:32:50')AS Extracted_Month;

SELECT YEAR('2021-11-12 15:32:50')AS Extracted_Year;

SELECT WEEK('2021-11-12 15:32:50')AS Extracted_Week;

SELECT DAYNAME('2021-11-12 15:32:50')AS Extracted_Day;

SELECT * FROM bike_details;

SELECT * FROM bike_details WHERE Bike_Price=80000;

SELECT MAX(Bike_Price)FROM bike_details;

SELECT MAX(Bike_Price) AS Highest_cost_of_bike FROM bike_details;

SELECT MIN(Bike_Price) AS Lowest_cost_of_bike FROM bike_details;

SELECT AVG(Bike_Price) AS Average_cost_of_bike FROM bike_details;

SELECT SUM(Bike_Price) AS Total_cost_of_bike FROM bike_details;

SELECT COUNT(Bike_Price) AS No_of_bikes FROM bike_details;
SELECT COUNT(*) AS No_of_bikes FROM bike_details;

SELECT Bike_Brand,COUNT(Bike_Id) FROM bike_details GROUP BY Bike_Brand;

SELECT Bike_Brand,COUNT(Bike_Id) AS No_of_bikes_in_ID FROM bike_details GROUP BY Bike_Brand;

SELECT Bike_Price,COUNT(Bike_Price) AS No_of_bikes_in_price FROM bike_details GROUP BY Bike_Price;

SELECT Bike_Model,COUNT(Bike_Model) AS No_of_bikes_in_Model FROM bike_details GROUP BY Bike_Model;

SELECT Bike_Price,COUNT(Bike_Price) AS No_of_bikes_in_Price FROM bike_details WHERE Bike_Price>80000 GROUP BY Bike_Brand;

SELECT Bike_Model,COUNT(Bike_Model) AS No_of_bikes FROM bike_details GROUP BY Bike_Model;

SELECT Bike_Brand,MAX(Bike_Price) AS Highest_cost_of_bike FROM bike_details GROUP BY Bike_Brand;

SELECT Bike_Brand,MIN(Bike_Price) AS Lowest_cost_of_bike FROM bike_details GROUP BY Bike_Brand;

SELECT Bike_Id,Bike_Brand,SUM(Bike_Price)AS Total_Price FROM bike_details GROUP BY Bike_Id,Bike_Brand HAVING Total_Price>70000 ;

SELECT Bike_Id,Bike_Brand,MIN(Bike_Price)AS Lowest_price,MAX(Bike_Price)AS Highest_price FROM bike_details GROUP BY Bike_Id,Bike_Brand HAVING Bike_Id>2;

SELECT Engine_No,Bike_Model,COUNT(Bike_Color)AS no_of_copies FROM bike_details GROUP BY Engine_No,Bike_Model HAVING no_of_copies>0;

SELECT Bike_Brand,MAX(Bike_Price)AS Highest_price FROM bike_details GROUP BY Bike_Brand HAVING Highest_price>80000; 
SELECT Bike_Brand,MIN(Book_Price)AS Lowest_price FROM bike_details GROUP BY Bike_Brand HAVING Lowest_price>80000;

SET AUTOCOMMIT=1;

SELECT*FROM bike_details;

DELETE FROM bike_details WHERE Bike_Id=4;

COMMIT;

DELETE FROM bike_details WHERE Bike_Id=3;

DELETE FROM bike_details WHERE Bike_Model='Dio';

SAVEPOINT Bike_Model;

UPDATE bike_details SET Bike_Price =90000 WHERE Bike_Id=2;

UPDATE bike_details SET Bike_Price =99000 WHERE Bike_Id=3;

SAVEPOINT Bike_Id;

ROLLBACK;

SELECT MAX(Bike_Price) FROM  bike_details;
SELECT MIN(Bike_Price) FROM  bike_details;

-- get the details  of the bike which has the highest and lowest cost

SELECT*FROM  bike_details WHERE Bike_Price =(SELECT MAX(Bike_Price) FROM  bike_details);

SELECT*FROM  bike_details WHERE Bike_Price =(SELECT MIN(Bike_Price) FROM  bike_details);

SELECT*FROM  bike_details WHERE Bike_Price <(SELECT MAX(Bike_Price) FROM  bike_details);

SELECT*FROM  bike_details WHERE Bike_Price >(SELECT MIN(Bike_Price) FROM  bike_details);

-- get second largest cost of bike 

SELECT*FROM bike_details WHERE Bike_Price=80000;

SELECT MAX(Bike_Price)AS Second_highest_cost_of_bike FROM bike_details WHERE Bike_Price < (SELECT MAX(Bike_Price) FROM bike_details);

-- get the details of second largest cost of bike 

SELECT*FROM bike_details WHERE Bike_Price = (SELECT MAX(Bike_Price)AS Second_highest_cost_of_bike FROM bike_details WHERE Bike_Price < (SELECT MAX(Bike_Price) FROM bike_details));

-- get third largest cost of book

SELECT*FROM bike_details WHERE Bike_Price=100000;
SELECT MAX(Bike_Price)AS Third_highest_cost_of_bike FROM bike_details WHERE Bike_Price < (SELECT MAX(Bike_Price)AS Second_highest_cost_of_bike FROM bike_details WHERE Bike_Price < (SELECT MAX(Bike_Price) FROM bike_details));

-- get the details of third largest cost of bike 

SELECT*FROM bike_details WHERE Bike_Price = (SELECT MAX(Bike_Price)AS Third_highest_cost_of_bike FROM bike_details WHERE Bike_Price < 
(SELECT MAX(Bike_Price)AS Second_highest_cost_of_bike FROM bike_details WHERE Bike_Price < (SELECT MAX(Bike_Price) FROM bike_details)));

-- get price between highest and second highest cost

SELECT*FROM bike_details WHERE Bike_Price IN (100001,100000);
SELECT*FROM bike_details WHERE Bike_Price IN((SELECT MAX(Bike_Price) FROM  bike_details),
(SELECT MAX(Bike_Price)AS Second_highest_cost_of_bike FROM bike_details WHERE Bike_Price < (SELECT MAX(Bike_Price) FROM bike_details)));

-- average cost

SELECT AVG(Bike_Price) FROM bike_details;
SELECT * FROM  bike_details WHERE Bike_Price IN (SELECT AVG(Bike_Price)FROM bike_details);

-- get the bike details by the bike model which has bike id greater than 2

SELECT * FROM bike_details WHERE Bike_Model IN((SELECT Bike_Model FROM bike_details GROUP BY Bike_Id HAVING Bike_Id>2));
SELECT * FROM bike_details WHERE Bike_Id>1; 


create database customer;
use customer;
create table customer_details(
customer_id int,
customer_name varchar(30)not null,
customer_email varchar(20) unique,
customer_phone bigint unique,
customer_address varchar(50),
primary key (customer_id)
);
show tables;
select*from customer_details;
use customer;
select*from customer_details;
insert into customer_details values (1,'vijay','vijay@gmail.com','6789809008','kolkata');
insert into customer_details values (2,'varun','varu@gmail.com','6789809009','kolegal');
insert into customer_details values (3,'lavanya','lavanya@gmail.com','6789809089','mysore');
insert into customer_details values (4,'vikas','vr@gmail.com','6789809026','banglore');
insert into customer_details values (5,'charu','ch@gmail.com','67898090988','chennai');
insert into customer_details values (6,'dia','dia@gmail.com','6789809508','bhopal');
insert into customer_details values (7,'jay','jay@gmail.com','6789809208','assam');
insert into customer_details values (8,'avi','avi@gmail.com','6789809058','hydrabad');
insert into customer_details values (9,'koushi','kh@gmail.com','6789809028','delhi');
insert into customer_details values (10,'vibha','vibha@gmail.com','6789809038','shimogga');

create table orders(
order_id int,
product_name varchar(30) not null,
order_amount decimal check(order_amount>100),
order_dateTime datetime,
customer_ref int,
primary key(order_id),
foreign key(customer_ref)references customer_details(customer_id)
);
select*from orders;
select*from customer_details;

insert into orders value(101,'iphone',65000.00,'2021-11-1 10:30:00',1);

insert into orders value(102,'iphone 10',75000.00,'2021-11-2 11:00:00',2);

insert into orders value(103,'camera',45000.00,'2021-11-5 12:05:32',5),(104,'laptop',52000.00,'2021-11-7 12:30:05',6),(105,'cooker',1500.00,'2021-11-6 17:05:32',3),(106,'iron box',1000.00,'2021-11-9 19:06:32',7),(107,'Television',25000.00,'2021-11-5 7:05:32',6),(108,'bag',2000.00,'2021-11-12 19:15:32',5),(109,'washing machine',20000.00,'2021-11-13 21:34:32',9);

insert into orders(order_id,product_name,order_amount,order_dateTime) value(110,'jean',2500.00,'2021-11-8 16:02:00');

select O.order_id,O.product_name,O.order_amount,O.customer_ref,C.customer_id,C.customer_name,C.customer_email from customer_details C inner join orders O on O.customer_ref=C.customer_id;

select * from customer_details C left join orders O on O.customer_ref=C.customer_id;

select * from customer_details C right join orders O on O.customer_ref=C.customer_id;











select author_name,min(book_price)as lowest_book_price_by_author from books_details group by author_name having lowest_book_price_by_author<1000;

 select *from books_details;
 delete from books_details where book_id=2;
 delete from books_details where book_id=4;
 rollback;

select max(book_price) from books_details;

select*from books_details where book_price=1800;
-- dynamic method
select*from books_details where book_price=(select max(book_price) from books_details);

-- second highest book price from table
select max(book_price) as second_highest_book_price from books_details where book_price<(select max(book_price) from books_details);
-- third highest book cost

select max(book_price) as third_highest_book_price from books_details where book_price <
(select max(book_price) as second_highest_book_price from books_details where book_price<(select max(book_price) from books_details));


 -- get highest and second highest cost book details
  select *from books_details;
 select*from books_details where book_price in(1800,1500.5);
 -- alternate method

 select*from books_details where book_price in((select max(book_price)from books_details),1500.5);

 -- dynamic method

 select*from books_details where book_price in((select max(book_price)from books_details),(select max(book_price) as second_highest_book_price from books_details where book_price<(select max(book_price) from books_details))); 

 -- details of book which has price greater than average

 select avg(book_price)from books_details;

  select*from books_details where book_price>(select avg(book_price)from books_details);

  -- details of book by book name which has publish year greater than 2005

  select * from books_details where book_name in((select book_name from books_details group by Publish_Year having Publish_Year>2005));

 CREATE TABLE Books(
Book_Id TINYINT,
Book_Name VARCHAR(20),
Author_Name VARCHAR(30),
Book_Price FLOAT,
Publish_Year YEAR,
Book_Volume CHAR(10)
);
select*from books;
insert into books select*from books_details where book_name in(select book_name from books);
update books_details set book_price=1700 where book_name in(select book_name from books);
  select *from books_details;
  delete from books_details where book_name in(select book_name from books); 

-- user,host from mysql server

create user temp@'localhost';

show grants for temp@'localhost';

grant select,update,delete on books_details to temp@'localhost';

revoke create on books_details from temp@'localhost';

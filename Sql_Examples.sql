CREATE TABLE BOOKS(
BOOK_id TINYINT,
BOOK_name varchar(20),
Author_name varchar(30),
Book_price float,
publish_year year,
Book_volume char(10),
primary key(Book_id));

SELECT * FROM Books;

INSERT INTO Books SELECT * FROM Books_details WHERE Book_id IN(SELECT Book_id FROM Books_details);

UPDATE Books_details SET Book_price=Book_price+100 WHERE Book_name IN(SELECT Book_name FROM Books);

SELECT USER HOST FROM mysql user;

-- creating a user
CREATE USER 'TemperUser2'@'localhost';
SHOW GRANTS FOR 'TemperUser2'@'localhost';
GRANT SELECT,UPDATE ON Books_details To 'TemperUser2'@'localhost';
REVOKE CREATE,DELETE ON Books_details FROM 'TemperUser2'@'localhost';
SHOW GRANTS FOR 'TemperUser2'@'localhost';
GRANT USAGE ON *.* TO 'TemperUser2'@'localhost';
GRANT ALL ON Books_details TO 'TemperUser2'@'localhost';


-- DATABASE peachmode
CREATE DATABASE peachmode;
USE peachmode;

CREATE TABLE Customer_details(
Customer_id INT,
Customer_name varchar(30) NOT NULL,
Customer_email varchar(40) UNIQUE,
Customer_phone BIGINT UNIQUE,
Customer_address varchar(50),
PRIMARY KEY(Customer_id));

SELECT * FROM Customer_details;

INSERT INTO Customer_details VALUE(1,'Megha','megha@gmail.com',7689065412,'sagara'),(2,'Rakhi','rakhi@gmail.com',7789065412,'Bihar'),(3,'Raksita','rakshita@gmail.com',6689065412,'Bellari'),(4,'Zahid','zahid@gmail.com',9689065412,'Assam'),(5,'Rehana','rehana@gmail.com',8689065412,'Hubli'),(6,'Krishna','krishna@gmail.com',7889065412,'shimoga'),(7,'kavya','kavya@gmail.com',9689065412,'Bengalur');
INSERT INTO Customer_details VALUE(8,'Akshita','akshita@gmail.com',6689065412,'Bijapur'),(9,'Akshay','akshay@gmail.com',9876543211,'Hubli'),(10,'Ravi','ravi@gmail.com',7908654321,'tumkur');



-- Employee Database
CREATE DATABASE Employee;
USE Employee;

CREATE TABLE Employee_details(
Employee_id Tinyint,
Employee_name varchar(20),
Employee_salary int(20),
Employee_addrs varchar(30),
Employeee_phno varchar(10),
PRIMARY KEY(Employee_id));

SELECT * FROM Employee_details;

INSERT INTO Employee_details VALUE(1,'Megha',1000000,'Bihar','9865743430'),(2,'Bhavana',200000,'Shimoga','78964543'),(3,'Anusha',400000,'tumkur','79876549'),(4,'Pari',5000000,'Hubli','678906544'),(5,'Rachita',400000,'Bihar','986543279'),(6,'Rehana',400000,'Hubli','78654329');

SELECT distinct Employee_addrs FROM Employee_details;

ALTER table Employee_details ADD COLUMN No_Of_Hours INT;

UPDATE Employee_details SET No_Of_Hours=8 WHERE Employee_id=1; 

ALTER TABLE Books_details DROP COLUMN No_Of_Pages;

DROP DATABASE Employee;

TRUNCATE Employee_details;

SELECT MAX(Employee_salary) AS MAXIMUM_SALARY from EMPLOYEE_details;
SELECT * FROM Employee_details WHERE Employee_salary=(SELECT MAX(Employee_salary) AS MAXIMUM_SALARY from Employee_details);

SELECT MIN(Employee_salary) AS MINIMUM_SALARY from EMPLOYEE_details;
SELECT * FROM Employee_details WHERE Employee_salary=(SELECT MIN(Employee_salary) AS MINIMUM_SALARY from Employee_details);

SELECT AVG(Employee_salary) AS AVERAGE_SALARY from EMPLOYEE_details;
SELECT Employee_addrs FROM Employee_details GROUP BY Employee_addrs ORDER BY Employee_salary;

SET AUTOCOMMIT=0;

SELECT * FROM Employee_details;
DELETE FROM Employee_details WHERE Employee_addrs='Bihar';
ROLLBACK;




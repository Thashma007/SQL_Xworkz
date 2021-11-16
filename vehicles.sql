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

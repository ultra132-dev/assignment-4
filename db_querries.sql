--1- from “orderdetails” table. Write a query to get all order numbers (without repetition) that
--contain any product starting with code (S18) and price more than (100).
--Ans:
SELECT DISTINCT orderNumber FROM `orderdetails` WHERE productCode LIKE "S18%" AND priceEach > 100;

--2- from “payments” table. Write a query to get all payments that were made on day (5) or (6)
--(whatever month or year).
--Ans:
SELECT * FROM `payments` WHERE DAY(paymentDate) IN (5,6);

--3- from “customers” table. Write a query to get the fifth-highest credit limit of the
-- customers who (live in the USA and their phone number contains 5555).
--Ans:
SELECT creditLimit FROM `customers` WHERE country = "USA" AND phone LIKE "%5555%" ORDER BY creditLimit DESC LIMIT 4,1;

-- 4- From the employees and offices tables, find the first name, last name, office number, and
-- office city for each employee.
--Ans:
SELECT  e.firstName, e.lastName, o.officeCode, o.city
FROM employees AS e JOIN offices AS o
ON e.officeCode = o.officeCode;

-- 5- From the employees and offices tables, find all those employees who work in office ID (4)
-- or (6). Return first name, last name, office number and office city.
--Ans:
SELECT  e.firstName, e.lastName, o.officeCode, o.city
FROM employees AS e JOIN offices AS o
ON e.officeCode = o.officeCode 
WHERE e.officeCode IN (4,6);
--============================================================================
--                   DONE!!
-- BY: Hamza Ibrahim Ahmad
--=============================================================================
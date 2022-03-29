------BEGINNER------

-- 1. Which shippers do we have?
-- We have a table called Shippers. Return all the fields from all the shippers

select * from shippers


-- 2. Certain fields from Categories
-- In the Categories table, selecting all the fields using
-- this SQL:
-- Select * from Categories ... will return 4 columns. We only want to see two

select categoryname, description from categories

-- 3. Sales Representatives
-- We’d like to see just the FirstName, LastName, and HireDate of all the employees with the Title of Sales Representative. 
-- Write a SQL statement that returns only those employees.

select firstname, lastname, hiredate from employees
where title = 'Sales Representative'

-- 4. Sales Representatives in the United States
-- Now we’d like to see the same columns as above, but
-- only for those employees that both have the title of
-- Sales Representative, and also are in the United States.

select firstname, lastname, hiredate from employees
where title = 'Sales Representative' and country = 'USA'

-- 5. Orders placed by specific EmployeeID
-- Show all the orders placed by a specific employee.
-- The EmployeeID for this Employee (Steven Buchanan) is 5

select orderid, orderdate from orders
where employeeid = 5

-- 6. Suppliers and ContactTitles
-- In the Suppliers table, show the SupplierID,
-- ContactName, and ContactTitle for those Suppliers
-- whose ContactTitle is not Marketing Manager.

select supplierid, contactname, contacttitle from suppliers
where contacttitle <> 'Marketing Manager'

-- 7. Products with “queso” in ProductName
-- In the products table, we’d like to see the ProductID
-- and ProductName for those products where the
-- ProductName includes the string “queso”.

select ProductID, ProductName
from Products
where ProductName ilike '%queso%';


-- 8. Orders shipping to France or Belgium
-- Looking at the Orders table, there’s a field called
-- ShipCountry. Write a query that shows the OrderID,
-- CustomerID, and ShipCountry for the orders where
-- the ShipCountry is either France or Belgium.

select orderid, customerid, shipcountry from orders
where shipcountry in ('France', 'Belgium')

-- 9. Orders shipping to any country in Latin America
-- Now, instead of just wanting to return all the orders from France of Belgium, we want to show all the
-- orders from any Latin American country. But we don’t have a list of Latin American countries in a
-- table in the Northwind database. So, we’re going to just use this list of Latin American countries that
-- happen to be in the Orders table:
-- Brazil
-- Mexico
-- Argentina
-- Venezuela
-- It doesn’t make sense to use multiple Or statements anymore, it would get too convoluted. Use the In statement.

select orderid, customerid, shipcountry from orders
where shipcountry in ('Brazil', 'Mexico', 'Argentina', 'Venezuela')

-- 10. Employees, in order of age
-- For all the employees in the Employees table, show the FirstName, LastName, Title, and BirthDate.
-- Order the results by BirthDate, so we have the oldest employees first.

select firstname, lastname, title, birthdate from employees
order by birthdate


-- 11. Showing only the Date with a DateTime field

-- In the output of the query above, showing the
-- Employees in order of BirthDate, we see the time of
-- the BirthDate field, which we don’t want. 
-- Show only the date portion of the BirthDate field.

SELECT firstname, lastname, title, CAST(birthdate as date)
FROM employees
ORDER BY birthdate


-- 12. Employees full name
-- Show the FirstName and LastName columns from
-- the Employees table, and then create a new column
-- called FullName, showing FirstName and LastName
-- joined together in one column, with a space in between.

select CONCAT(firstname, ' ', lastname) as FullName from employees

	
-- *** EXTRA QUESTION *** 
-- find the lengths of the firstname in employees table 
select char_length(firstname) from employees


-- 13. OrderDetails amount per line item
-- In the OrderDetails table, we have the fields
-- UnitPrice and Quantity. Create a new field,
-- TotalPrice, that multiplies these two together. We’ll
-- ignore the Discount field for now.
-- In addition, show the OrderID, ProductID, UnitPrice,
-- and Quantity. Order by OrderID and ProductID.

select orderid, productid, unitprice, quantity, unitprice * quantity as totalprice from order_details


-- 14. How many customers?
-- How many customers do we have in the Customers
-- table? Show one value only, and don’t rely on getting
-- the recordcount at the end of a resultset.

select count(*) from customers
where customerid is not null

-- 15. When was the first order?
-- Show the date of the first order ever made in the
-- Orders table.

select min(orderdate) as firstorder from orders

-- 16. Countries where there are customers
-- Show a list of countries where the Northwind
-- company has customers.

select distinct(country) as list_of_countries from customers
order by list_of_countries

-- *** EXTRA QUESTION *** 
-- Countries where there are customers
-- Show a list of countries where the Northwind company has customers.
-- And how many customers in each country
select distinct(country) as list_of_countries, count(customerid) from customers
group by list_of_countries
order by list_of_countries

-- 17. Contact titles for customers
-- Show a list of all the different values in the
-- Customers table for ContactTitles. Also include a
-- count for each ContactTitle.
-- This is similar in concept to the previous question.
-- “Countries where there are customers”,
-- except we now want a count for each ContactTitle.

select distinct(contacttitle), count(contacttitle) from customers
group by contacttitle
order by contacttitle

-- 18. Products with associated supplier names

-- We’d like to show, for each product, the associated
-- Supplier. Show the ProductID, ProductName, and the
-- CompanyName of the Supplier. Sort by ProductID.
-- This question will introduce what may be a new
-- concept, the Join clause in SQL. The Join clause is
-- used to join two or more relational database tables
-- together in a logical way.
-- Here’s a data model of the relationship between
-- Products and Suppliers.

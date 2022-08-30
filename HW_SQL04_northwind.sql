--01
SELECT 
	Products.ProductName,
	Products.QuantityPerUnit
FROM 
	Products

--02
SELECT 
	Products.ProductID,
	Products.ProductName
FROM 
	Products
WHERE 
	Products.Discontinued = 0

--03
SELECT 
	Products.ProductID,
	Products.ProductName
FROM 
	Products
WHERE 
	Products.Discontinued = 1

--04
SELECT 
	Products.ProductName,
	Products.UnitPrice
FROM 
	Products
ORDER BY Products.UnitPrice DESC

--05
SELECT 
	Products.ProductID,
	Products.ProductName,
	Products.UnitPrice
FROM 
	Products
WHERE 
	Products.UnitPrice < 20
	AND Products.Discontinued = 0
ORDER BY Products.UnitPrice DESC

--06
SELECT 
	Products.ProductID,
	Products.ProductName,
	Products.UnitPrice
FROM 
	Products
WHERE 
	Products.UnitPrice BETWEEN 15 AND 25
ORDER BY Products.UnitPrice DESC

--07
SELECT 
	Products.ProductName,
	Products.UnitPrice
FROM 
	Products
WHERE 
	Products.UnitPrice > (SELECT AVG(Products.UnitPrice) FROM Products)
ORDER BY Products.UnitPrice

--08
SELECT TOP 10
	Products.ProductName,
	Products.UnitPrice
FROM 
	Products
ORDER BY Products.UnitPrice DESC

--09
SELECT 	
	COUNT(*) AS NumOfProducts,
CASE 
	WHEN Products.Discontinued = 0 THEN 'False'
	WHEN Products.Discontinued = 1 THEN 'True' 
	END AS Discontinued
FROM 
	Products

--10
SELECT
	Products.ProductName,
	Products.UnitsOnOrder,
	Products.UnitsInStock
FROM 
	Products
WHERE
	Products.UnitsInStock < Products.UnitsOnOrder

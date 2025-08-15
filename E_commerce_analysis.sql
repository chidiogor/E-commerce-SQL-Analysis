

--E-commerce SQL Analysis
--This project analyzes an e-commerce dataset using Microsoft SQL Server to uncover key customer behavior patterns.
SELECT * FROM OnlineRetail;

--1.Customer Segmentation by Spend
SELECT 
    [Customer ID],
    SUM(Quantity * Price) AS TotalSpend
FROM OnlineRetail
WHERE [Customer ID] IS NOT NULL
GROUP BY [Customer ID]
ORDER BY TotalSpend DESC;

--Top 10 best selling Products
SELECT TOP 10 
    Description,
    SUM(Quantity) AS TotalQuantity
FROM OnlineRetail
WHERE Description IS NOT NULL
GROUP BY Description
ORDER BY TotalQuantity DESC;
--2 Repeat Customer Count
SELECT COUNT(*) AS RepeatCustomerCount
FROM (
    SELECT [Customer ID]
    FROM OnlineRetail
    WHERE [Customer ID] IS NOT NULL
    GROUP BY [Customer ID]
    HAVING COUNT(*) > 1
) AS RepeatCustomers;

-- 3. Customer Segmentation by Spend
SELECT 
    [Customer ID],
    SUM(Quantity * Price) AS TotalSpent
FROM OnlineRetail
WHERE [Customer ID] IS NOT NULL
GROUP BY [Customer ID]
ORDER BY TotalSpent DESC;

--4 Customers Returning Each Month
SELECT 
    FORMAT(InvoiceDate, 'yyyy-MM') AS YearMonth,
    COUNT(DISTINCT [Customer ID]) AS UniqueCustomers
FROM OnlineRetail
WHERE [Customer ID] IS NOT NULL
GROUP BY FORMAT(InvoiceDate, 'yyyy-MM')
ORDER BY YearMonth;

--3 Sales by Country
SELECT 
    Country,
    SUM(Quantity * Price) AS TotalSales
FROM OnlineRetail
WHERE [Customer ID] IS NOT NULL
GROUP BY Country
ORDER BY TotalSales DESC;

--4 Monthly Sales trend

SELECT 
    FORMAT(InvoiceDate, 'yyyy-MM') AS Month,
    SUM(Quantity * Price) AS TotalSales
FROM OnlineRetail
WHERE [Customer ID] IS NOT NULL
GROUP BY FORMAT(InvoiceDate, 'yyyy-MM')
ORDER BY Month;

--5 Top 10 Products by Revenue

SELECT TOP 10
    Description,
    SUM(Quantity * Price) AS TotalRevenue
FROM OnlineRetail
WHERE [Customer ID] IS NOT NULL
GROUP BY Description
ORDER BY TotalRevenue DESC;
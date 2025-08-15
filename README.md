# E-commerce-SQL-Analysis

## 📌 Project Overview
This project analyzes an e-commerce dataset using **Microsoft SQL Server** to uncover key customer behavior patterns.  
The goal is to identify **top spenders**, understand **repeat customer behavior**, and provide actionable insights for business growth.

---

## 📂 Dataset Description
The dataset contains transactional data with the following columns:

| Column       | Description |
|--------------|-------------|
| Invoice      | Unique invoice number |
| StockCode    | Unique product code |
| Description  | Product description |
| Quantity     | Quantity purchased |
| InvoiceDate  | Date and time of purchase |
| Price        | Price per unit |
| Customer ID  | Unique customer identifier |
| Country      | Customer’s country |

---

## 🛠 SQL Queries

### 1️⃣ Customer Segmentation by Spend
```
SELECT 
    [Customer ID],
    SUM(Quantity * Price) AS TotalSpend
FROM YourTableName
WHERE [Customer ID] IS NOT NULL
GROUP BY [Customer ID]
ORDER BY TotalSpend DESC;

Purpose: Identify high-value customers based on total spend.
```

### 2️⃣ Repeat Customers Count
``` sql

SELECT COUNT(*) AS RepeatCustomerCount
FROM (
    SELECT [Customer ID]
    FROM YourTableName
    WHERE [Customer ID] IS NOT NULL
    GROUP BY [Customer ID]
    HAVING COUNT(*) > 1
) AS RepeatCustomers;

Purpose: Count customers who made more than one purchase, a simple measure of retention.
```

### 3️⃣ Sales by Country
``` sql
SELECT 
    Country,
    SUM(Quantity * Price) AS TotalSales
FROM YourTableName
WHERE CustomerID IS NOT NULL
GROUP BY Country
ORDER BY TotalSales DESC;

Purpose: Identify the top countries by total sales.
```

### 4️⃣ Monthly Sales Trend
``` sql
SELECT 
    FORMAT(InvoiceDate, 'yyyy-MM') AS Month,
    SUM(Quantity * Price) AS TotalSales
FROM YourTableName
WHERE CustomerID IS NOT NULL
GROUP BY FORMAT(InvoiceDate, 'yyyy-MM')
ORDER BY Month;

Purpose: See how sales trend over time.
```

### 5️⃣ Top 10 Products by Revenue
``` sql
SELECT TOP 10
    Description,
    SUM(Quantity * Price) AS TotalRevenue
FROM YourTableName
WHERE CustomerID IS NOT NULL
GROUP BY Description
ORDER BY TotalRevenue DESC;

Purpose: Find the products that generate the most revenue.
```
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
📊 Key Insights

Top Spending Customers

High-value customers contribute significantly to revenue and should be prioritized for retention strategies.

Repeat Customers

Even in a limited dataset, identifying repeat buyers helps highlight customer loyalty.

Opportunities for Retention

If repeat customer numbers are low, businesses can implement targeted offers and follow-up campaigns.

Simplicity Works

Even basic SQL queries can produce meaningful business insights without overcomplication.
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

💡 Final Thoughts

This project shows how SQL can be a powerful yet simple tool for e-commerce analytics.
By focusing on spend segmentation and repeat customer behavior, businesses can create targeted marketing campaigns and boost long-term profitability.
These insights can be easily integrated into Power BI dashboards or Excel reports for real-time decision-making.
___________________________________________________________________________________________________________________________________________________________________________________________________________________

⚙ How to Run This Project

1. Clone or Download the Repository

git clone https://github.com/chidiogor/ecommerce-sql-analysis.git

2. Load the Dataset into SQL Server

Open SQL Server Management Studio (SSMS).

Create a new database (e.g., EcommerceDB).

Import the .csv dataset into a table named YourTableName.

3. Run the SQL Scripts

Open the .sql file from the repository in SSMS.

Execute each query to see results.
___________________________________________________________________________________________________________________________________________________________________________________________________________________

### 🔗 Portfolio Links

GitHub Repository: [Your Repo Link Here]

Portfolio Website: https://chidiogor.github.io

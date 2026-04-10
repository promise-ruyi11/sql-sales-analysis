-- Total Sales 

SELECT 'Total_sales' AS Measure_name,
CONCAT('$', FORMAT(SUM(Sales), 'N0'))  As Measure_name 
FROM Sales_data_clean;


--TOP 5 Cusomers By sales 

SELECT TOP 5
Customer_Name,
CONCAT('$', FORMAT(SUM(Sales), 'N0')) AS Total_Sales
FROM Sales_data_clean
GROUP BY Customer_Name
ORDER BY  SUM(Sales) DESC;

--- Sales By Region

SELECT 
Region,
CONCAT('$', FORMAT(SUM(Sales), 'N0')) AS Total_sales
FROM Sales_data_clean
GROUP BY Region
ORDER BY SUM(Sales) DESC; 

-- Yearly & Monthly Trends 

SELECT
YEAR(Order_Date) AS Order_Year,
DATENAME(Month,Order_Date) AS Order_Month,
CONCAT('$', FORMAT(SUM(Sales), 'N0')) AS Total_sales
FROM Sales_data_clean
GROUP BY DATENAME(Month,Order_Date), YEAR(Order_Date)
ORDER BY YEAR(Order_Date),SUM(Sales) DESC;

-- Sales & Profits by Subcategory

SELECT 
Sub_category,
CONCAT('$', FORMAT(SUM(Sales), 'N0')) AS Total_sales,
CONCAT('$', FORMAT(SUM(Profit), 'N0')) AS Total_Profit,
CASE 
    WHEN SUM(Profit) >= 30000 THEN 'HIGH'
    ELSE 'LOW'
END AS Profit_Level
FROM Sales_data_clean
GROUP BY Sub_category
ORDER BY Sub_category, SUM(Sales), SUM(Profit) DESC

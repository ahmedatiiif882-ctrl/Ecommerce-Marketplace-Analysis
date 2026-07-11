SELECT 
    COUNT(DISTINCT [Order ID]) AS Total_Orders,
    COUNT(*) AS Total_Rows,
    ROUND(SUM(CAST(Sales AS FLOAT)), 2) AS Total_Sales_Revenue
FROM raw_sales;
------
SELECT TOP 5 
    Category, 
    ROUND(SUM(CAST(Sales AS FLOAT)), 2) AS Category_Sales
FROM raw_sales
GROUP BY Category
ORDER BY Category_Sales DESC;

-----
SELECT 
    [Ship Mode], 
    COUNT(*) AS Number_of_Orders,
    ROUND(SUM(CAST(Sales AS FLOAT)), 2) AS Total_Sales
FROM raw_sales
GROUP BY [Ship Mode]
ORDER BY Total_Sales DESC;
------

SELECT COUNT(*) AS Missing_Profit_Rows 
FROM raw_sales 
WHERE Profit IS NULL OR Profit = '';
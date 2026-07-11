CREATE DATABASE Ecommerce_Project;
GO

-- استخدام قاعدة البيانات الجديدة
USE Ecommerce_Project;
GO
CREATE TABLE raw_sales (
    Row_ID INT,
    Order_ID VARCHAR(50),
    Order_Date VARCHAR(50), -- سنتركه نصاً مؤقتاً لتسهيل عملية الرفع ثم تحويله
    Ship_Date VARCHAR(50),
    Ship_Mode VARCHAR(50),
    Customer_ID VARCHAR(50),
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50),
    Country_Region VARCHAR(100),
    City VARCHAR(100),
    State VARCHAR(100),
    Postal_Code VARCHAR(50),
    Region VARCHAR(50),
    Product_ID VARCHAR(50),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name VARCHAR(255),
    Sales DECIMAL(10, 4),
    Quantity INT,
    Discount DECIMAL(4, 2),
    Profit DECIMAL(10, 4)
);CREATE DATABASE Ecommerce_Project;
GO

-- استخدام قاعدة البيانات الجديدة
USE Ecommerce_Project;
GO
CREATE TABLE sales (
    Row_ID INT,
    Order_ID VARCHAR(50),
    Order_Date VARCHAR(50), -- سنتركه نصاً مؤقتاً لتسهيل عملية الرفع ثم تحويله
    Ship_Date VARCHAR(50),
    Ship_Mode VARCHAR(50),
    Customer_ID VARCHAR(50),
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50),
    Country_Region VARCHAR(100),
    City VARCHAR(100),
    State VARCHAR(100),
    Postal_Code VARCHAR(50),
    Region VARCHAR(50),
    Product_ID VARCHAR(50),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name VARCHAR(255),
    Sales DECIMAL(10, 4),
    Quantity INT,
    Discount DECIMAL(4, 2),
    Profit DECIMAL(10, 4)

);

IF OBJECT_ID('cleaned_ecommerce_sales', 'U') IS NOT NULL 
    DROP TABLE cleaned_ecommerce_sales;

SELECT 
    [Order ID],
    [Customer Name],
    Category,
    [Ship Mode],
    ISNULL(TRY_CAST(Sales AS FLOAT), 0) AS Clean_Sales,
    ISNULL(TRY_CAST(Profit AS FLOAT), 0) AS Clean_Profit,
    (ISNULL(TRY_CAST(Sales AS FLOAT), 0) - ISNULL(TRY_CAST(Profit AS FLOAT), 0)) AS Net_Sales
INTO cleaned_ecommerce_sales
FROM raw_sales;

SELECT 
    [Order ID],
    [Customer Name],
    Category,
    [Ship Mode],
    CAST(Sales AS FLOAT) AS Clean_Sales,
    CAST(Profit AS FLOAT) AS Clean_Profit,
    (CAST(Sales AS FLOAT) - CAST(Profit AS FLOAT)) AS Net_Sales
INTO cleaned_ecommerce_sales
FROM raw_sales;
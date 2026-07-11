select Top 100 * FROM Sales_v4;
SELECT COUNT(*) AS Total_rows FROM Sales_v4;
select count(*) as missing_profists
FROM SALES_v4
where profit is null;
SELECT TOP 10 * FROM raw_sales;
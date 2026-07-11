INSERT INTO dbo.customer_rfm_analysis ( [Customer ID], Recency, Frequency, Monetary )
SELECT 
    [Customer ID], 
    DATEDIFF(day, MAX([Order Date]), (SELECT MAX([Order Date]) FROM dbo.cleaned_ecommerce_sales)) AS Recency,
    COUNT([Order ID]) AS Frequency,
    SUM([Clean_Sales]) AS Monetary
FROM dbo.cleaned_ecommerce_sales
GROUP BY [Customer ID];
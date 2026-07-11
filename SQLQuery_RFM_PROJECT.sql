ALTER TABLE cleaned_ecommerce_sales
ADD [Order Date] DATE ;
GO
UPDATE c
SET c.[Order Date] = TRY_CAST(r.[Order Date] AS DATE)
FROM cleaned_ecommerce_sales c
JOIN raw_sales r ON c.[Order ID] =r.[Order ID] ;
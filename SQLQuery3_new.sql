-- 1. احذف الجدول النظيف القديم
IF OBJECT_ID('dbo.cleaned_ecommerce_sales', 'U') IS NOT NULL
    DROP TABLE dbo.cleaned_ecommerce_sales;

-- 2. انظر للأسماء الحقيقية في الجدول الأصلي (من الـ Object Explorer)
-- واستخدم هذا الكود الذي يأخذ كل شيء ويعدل فقط ما نريد:
SELECT *
INTO dbo.cleaned_ecommerce_sales
FROM dbo.Sales_v4;

-- 3. الآن بعد أن أصبح الجدول موجوداً، سنقوم بتعديل أنواع البيانات (Data Types)
-- هذا سيعمل لأن الجدول قد أُنشئ بالفعل بأسماء الأعمدة الصحيحة كما هي في الجدول الأصلي
ALTER TABLE dbo.cleaned_ecommerce_sales ALTER COLUMN Sales FLOAT;
ALTER TABLE dbo.cleaned_ecommerce_sales ALTER COLUMN Profit FLOAT;
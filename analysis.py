import pandas as pd
from sqlalchemy import create_engine

# 1. قراءة ملف السيلز
df = pd.read_csv('data/Sales.csv')

# 2. تنظيف السطر الأول الوهمي
df_clean = df.drop(index=0).reset_index(drop=True)

# 3. إعداد الاتصال بالـ SQL Server
server_name = r".\SQLEXPRESS"
database_name = "Ecommerce_Project"

# 4. إنشاء محرك الاتصال بالتعريف الحديث (بيحل مشكلة الـ precision)
connection_string = f"mssql+pyodbc://@{server_name}/{database_name}?driver=ODBC+Driver+17+for+SQL+Server&trusted_connection=yes"
engine = create_engine(connection_string)

# 5. رفع البيانات النظيفة
df_clean.to_sql('raw_sales', con=engine, if_exists='replace', index=False)

print(" SQL Server done!")
####







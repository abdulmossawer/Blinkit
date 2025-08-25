
# 📊 Blinkit Sales Analysis  

## 📌 Project Overview  
This project analyzes **Blinkit’s sales performance, customer satisfaction, and inventory distribution** using SQL. The goal is to identify **key insights and optimization opportunities** through business KPIs and SQL queries.  

---

## 🎯 Business Requirements  
The analysis is based on the following business questions:  

1. **Total Sales by Fat Content** – How does fat content impact sales?  
2. **Total Sales by Item Type** – Which item types perform best?  
3. **Fat Content by Outlet for Sales** – How do outlets compare based on fat content?  
4. **Total Sales by Outlet Establishment** – Does outlet age/type influence sales?  
5. **Percentage of Sales by Outlet Size** – Correlation between outlet size and sales.  
6. **Sales by Outlet Location** – Geographic sales distribution.  
7. **All Metrics by Outlet Type** – Breakdown of KPIs (Sales, Avg. Sales, No. of Items, Rating) by outlet type.  

---

## 🛠️ Tools & Technologies  
- **SQL Server** – Data analysis & query execution  
- **Excel / CSV** – Data source  
- **PowerPoint** – Documentation & presentation  
- *(Optional)* Power BI / Tableau – For dashboard visualization  

---

## 📑 KPIs Calculated  
- **Total Sales** → Overall revenue generated  
- **Average Sales** → Avg. revenue per item sold  
- **Number of Items** → Count of items sold  
- **Average Rating** → Customer satisfaction score  

---

## 📝 SQL Queries & Analysis  
All SQL scripts are available in the **`/sql` folder**.  
Each query is written with comments for clarity.  

Example:  

```sql
-- Total Sales by Item Type
SELECT 
    Item_Type,
    CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
    CAST(AVG(Total_Sales) AS DECIMAL(10,2)) AS Avg_Sales,
    COUNT(*) AS No_Of_Items,
    CAST(AVG(Rating) AS DECIMAL(10,1)) AS Avg_Rating
FROM blinkit_data
GROUP BY Item_Type
ORDER BY Total_Sales DESC;
```

---

## 📈 Key Insights  
- 🥛 **Low Fat items** contribute higher sales compared to Regular fat items.  
- 🍫 **Snack Foods & Dairy** are the top-performing categories.  
- 🏬 **Medium outlet size** generates the majority of sales (~45%).  
- 📍 Sales are concentrated in **Tier 3 locations**, showing stronger local adoption.  
- 🛒 **Supermarket Type1 outlets** lead in sales, but Type2 outlets have higher **avg. rating**.  

---

## 📂 Project Structure  
```
Blinkit-Sales-Analysis/
│── scripts/                # All SQL queries
│── docs/                   # Project presentation
│── datasets/               # Dataset (if allowed to share)
│── README.md               # Documentation
```

---

## 📊 Presentation & Report  
📌 Detailed analysis and visual insights are available in the [Project PPT](https://github.com/abdulmossawer/Blinkit/blob/main/docs/Blinkit-Sales-Analysis.pptx.pptx).  

---

## 👤 Author  
**Abdul Mossawer**  
- 💼 Aspiring Data Analyst  
- 🌐 [https://www.linkedin.com/in/abdul-mossawer-std]  
- 📧 mossawer786@gmail.com 

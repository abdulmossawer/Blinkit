-- Answers

SELECT * FROM blinkit_data;

-- KPI’s Requirements

-- Total Sales
SELECT * FROM Total_Sales;

-- Average Sales
SELECT * FROM Avg_Sales;

-- Number of Items
SELECT * FROM No_Of_Orders;

-- Average Rating
SELECT * FROM Avg_Rating;


-- Granular Requirements

--Total Sales by Fat Content
SELECT * FROM Total_Sales_by_Fat_Content;

-- Total Sales by Item Type
SELECT * FROM Total_Sales_by_Item_Type
ORDER BY Total_Sales DESC;

-- Fat Content by Outlet for Total Sales
SELECT * FROM Fat_Content_by_Outlet_for_Total_Sales
ORDER BY Outlet_Location_Type;

-- Total Sales by Outlet Establishment
SELECT * FROM Total_Sales_by_Outlet_Establishment
ORDER BY Outlet_Establishment_Year;
SELECT * FROM blinkit_data;

-- KPI’s Requirements

-- Total Sales
CREATE VIEW Total_Sales AS
SELECT
	CAST(SUM(Total_Sales) / 1000000 AS DECIMAL(10, 2)) AS Total_Sales_Millions
FROM blinkit_data;

-- Average Sales
CREATE VIEW Avg_Sales AS
SELECT
	CAST(AVG(Total_Sales) AS DECIMAL(10, 2) ) AS Avg_Sales
FROM blinkit_data;

-- Number of Items
CREATE VIEW No_Of_Orders AS
SELECT
	COUNT(*) AS No_Of_Orders
FROM blinkit_data;

-- Average Rating
CREATE VIEW Avg_Rating AS
SELECT
	CAST(AVG(Rating) AS DECIMAL(10, 1)) AS Avg_Rating
FROM blinkit_data;


-- Granular Requirements

--Total Sales by Fat Content
CREATE VIEW Total_Sales_by_Fat_Content AS
SELECT
	Item_Fat_Content,
	CAST(SUM(Total_Sales) AS DECIMAL(10, 2)) AS Total_Sales,
	CAST(AVG(Total_Sales) AS DECIMAL(10, 2) ) AS Avg_Sales,
	COUNT(*) AS No_Of_Items,
	CAST(AVG(Rating) AS DECIMAL(10,1)) AS Avg_Rating
FROM blinkit_data
GROUP BY Item_Fat_Content;

-- Total Sales by Item Type
CREATE VIEW Total_Sales_by_Item_Type AS
SELECT 
	Item_Type,
	CAST(SUM(Total_Sales) AS DECIMAL(10,2))AS Total_Sales,
	CAST(AVG(Total_Sales) AS DECIMAL(10, 2) ) AS Avg_Sales,
	COUNT(*) AS No_Of_Items,
	CAST(AVG(Rating) AS DECIMAL(10,1)) AS Avg_Rating
FROM blinkit_data
GROUP BY Item_Type;

-- Fat Content by Outlet for Total Sales
CREATE VIEW Fat_Content_by_Outlet_for_Total_Sales AS
SELECT Outlet_Location_Type, 
       ISNULL([Low Fat], 0) AS Low_Fat, 
       ISNULL([Regular], 0) AS Regular
FROM 
(
    SELECT Outlet_Location_Type, Item_Fat_Content, 
           CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales
    FROM blinkit_data
    GROUP BY Outlet_Location_Type, Item_Fat_Content
) AS SourceTable
PIVOT 
(
    SUM(Total_Sales)
    FOR Item_Fat_Content IN ([Low Fat], [Regular])
) AS PivotTable

-- Total Sales by Outlet Establishment
CREATE VIEW Total_Sales_by_Outlet_Establishment AS
SELECT 
	Outlet_Establishment_Year,
	CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales
FROM blinkit_data
GROUP BY Outlet_Establishment_Year;


-- Chart’s Requirements

-- Percentage of Sales by Outlet Size
CREATE VIEW Percentage_of_Sales_by_Outlet_Size AS
SELECT
	Outlet_Size,
	CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
	CAST((SUM(Total_Sales) * 100.0 / SUM(SUM(Total_Sales)) OVER())
	AS DECIMAL(10,2)) AS Sales_Percentage
FROM blinkit_data
GROUP BY Outlet_Size;

-- Sales by Outlet Location
CREATE VIEW Sales_by_Outlet_Location AS 
SELECT 
	Outlet_Location_Type,
	CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales
FROM blinkit_data
GROUP BY Outlet_Location_Type;

-- All Metrics by Outlet Type:
CREATE VIEW All_Metrics_by_Outlet_Type AS
SELECT Outlet_Type, 
CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
		CAST(AVG(Total_Sales) AS DECIMAL(10,0)) AS Avg_Sales,
		COUNT(*) AS No_Of_Items,
		CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating,
		CAST(AVG(Item_Visibility) AS DECIMAL(10,2)) AS Item_Visibility
FROM blinkit_data
GROUP BY Outlet_Type;
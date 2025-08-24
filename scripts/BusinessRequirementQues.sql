-- Questions

SELECT * FROM blinkit_data;

-- KPI’s Requirements

-- Total Sales
CREATE VIEW Total_Sales AS
SELECT
	CAST(SUM(Total_Sales) AS DECIMAL(10, 2) ) AS Total_Sales
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

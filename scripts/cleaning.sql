USE blinkitDB;

SELECT * FROM blinkit_data;

SELECT COUNT(*) FROM blinkit_data;

SELECT DISTINCT Item_Fat_Content FROM blinkit_data;

-- Data Cleaning
UPDATE blinkit_data
SET Item_Fat_Content = 
CASE
	WHEN Item_Fat_Content IN ('LF', 'low fat') THEN 'Low Fat'
	WHEN Item_Fat_Content = 'reg' THEN 'Regular'
	ELSE Item_Fat_Content
END;
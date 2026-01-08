/*===================================
Project Retail Analysis
Author: Ido Gilboa
Database: Retail Analysis DB
=====================================*/
-- 1. Overall Performance
-- Total revenue across all stores
SELECT SUM(quantity*price) AS Total_Revenue FROM sales
JOIN products ON sales.product_id = products.product_id;
-- 2. Product Performance
-- Identify top revenue-generating products
SELECT product_name, SUM(quantity*price) AS Revenue FROM sales
JOIN products ON sales.product_id = products.product_id
GROUP BY product_name ORDER BY Revenue DESC LIMIT 10;
-- Identify top selling products
SELECT product_name, SUM(quantity) AS Top_Sellers FROM sales
JOIN products ON sales.product_id = products.product_id
GROUP BY product_name ORDER BY Top_Sellers DESC LIMIT 10;
-- Food vs beverage revenue
SELECT category, SUM(quantity*price) AS Revenue FROM sales
JOIN products ON sales.product_id = products.product_id
GROUP BY category;
-- Compare amount of sales by category
SELECT category, SUM(quantity) AS Untis_Sold FROM sales
JOIN products ON sales.product_id = products.product_id
GROUP BY category;
/*===================================
Medium scoops are the most bought item, so the store should order more medium cups and medium cones, along with small smoothie cups so they won't run out.
Dubai Waffles generate the most revenue, and to generate even more interest, the store can advertise it on social media.
While the food category generates more revenue, many beverages are also sold.
====================================*/
-- 3. Time-Based Analysis
-- Peak sales hours
SELECT sale_hour, SUM(quantity) AS Units_Sold FROM sales
GROUP BY sale_hour ORDER BY Units_Sold DESC;
-- Analyze revenue by weekday
SELECT DAYNAME(sale_date) AS Day_of_Week, SUM(quantity*price) AS Revenue FROM sales
JOIN products ON sales.product_id = products.product_id
GROUP BY Day_of_Week ORDER BY Revenue DESC;
/*=================================
Sales peak between 18:00-22:00, indicating the need for increased staffing during evening hours.
We expected weekends to outperform weekdays, but we see that Wednesday is the busiest day, followed by Monday and Tuesday.
It might be an exception affected by multiple factors, including time of year (as we only have info for the last quarter), store location, or changing weather as we are between seasons and the weather changes sporadically.
For now, I'll recommend to increase staffing in the middle of the week until we have more information.
==================================*/
-- 4. Store-Level Performance
-- Compare store performance
SELECT store_name, city, SUM(quantity*price) AS Revenue FROM sales
JOIN products ON sales.product_id = products.product_id
JOIN stores ON sales.store_id = stores.store_id
GROUP BY store_name, city ORDER BY Revenue DESC;
/*=================================
The stores in Haifa generate the most revenue, with the Carmel branch generating the most. It makes sense as Carmel is the flagship store, with the biggest selection of flavors and add-ons.
To increase sales in the other branches, I recommend increasing the amount of options and flavors to be more in line with the Carmel branch, which might increase sales.
=================================*/
-- 5. Event Analysis (New Year’s Eve)
-- Identify high-activity days
SELECT sale_date, SUM(quantity) AS Units_Sold FROM sales
GROUP BY sale_date ORDER BY Units_Sold DESC LIMIT 10;
-- Compare New Year's Eve sale quantity to the average day
SELECT CASE WHEN sale_date = '2025-12-31' THEN 'New Years Eve' ELSE 'Regular Day' END AS Day_Type,
ROUND(AVG(quantity),2) AS Avg_Units_Per_Sale FROM sales
GROUP BY Day_Type ORDER BY Avg_Units_Per_Sale DESC;
-- Compare New Year's Eve revenue per sale to the average day
SELECT CASE WHEN sale_date = '2025-12-31' THEN 'New Years Eve' ELSE 'Regular Day' END AS Day_Type,
ROUND(AVG(quantity*price),2) AS Avg_Revenue_Per_Sale FROM sales
JOIN products ON sales.product_id = products.product_id
GROUP BY Day_Type ORDER BY Avg_Revenue_Per_Sale DESC;
/*================================
New Year’s Eve shows higher total sales, higher average units per sale and higher average revenue per sale, supporting event-based staffing and inventory planning.
==================================*/
-- 6. Top Products During Certain Hours
-- Products sold most during morning hours (8–13)
SELECT product_name, SUM(quantity) AS Units_Sold FROM sales
JOIN products ON sales.product_id = products.product_id
WHERE sale_hour BETWEEN 8 AND 13
GROUP BY product_name ORDER BY Units_Sold DESC LIMIT 5;
-- Products sold most during evening hours (18-22)
SELECT product_name, SUM(quantity) AS Units_Sold FROM sales
JOIN products ON sales.product_id = products.product_id
WHERE sale_hour BETWEEN 18 AND 22
GROUP BY product_name ORDER BY Units_Sold DESC LIMIT 5;
/*===============================
During morning hours, while the total revenue is lower, many coffees and other beverages are sold,
while during peak evening hours, core products dominate, reinforcing their importance for operational readiness.
===============================*/
-- 7. Revenue Share by Product
SELECT product_name, SUM(quantity*price) AS Revenue, 
ROUND(SUM(quantity*price)/(SELECT SUM(quantity*price) FROM sales JOIN products ON sales.product_id = products.product_id)*100,2) AS Revenue_Share_percent
FROM sales
JOIN products ON sales.product_id = products.product_id
GROUP BY product_name ORDER BY Revenue DESC;
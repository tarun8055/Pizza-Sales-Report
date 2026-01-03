select * from pizza_sales

select sum(total_price) as Total_Revenue from pizza_sales

select sum(total_price) / count(distinct order_id) as Avg_Order_value from pizza_sales

select sum(quantity) as Total_Pizza_Sold from pizza_sales

select count(distinct order_id) as Total_orders from pizza_sales

select cast(cast(sum(quantity) as decimal(10,2)) / 
cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) 
as Avg_Pizzas_Per_order from pizza_sales

select DATENAME(DW, order_date) as order_day, count(distinct order_id) as Total_orders 
from pizza_sales
group by DATENAME(DW, order_date)

SELECT DATENAME(MONTH, order_date)AS Month_Name, COUNT(DISTINCT order_id) as Total_Orders
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date)
ORDER BY Total_Orders

SELECT 
    pizza_category,
    SUM(total_price) AS Total_sales,
    SUM(total_price) * 100.0 / (SELECT SUM(total_price) FROM pizza_sales WHERE MONTH(order_date)=1 ) AS PCT
FROM 
    pizza_sales WHERE MONTH(order_date)=1
GROUP BY 
    pizza_category


SELECT pizza_size, SUM(total_price) AS Total_sales,
CAST((SUM(total_price) * 100.0) / (SELECT SUM(total_price) FROM pizza_sales WHERE DATEPART(quarter, order_date) = 1)
AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
WHERE DATEPART(quarter, order_date) = 1
GROUP BY pizza_size
ORDER BY PCT DESC;


SELECT TOP 5 pizza_name, SUM(totaL_price) AS Total_Revenue FROM pizza_sales
GROUP BY pizza_name 
ORDER BY Total_Revenue ASC

SELECT TOP 5 
    pizza_name, 
    SUM(quantity) AS Total_Quantity_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity_Sold DESC;


SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders
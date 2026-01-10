CREATE DATABASE PizzaDB;
use PizzaDB;
SELECT * from pizza_sales;

-- Total revenue: the sum of the total price of all pizza orders.
SELECT sum(total_price) AS Total_Revenue from pizza_sales;

--  Average order value: the average amount spent per order, 
-- calculated by dividing the total revenue by the total number of orders
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Average_Order_Value from pizza_sales;

-- total pizzas sold: the sum of quantities of all pizzas sold
SELECT SUM(quantity) AS Total_Pizzas_Sold from pizza_sales;

-- total orders: the total number of orders placed
SELECT COUNT(DISTINCT order_id) AS Total_Order from pizza_sales;

-- average pizzas per order: the average number of pizzas sold per order, 
-- calculated by dividing the total number of pizzas sold by the total number of orders.
SELECT CAST(CAST(sum(quantity) AS DECIMAL(10,2))/ 
CAST(count(distinct order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
 AS AVERAGE_PIZZAS_PER_ORDER from pizza_sales;

-- Daily trend for total orders
SELECT order_day,
       COUNT(DISTINCT order_id) AS Total_Orders
FROM (
    SELECT DAYNAME(STR_TO_DATE(order_date, '%Y-%m-%d')) AS order_day,
           order_id
    FROM pizza_sales
) AS sub
GROUP BY order_day;

-- Monthly trend for total orders:
SELECT MONTHNAME(STR_TO_DATE(order_date, '%Y-%m-%d')) AS Month_Name,
       COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY Month_Name
ORDER BY Total_Orders DESC;

-- Percentage of sales by pizza category
SELECT pizza_category, sum(total_price) as total_sales, 
round(SUM(total_price)*100 / (SELECT SUM(total_price) from pizza_sales),2) as pct_total_sales
from pizza_sales 
WHERE round(MONTH(STR_TO_DATE(order_date, '%Y-%m-%d')),2) = 3
group by pizza_category;

-- Percentage of sales by pizza size
SELECT pizza_size, sum(total_price) as total_sales, 
round(SUM(total_price)*100 / (SELECT SUM(total_price) from pizza_sales),2) as pct_total_sales
from pizza_sales 
group by pizza_size
order by pct_total_sales desc;

-- Total pizzas sold by pizza category
SELECT pizza_category,
SUM(quantity) AS Total_Pizzas
from pizza_sales
group by pizza_category;

-- Top 5 Best Sellers by revenue: 
SELECT pizza_name, SUM(total_price) AS Total_Revenue from pizza_sales
group by pizza_name
order by Total_Revenue DESC
limit 5;

-- Top 5 Best Sellers by total quantity: and total orders
SELECT pizza_name, SUM(quantity) AS Total_Quantity from pizza_sales
group by pizza_name
order by Total_Quantity DESC
limit 5;

-- Top 5 Best Sellers by total orders:
SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders from pizza_sales
group by pizza_name
order by Total_Orders DESC
limit 5;

-- Bottom 5 best sellers by revenue, total quantity and total orders:
SELECT pizza_name, SUM(total_price) AS Total_Revenue from pizza_sales
group by pizza_name
order by Total_Revenue ASC
limit 5;

-- Bottom 5 Best Sellers by total quantity
SELECT pizza_name, SUM(quantity) AS Total_Quantity from pizza_sales
group by pizza_name
order by Total_Quantity ASC
limit 5;

-- Bottom 5 Best Sellers by total orders:
SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders from pizza_sales
group by pizza_name
order by Total_Orders ASC
limit 5;
# 🍕 Pizza Sales Analytics Dashboard | MySQL + Power BI

## Overview

End to end data analytics project analyzing pizza sales to uncover revenue trends, customer ordering behavior, and product performance.

This project demonstrates the ability to:

* Translate business requirements into KPIs
* Write SQL queries to validate metrics
* Clean and model data for BI reporting
* Build decision focused dashboards

---

## Business Objective

The client wanted a single reporting solution to:

* Track overall sales performance
* Identify peak ordering days and months
* Understand revenue contribution by pizza category and size
* Identify top and bottom performing products

---

## Key KPIs

* Total Revenue
* Average Order Value
* Total Pizzas Sold
* Total Orders
* Average Pizzas per Order

All KPIs were first calculated in **MySQL** and then validated against **Power BI measures** to ensure accuracy.

---

## Tools & Technologies

* MySQL
* Power BI
* Power Query
* DAX
* MS Excel

---

## Phase 1: SQL Analysis (MySQL)

### Database Setup

```sql
CREATE DATABASE PizzaDB;
USE PizzaDB;
```

### KPI Calculations

**Total Revenue**

```sql
SELECT SUM(total_price) AS Total_Revenue
FROM pizza_sales;
```

**Average Order Value**

```sql
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Average_Order_Value
FROM pizza_sales;
```

**Total Pizzas Sold**

```sql
SELECT SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales;
```

**Total Orders**

```sql
SELECT COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales;
```

**Average Pizzas per Order**

```sql
SELECT 
CAST(SUM(quantity) / COUNT(DISTINCT order_id) AS DECIMAL(10,2)) 
AS Avg_Pizzas_Per_Order
FROM pizza_sales;
```

---

## Phase 2: Power BI Dashboard

### Data Preparation

* Fixed data types using Power Query
* Converted text based date columns using locale
* Created derived date fields (Day, Month)

### Data Modeling & DAX

* Created DAX measures for all KPIs
* Ensured consistency by matching Power BI results with SQL outputs

---

## Power BI Dashboards

### 1. Sales Overview Dashboard

<img width="1639" height="921" alt="Image" src="https://github.com/user-attachments/assets/91fe8df1-7ab9-4b40-afe1-0e055b2a7994" />

Key insights:

* KPI summary cards for revenue, orders, and pizzas sold
* Daily and monthly order trends
* Sales distribution by pizza category and size

---

### 2. Best & Worst Sellers Dashboard
<img width="1644" height="919" alt="Image" src="https://github.com/user-attachments/assets/9584135e-d4fc-42bd-bc37-bd91caa7513a" />


Key insights:

* Top 5 and Bottom 5 pizzas by revenue
* Top and Bottom pizzas by quantity and total orders
* Identification of high and low performing products

---

## Key Insights

* Orders peak on weekends, especially Friday and Saturday evenings
* Classic category generates the highest revenue and total orders
* Large size pizzas contribute the most to total sales
* Several pizzas consistently underperform and may require optimization

---

## Repository Structure

```
├── SQL
│   └── pizza_sales_queries.sql
├── PowerBI
│   └── Pizza_Sales_Dashboard.pbix
└── README.md
```

---

## Why This Project Matters

This project demonstrates real world analytics skills including:

* Translating business requirements into measurable KPIs
* Validating BI metrics using SQL
* Cleaning and modeling data for reporting
* Building executive ready dashboards for decision making



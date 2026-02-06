/* 1. Analysis: Identifying Premium Products
   PURPOSE: Identify all items in the 'Premium Segment' (> 100 PLN).
   COLUMNS USED: 
     - '*' (All columns) to get the full context of high-value items.
   LOGIC: 
     - WHERE price > 100: Filters out low-cost, high-volume goods.
     - ORDER BY price: Sorts from cheapest to most expensive premium item.
   BUSINESS VALUE: Helps the marketing team target "high-spender" customers. */
select * 
from pet_store_sales 
where price > 100
order by price;
/* 2. Analysis: Premium Distribution by Category
   PURPOSE: Find out which departments dominate the premium market.
   COLUMNS USED: 
     - category: Our main dimension for grouping.
     - COUNT(*): To measure the "volume" (how many items we have).
   LOGIC: 
     - GROUP BY category: Essential to split the count per specific department.
     - ORDER BY DESC: Puts the most important category at the top.
   BUSINESS VALUE: Shows which department (e.g., Housing) is the most "luxurious". */
select 
	category 
	,COUNT(*) as premium_product_count
from pet_store_sales
where price > 100
group by category
order by premium_product_count desc;
/* 3. Analysis: Financial Value of Premium Stock
   PURPOSE: Calculate the total and average financial weight of premium goods.
   COLUMNS USED: 
     - SUM(price): Shows the total capital tied up in these products.
     - AVG(price): Shows the average "entry price" for a premium item in that category.
   LOGIC: 
     - GROUP BY category: Aggregates financial data for each department.
   BUSINESS VALUE: Critical for insurance and cash-flow planning. */
select
	category
	,round(sum(price), 2) as total_category_value
	,round(avg(price), 2) as average_unit_price
from pet_store_sales
where price > 100
group by category
order by total_category_value desc

# Pet Store Sales Analysis – SQL Project

Retail data analysis of a pet store with strong focus on the **premium/luxury segment**.

This project demonstrates:
- relational database design  
- data population and cleaning  
- business-oriented SQL querying  
- extraction of actionable insights for inventory & marketing decisions

## Project Goal
Identify and deeply analyze the **premium segment** (mainly luxury accessories priced > 100 PLN), calculate tied-up capital, average prices, category distribution, and highlight highest-value items for targeted marketing and inventory management.

## Key Business Questions Answered
- Which categories contain the most premium products?
- What is the total value of capital locked in luxury inventory?
- What are the average prices in the premium segment by category?
- Which specific products represent the highest value / marketing potential?

## SQL Techniques Showcased
- DDL: `CREATE TABLE`
- DML: `INSERT INTO`
- Filtering: `WHERE` comparison operators
- Aggregation: `COUNT()`, `SUM()`, `AVG()`
- Grouping: `GROUP BY`
- Formatting: `ROUND(..., 2)` for clean financial numbers

## How to Run the Project

1. Open any SQL client that supports standard SQL  
   (MySQL, PostgreSQL, SQLite, SQL Server, DBeaver, pgAdmin, etc.)

2. Execute **`01_create_tables.sql`** first  
   → creates the table and populates it with sample pet store data

3. Run **`02_data_analysis.sql`**  
   → executes all analytical queries and displays key business insights

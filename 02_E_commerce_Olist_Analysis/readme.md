# E-commerce Data Engineering & Behavioral Analytics (Olist Dataset)

## ✅ Project Status: Completed
**Advanced Data Integrity Audit & Strategic Segmentation**

The primary focus of this project was to master and apply advanced SQL techniques to solve real-world data engineering and analytical challenges. By transforming raw, "noisy" e-commerce data into high-performance analytical tables, I was able to reveal true customer retention patterns and quantify supply chain efficiency.

## 🎯 Learning Objectives & SQL Mastery
This project served as a comprehensive exercise to transition from basic querying to advanced data manipulation. Key SQL skills practiced include:
* **Complex Data Transformations:** Using CTEs (Common Table Expressions) to create readable, modular, and maintainable code for multi-stage cleaning.
* **Analytical Functions:** Implementing Window Functions like `ROW_NUMBER()` to solve complex deduplication issues and maintain data integrity.
* **Relational Logic:** Navigating intricate schema joins to resolve the "ID Mapping Paradox" and ensuring data granularity remains consistent across tables.
* **Performance Engineering:** Creating optimized **Data Marts** (aggregated tables) to shift the computational heavy-lifting from the reporting layer directly to the database engine.

## 📌 Project Overview
[cite_start]The main analytical challenge was auditing logistics through a **"Promise vs. Reality"** lens and identifying the **"Real" Loyalty** of the customer base[cite: 11, 35]. [cite_start]By resolving a critical ID-mapping issue, I transformed a dataset that appeared to have zero retention into a valuable source of behavioral insights[cite: 4, 9, 12].

## 🛠️ Data Engineering & Cleaning Highlights
A robust SQL pipeline was developed to ensure 100% data reliability:
* **Unified Customer View:** Successfully mapped transactional IDs to `customer_unique_id`, enabling accurate Lifetime Value (LTV) tracking.
* **Neutralizing Row Inflation:** Implemented `DISTINCT` logic across joins to eliminate data duplication caused by installment payment records.
* **Schema Safety:** Adjusted data types (e.g., `VARCHAR` for postal codes) to preserve leading zeros and optimized storage efficiency.
* **Human-Readable Views:** Created a "Gold" layer of SQL Views to sanitize category names and format currencies for business reporting.

## 💡 Key Analytical Deliveries

### 1. Behavioral RFM Segmentation
I implemented a custom **Recency, Frequency, Monetary** model to categorize customers into actionable segments:
* [cite_start]**Recent Champions:** Identified an elite group of 225 customers with a 10% retention rate—significantly higher than the platform average[cite: 16].
* [cite_start]**At-Risk High-Value:** Detected 468 premium customers (lifetime spend > 1,000 units) who show early signs of churn, representing a critical win-back opportunity[cite: 17, 20, 21].

### 2. High-Performance Data Marts
[cite_start]I engineered two specialized analytical tables (Data Marts) to provide a structured overview of the business[cite: 23, 29, 30]:
* **`sales_trends`**: Tracks monthly revenue and order growth, identifying seasonal peaks like the November 2017 spike.
* **`logistic_performance`**: A geographical breakdown of shipping efficiency, tracking `delay_days` and `pct_late` across all Brazilian states.

## 📈 Final Business Insights
* **The "Leaky Bucket" Discovery:** While 97% of users are one-time buyers, I successfully uncovered a hidden core of **~2,400 repeat customers**[cite: 13, 14, 15].
* [cite_start]**Logistics Efficiency:** Most packages arrive 8 to 21 days *before* the estimate, though specific regions face late-delivery rates exceeding 20%[cite: 39, 40].
* [cite_start]**Operational Benchmark:** São Paulo (SP) remains the logistical leader, handling the highest volume of orders with the most efficient performance[cite: 41].

## 📂 Project Structure
* `1_Phase_Data_cleaning/`: SQL scripts for schema optimization and audit.
* `2_Phase_RFM/`: Logic for behavioral segmentation and retention analysis.
* `3_Phase_Data_marts/`: Final aggregated tables for sales and logistics.

## 📊 Data Source
**Brazilian E-Commerce Public Dataset by Olist** 🔗 [Kaggle Dataset](https://www.kaggle.com/datasets/olistbr/brain-ecommerce)  
Last updated: **March 15, 2026**

# E-commerce Logistics & Data Quality Analysis (Olist Dataset)

## 🚧 Project Status: Advanced Analysis & Validation
Advanced Data Integrity Audit: Successfully resolved complex ID-mapping issues to reveal true customer retention patterns and operational bottlenecks.

**Current Stage:** - [x] Database Ingest & Schema Setup
- [x] Data Cleaning (Handling NULLs & Duplicates)
- [x] Advanced RFM Segmentation (Unified Customer Logic)
- [x] **Logistic & Sales Data Modeling (Data Marts)**
- [ ] Business KPI Dashboard - *Planned*

---

## 📌 Project Overview
This project analyzes the Brazilian e-commerce market using the Olist dataset. The main challenge was solving the ID Mapping Paradox to build a reliable RFM model and auditing supply chain efficiency through a "Promise vs. Reality" lens.

## 💡 Key Analytical Discovery: Identifying "Real" Loyalty
1. Identifying "Real" Loyalty
The Trap: Initial analysis showed 0% retention because customer_id changes with every order.
The Solution: Performed a JOIN with customer_unique_id and used COUNT(DISTINCT order_id) to bypass "row inflation" caused by installment payments.
The Result: Revealed over 2,400 repeat customers and a top performer with 15 unique orders, previously hidden in the data.

2. The "Promise vs. Reality" Gap (Logistics)
The Discovery: Created a delay_days metric to audit the gap between estimated and actual delivery.
Optimization: Developed specialized Data Marts (sales_trends & logistic_performance) in SQL to aggregate 100k+ rows, ensuring a lightweight and responsive Excel dashboard.

## 🛠️ Data Engineering & Cleaning
I implemented a robust SQL pipeline to ensure 100% data accuracy:

1. **Transaction Integrity:** Applied `DISTINCT` logic across joins to neutralize the impact of installment payments on frequency metrics.
2. **Unified Customer Logic:** Grouped all metrics by `customer_unique_id` to track the actual Lifetime Value (LTV) of each person.
3. **Advanced Duplicate Resolution:** Used **Window Functions (`ROW_NUMBER`)** to maintain high-quality review data.

## 📈 Key Business Insights
The Loyalty Core: Identified elite customers with a 10% retention rate.
At-Risk High-Value: Found 468 premium customers (spend >1000 units) facing churn risk.
Operational Bottlenecks: Segmented logistics performance by state to pinpoint regional delivery delays.

## 📊 Data Source
The dataset used is the **Brazilian E-Commerce Public Dataset by Olist**, available on [Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce). 

Last update: 14.02.2026
---
*Last update: 08.02.2026*

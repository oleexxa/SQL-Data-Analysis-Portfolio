# E-commerce Logistics & Data Quality Analysis (Olist Dataset)

## 🚧 Project Status: Advanced Analysis & Validation
This project has moved from basic data cleaning to a deep-dive data integrity audit. I have successfully identified and resolved complex ID-mapping issues, revealing the true customer retention patterns.

**Current Stage:** - [x] Database Ingest & Schema Setup
- [x] Data Cleaning (Handling NULLs & Duplicates)
- [x] **Advanced RFM Segmentation (Unified Customer Logic)**
- [ ] Business KPI Dashboard - *Planned*

---

## 📌 Project Overview
This project analyzes the Brazilian e-commerce market using the Olist dataset. The main challenge was distinguishing between transactional session IDs and unique customer identities to build a reliable RFM (Recency, Frequency, Monetary) model.

## 💡 Key Analytical Discovery: Identifying "Real" Loyalty
The breakthrough in this project was solving the **ID Mapping Paradox**:

1. **The Trap:** Initial analysis showed 0% retention because `customer_id` changes with every order. 
2. **Technical Discovery:** I identified that `order_payments` contains multiple rows for a single order (up to 29 installments), causing "row inflation."
3. **The Solution:** I performed a `JOIN` with the `customers` table to access `customer_unique_id`. By using `COUNT(DISTINCT order_id)`, I successfully separated technical payment artifacts from genuine repeat purchases.
4. **The Result:** I discovered a core group of loyal customers, including a top performer with **15 unique orders**, which was previously hidden in the data.



## 🛠️ Data Engineering & Cleaning
I implemented a robust SQL pipeline to ensure 100% data accuracy:

1. **Transaction Integrity:** Applied `DISTINCT` logic across joins to neutralize the impact of installment payments on frequency metrics.
2. **Unified Customer Logic:** Grouped all metrics by `customer_unique_id` to track the actual Lifetime Value (LTV) of each person.
3. **Advanced Duplicate Resolution:** Used **Window Functions (`ROW_NUMBER`)** to maintain high-quality review data.

## 📈 Key Business Insights
The final RFM analysis revealed:
* **The Loyalty Core:** While 97% are one-time buyers, I identified over **2,400 repeat customers** who were previously "invisible."
* **Recent Champions:** Identified 225 elite customers with a **10% retention rate**—the highest in the company.
* **At-Risk High-Value:** Found 468 premium customers (spent >1000 units) who are about to churn, representing a major revenue recovery opportunity.

## 📊 Data Source
The dataset used is the **Brazilian E-Commerce Public Dataset by Olist**, available on [Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce). 

---
*Last update: 08.02.2026*

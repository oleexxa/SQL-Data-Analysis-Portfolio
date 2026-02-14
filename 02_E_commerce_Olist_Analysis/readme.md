# E-commerce Logistics & Data Quality Analysis (Olist Dataset)
## 🚧 Project Status: Advanced Analysis & Validation
Advanced Data Integrity Audit: Successfully resolved complex ID-mapping issues to reveal true customer retention patterns and operational bottlenecks.

**Current Stage:**  
- [x] Database Ingest & Schema Setup  
- [x] Data Cleaning (Handling NULLs & Duplicates)  
- [x] Advanced RFM Segmentation (Unified Customer Logic)  
- [x] Logistic & Sales Data Modeling (Data Marts)  
- [ ] Business KPI Dashboard – *Planned*

## 📌 Project Overview
This project analyzes the Brazilian e-commerce market using the Olist dataset.  
The main analytical challenge was solving the **ID Mapping Paradox** to build a reliable RFM model and auditing supply chain efficiency through a **"Promise vs. Reality"** lens.

## 💡 Key Analytical Discoveries

### 1. Identifying "Real" Loyalty
**The Trap:** Initial analysis showed ~0% retention because `customer_id` changes with every order.  

**The Solution:** Performed a JOIN on `customer_unique_id` and used `COUNT(DISTINCT order_id)` to eliminate row inflation caused by multiple installments and order items.

**The Result:** Revealed **~2,400 repeat customers** (clients with 2+ unique orders), with one top performer placing **15 orders** – patterns completely hidden in naive per-order counting.

### 2. The "Promise vs. Reality" Gap (Logistics)
**The Discovery:** Created a `delay_days` metric to measure the real difference between estimated delivery date and actual delivery date.

**Optimization:** Built lightweight aggregated Data Marts (`sales_trends` & `logistic_performance`) in SQL – pre-aggregated 100k+ rows for fast, responsive Excel/Power BI dashboards.

## 🛠️ Data Engineering & Cleaning Highlights
Robust SQL pipeline ensuring high data quality:

- Transaction integrity: `DISTINCT` logic across joins to neutralize inflation from payment installments  
- Unified customer view: All key metrics grouped by `customer_unique_id` → true Lifetime Value (LTV) tracking  
- Advanced duplicate handling: Window functions (`ROW_NUMBER`) to keep the highest-quality review records

## 📈 Key Business Insights
- **Loyalty core:** ~2,400 repeat buyers identified (real retention much higher than initially visible)  
- **At-risk high-value segment:** 468 premium customers (lifetime spend > 1 000 BRL) showing potential early churn signals  
- **Operational bottlenecks:** Clear regional differences in delivery delays – state-level segmentation highlights critical underperforming areas

## 📊 Data Source
Brazilian E-Commerce Public Dataset by Olist  
🔗 [Kaggle – Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)  
Last updated: **14 February 2026**

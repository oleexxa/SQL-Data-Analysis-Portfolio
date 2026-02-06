# E-commerce Logistics & Data Quality Analysis (Olist Dataset)

## 🚧 Project Status: Work in Progress
This project is currently under active development. I am documenting my progress step-by-step as I move from data engineering to business insights.

**Current Stage:** - [x] Database Ingestion & Schema Setup
- [x] Comprehensive Data Cleaning (NULL Audit & Duplicate Resolution)
- [ ] Exploratory Data Analysis (EDA) - *In Progress*
- [ ] Business KPI Dashboard - *Planned*

---

## 📌 Project Overview
This project focuses on the Brazilian e-commerce market using the Olist dataset. The primary goal is to perform a deep-dive data quality audit and prepare a reliable database for business intelligence reporting.

## 🛠️ Phase 1: Data Ingestion & Cleaning
I started the project by setting up the database environment and implementing a multi-stage cleaning process:

1. **Advanced Duplicate Resolution:** In the `order_reviews` table, I used **Window Functions (`ROW_NUMBER`)** and **CTEs** to preserve only the most recent reviews.
   
2. **Comprehensive NULL Audit:** I identified and handled **610 incomplete records** in the product table to ensure 100% data integrity for future analysis.

3. **Schema Optimization:** Standardized geographical data and created a **SQL View layer** to separate raw data from the analytical layer.

## 🚀 Future Process Optimization
While this project is being executed in **SQL** for full logic control, I plan to leverage **Power Query** in future stages for faster data profiling.

## 📊 Data Source
The dataset used in this project is the **Brazilian E-Commerce Public Dataset by Olist**, available on [Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce). 
Due to file size limitations, the raw CSV files are not included in this repository.

---
*Last update: 06.02.2026

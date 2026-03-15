# E-commerce Analysis (SQL Practice Project)

## ✅ Status: Completed
The primary goal of this project was to apply advanced **SQL techniques** to a real-world dataset. I focused on cleaning "noisy" data and transforming raw tables into structured business insights.

## 🎯 Learning Objectives (SQL Mastery)
This project served as a comprehensive exercise to transition from basic querying to advanced data manipulation. I practiced:
* **Complex Relational Logic:** I resolved a major issue where customer retention appeared to be zero. By mapping data to `customer_unique_id`, I successfully identified repeat purchasing patterns.
* **Data Integrity & Cleaning:** I neutralized "row inflation" caused by installment payments and removed duplicates using Window Functions (`ROW_NUMBER`), ensuring the final metrics are accurate.
* **Performance Engineering:** I built optimized **Data Marts** (aggregated tables). These pre-calculated tables allow for efficient analysis without the need to process thousands of raw records repeatedly.

## 📌 Project Focus
Instead of jumping into visualization, I focused on creating high-quality, pre-aggregated data models that provide immediate business value. I developed four core analytical views:

* **RFM Segmentation:** A strategic table categorizing customers into segments like *Recent Champions*, *At Risk High-Value*, and *New/Active*. This allows for targeted marketing actions based on customer lifetime value (CLV).
* **Sales Trends Analysis:** A time-series dataset (Year/Month) tracking total revenue, order volume, and customer growth trends, enabling the business to identify seasonal patterns.
* **Geographic Logistics Audit:** A comprehensive performance map by Brazilian states, calculating `delay_day_avg` and `on_time_delivery_rate`. This identifies which regions suffer from supply chain bottlenecks.
* **Customer Base Master-Table:** A clean, de-duplicated view of unique customers with aggregated metrics like `total_spent` and `avg_order_value`, solving the fragmented ID issue.

## 💡 Key Analytical Insights
* **Hidden Loyalty:** While most users are one-time buyers, I identified a core group of over 2,400 repeat customers that were previously "invisible" due to data errors.
* **Regional Logistics:** My analysis shows that most packages arrive 8 to 21 days before the estimated date. However, I also identified specific regions where the late-delivery rate exceeds 20%.
* **Growth Patterns:** Through data aggregation, I noticed that November 2017 was the peak period for the platform, reaching over $1.1 million in total revenue.

## 🛠️ Project Structure
* `1_Cleaning`: SQL scripts for data validation and schema optimization.
* `2_Segmentation`: Logic for RFM analysis and customer categorization.
* `3_Data_Marts`: Final aggregated tables for sales trends and logistics.

## 📊 Data Source
Brazilian E-Commerce Public Dataset by Olist (Kaggle).  
*Project Last Updated: March 15, 2026*

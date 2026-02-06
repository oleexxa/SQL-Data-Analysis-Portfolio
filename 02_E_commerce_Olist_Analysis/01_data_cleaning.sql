/* 1. STANDARDIZING GEOGRAPHIC DATA
Convert city names to uppercase for consistent joins and filtering */
UPDATE customers
SET customer_city = UPPER(customer_city);

UPDATE sellers 
SET seller_city = UPPER(seller_city);


/* 2. REFINING FINANCIAL DATA PRECISION 
Set prices and values to DECIMAL(10,2) to ensure consistent two-decimal currency formatting */
ALTER TABLE order_items 
MODIFY COLUMN price DECIMAL(10,2),
MODIFY COLUMN freight_value DECIMAL(10,2);

ALTER TABLE order_payments 
MODIFY COLUMN payment_value DECIMAL(10,2);


/* 3. CREATING PRESENTATION VIEWS (THE "GOLD" LAYER) 
Clean payment method names by replacing underscores with spaces */
CREATE OR REPLACE VIEW v_payments_pretty AS
SELECT 
    order_id,
/* Replace underscores with spaces and format for better readability */
    REPLACE(payment_type, '_', ' ') AS payment_method,
    CAST(payment_value AS DECIMAL(10,2)) AS payment_amount
FROM order_payments;

/* Create readable English category names for business reporting */
CREATE OR REPLACE VIEW v_category_translation AS
SELECT 
    product_category_name, 
/* Replace underscores with spaces and format for better readability */
    REPLACE(product_category_name_english, '_', ' ') AS category_english_pretty
FROM product_category_name_translation;

/* Clean product category names for easier analysis in the catalog */
CREATE OR REPLACE VIEW v_products_pretty AS
SELECT 
    product_id,
/* Replace underscores with spaces and format for better readability */
    REPLACE(product_category_name, '_', ' ') AS product_category_pretty,
    product_weight_g,
    product_length_cm,
    product_height_cm,
    product_width_cm
FROM products;

select *
from order_reviews;

SELECT review_id, COUNT(*)
FROM order_reviews
GROUP BY review_id
HAVING COUNT(*) > 1;
/* Duplicates identified in the order_reviews table based on review_id. */

/* 1. Create a backup of the original table.
Safety first - we want to have a copy before performing any delete/modify operations. */
CREATE TABLE order_reviews_backup AS 
SELECT * FROM order_reviews;

/* 2. Create a final clean table using ROW_NUMBER.
We partition by review_id to group duplicates together.
We use MIN() or just pick the first occurrence to ensure only ONE row per ID exists. */
CREATE TABLE order_reviews_final AS
SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY review_id /* This groups the data by the ID that we know is duplicated */
               ORDER BY review_creation_date DESC /* In case of differences, we keep the most recent one */
           ) AS row_num
    FROM order_reviews
) AS subquery
WHERE row_num = 1; /* We only take the first unique occurrence */

/* 3. Final Verification.
Checking if any review_id still has more than one row. */
SELECT review_id, COUNT(*)
FROM order_reviews_final
GROUP BY review_id
HAVING COUNT(*) > 1;

/* NULL Audit: Checking data completeness across all tables. 
   Removing products with missing categories to ensure reporting accuracy. */
SELECT 
    COUNT(*) AS total_products,
    COUNT(*) - COUNT(product_id) AS null_product_id,
    COUNT(*) - COUNT(product_category_name) AS null_product_category_name,
    COUNT(*) - COUNT(product_name_lenght) AS null_product_name_lenght,
    COUNT(*) - COUNT(product_description_lenght) AS null_product_description_lenght,
    COUNT(*) - COUNT(product_photos_qty) AS null_product_photos_qty,
    COUNT(*) - COUNT(product_weight_g) AS null_product_weight_g,
    COUNT(*) - COUNT(product_length_cm) AS null_product_length_cm,
    COUNT(*) - COUNT(product_height_cm) AS null_product_height_cm,
    COUNT(*) - COUNT(product_width_cm) AS null_product_width_cm
FROM products;

/* 1. Creating a clean version of the products table.
We exclude rows where the product_category_name is NULL, 
as these records lack essential information for analysis. */
CREATE TABLE products_final AS
SELECT * FROM products
WHERE product_category_name IS NOT NULL;

/* 2. Verification.
Check if any NULLs remained in the category column. */
SELECT COUNT(*) 
FROM products_final
WHERE product_category_name IS NULL;



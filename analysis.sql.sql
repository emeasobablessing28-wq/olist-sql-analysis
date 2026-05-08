-- =====================================
-- 1. DATA OVERVIEW
-- =====================================
SELECT COUNT(*) FROM orders_dataset;
SELECT 
    COUNT(*) AS total,
    COUNT(order_delivered_customer_date) AS delivered
FROM orders_dataset;

-- =====================================
-- 2. RELATIONSHIP CHECK
-- =====================================
--Order ↔ Payments
SELECT COUNT(*)
FROM Orders_dataset o
LEFT JOIN Order_payments_dataset P
ON o.Order_id = p.Order_id
WHERE p.Order_id IS NULL;

--Orders ↔ Customers
SELECT COUNT(*)
FROM orders_dataset o
LEFT JOIN customers_dataset c
ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

-- =====================================
-- 3. REVENUE ANALYSIS
-- =====================================
SELECT 
    strftime('%Y-%m', o.order_purchase_timestamp) AS month,
    SUM(p.payment_value) AS total_revenue,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM orders_dataset o
JOIN order_payments_dataset p
ON o.order_id = p.order_id
GROUP BY month
ORDER BY month;

-- =====================================
-- 4. DELEVERY PERFORMANCE ANALYSIS
-- =====================================
-- Delivery time in days
SELECT 
    AVG(julianday(order_delivered_customer_date) - julianday(order_purchase_timestamp)) AS avg_delivery_days
FROM orders_dataset
WHERE order_delivered_customer_date IS NOT NULL;

-- Late deliveries
SELECT 
    COUNT(*) AS total_orders,
    SUM(CASE 
        WHEN order_delivered_customer_date > order_estimated_delivery_date THEN 1 
        ELSE 0 
    END) AS late_deliveries
FROM orders_dataset
WHERE order_delivered_customer_date IS NOT NULL;

-- Delivery time vs review score
SELECT 
    r.review_score,
    AVG(julianday(o.order_delivered_customer_date) - julianday(o.order_purchase_timestamp)) AS avg_delivery_days,
    COUNT(*) AS total_orders
FROM orders_dataset o
JOIN order_reviews_dataset r
ON o.order_id = r.order_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY r.review_score
ORDER BY r.review_score;

-- ===========================================
-- 4. PRODUCT/CATEGORY PERFORMANCE ANALYSIS
-- ===========================================
-- Top product categories by revenue
SELECT 
    t.product_category_name_english AS category,
    SUM(oi.price) AS total_revenue,
    COUNT(*) AS total_items_sold
FROM order_items_dataset oi
JOIN products_dataset p
ON oi.product_id = p.product_id
JOIN product_category_name_translation t
ON p.product_category_name = t.product_category_name
GROUP BY category
ORDER BY total_revenue DESC
LIMIT 10;

-- Categories by orders (not just items)
SELECT 
    t.product_category_name_english AS category,
    COUNT(DISTINCT oi.order_id) AS total_orders,
    SUM(oi.price) AS total_revenue
FROM order_items_dataset oi
JOIN products_dataset p
ON oi.product_id = p.product_id
JOIN product_category_name_translation t
ON p.product_category_name = t.product_category_name
GROUP BY category
ORDER BY total_orders DESC
LIMIT 10;

-- Average price per category
SELECT 
    t.product_category_name_english AS category,
    AVG(oi.price) AS avg_price,
    SUM(oi.price) AS total_revenue
FROM order_items_dataset oi
JOIN products_dataset p
ON oi.product_id = p.product_id
JOIN product_category_name_translation t
ON p.product_category_name = t.product_category_name
GROUP BY category
ORDER BY avg_price DESC
LIMIT 10;















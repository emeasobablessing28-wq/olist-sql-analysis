# Olist SQL Analysis

## Project Overview
This project analyzes the Olist Brazilian E-Commerce dataset using SQL to explore key business areas including revenue trends, product performance, delivery efficiency, and customer satisfaction.

## Tools Used
- SQLite (DB Browser)
- SQL

---

## Key Insights

### Revenue Analysis
Monthly revenue and order volume show an overall upward trend, indicating growth in platform usage over time. Short-term fluctuations are observed, where decreases in revenue closely align with drops in order volume, suggesting that revenue is primarily driven by transaction count. A sharp decline in the final months (September–October 2018) is likely due to incomplete data rather than an actual drop in business performance.

---

### Delivery Performance Analysis
There is a strong inverse relationship between delivery time and customer satisfaction. Orders with lower review scores experience significantly longer delivery times, with 1-star reviews averaging over 21 days compared to approximately 11 days for 5-star reviews. With an overall average delivery time of 12 days and about 8% of orders delivered late, delivery speed appears to be a key driver of customer satisfaction.

---

### Product & Category Analysis
Revenue is concentrated within a small group of product categories, with **Health & Beauty** and **Watches & Gifts** emerging as the top contributors. While **Bed, Bath & Table** records the highest number of items sold, its revenue is comparatively lower, indicating a lower average price per item. In contrast, **Watches & Gifts** generates high revenue with fewer sales, suggesting higher-value transactions. This highlights that revenue is driven by both high-volume and high-value product segments.

---

### Overall Summary
The analysis shows that Olist’s performance is driven by three key factors: transaction volume, product category dynamics, and delivery efficiency. Revenue growth is largely influenced by order volume, while different product categories contribute through either high sales volume or higher pricing. Additionally, delivery performance plays a critical role in shaping customer satisfaction, with delays leading to lower review scores.

---

## Dataset
This project uses the Brazilian E-Commerce Public Dataset by Olist.

Dataset link:  
https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

*Note: Due to file size limitations, the database file is not included in this repository.*

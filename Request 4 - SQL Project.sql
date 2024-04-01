SELECT segment, 
SUM(CASE WHEN fiscal_year = 2020 THEN 1 ELSE 0 END) as product_count_2020,
SUM(CASE WHEN fiscal_year = 2021 THEN 1 ELSE 0 END) as product_count_2021,
SUM(CASE WHEN fiscal_year = 2021 THEN 1 ELSE 0 END) - SUM(CASE WHEN fiscal_year = 2020 THEN 1 ELSE 0 END) AS difference
FROM (SELECT DISTINCT product_code, fiscal_year FROM fact_sales_monthly) as unique_products_year
JOIN dim_product 
USING (product_code)
GROUP BY segment
ORDER BY difference DESC;



 
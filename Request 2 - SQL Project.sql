SELECT
    SUM(CASE WHEN fiscal_year = 2020 THEN 1 ELSE 0 END) AS unique_products_2020,
    SUM(CASE WHEN fiscal_year = 2021 THEN 1 ELSE 0 END) AS unique_products_2021,
    ROUND(((SUM(CASE WHEN fiscal_year = 2021 THEN 1 ELSE 0 END) - SUM(CASE WHEN fiscal_year = 2020 THEN 1 ELSE 0 END)) / SUM(CASE WHEN fiscal_year = 2020 THEN 1 ELSE 0 END)) * 100, 2) AS percentage_chg
FROM
    (SELECT DISTINCT product_code, fiscal_year FROM fact_sales_monthly) AS unique_products_per_year;

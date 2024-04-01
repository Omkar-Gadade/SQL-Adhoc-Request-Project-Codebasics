WITH cte1 as 
(
SELECT f.fiscal_year, p.division, f.product_code, p.product, SUM(f.sold_quantity) as total_sold_quantity,
dense_rank() over (partition by p.division order by SUM(f.sold_quantity) desc) as rank_order
FROM fact_sales_monthly f
JOIN dim_product p
USING (product_code)
WHERE f.fiscal_year = 2021
GROUP BY 2, 3, 4
)


SELECT division, product_code, product, total_sold_quantity, rank_order
FROM cte1
WHERE rank_order <=3
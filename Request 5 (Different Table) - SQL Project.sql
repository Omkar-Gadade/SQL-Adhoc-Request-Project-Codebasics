with cte1 as (
SELECT p.product_code, p.product, m.manufacturing_cost 
FROM fact_manufacturing_cost m
JOIN dim_product p
USING (product_code)
)

(SELECT product_code, product, manufacturing_cost
FROM cte1
ORDER BY manufacturing_cost DESC LIMIT 5)
UNION
(SELECT product_code, product, manufacturing_cost
FROM cte1
ORDER BY manufacturing_cost ASC LIMIT 5);


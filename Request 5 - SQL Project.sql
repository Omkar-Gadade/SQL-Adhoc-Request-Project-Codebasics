with cte1 as (
SELECT p.product_code, p.product, m.manufacturing_cost 
FROM fact_manufacturing_cost m
JOIN dim_product p
USING (product_code)
)

SELECT product_code, product, manufacturing_cost
FROM cte1
WHERE manufacturing_cost = (SELECT max(manufacturing_cost) FROM fact_manufacturing_cost)
OR    manufacturing_cost = (SELECT min(manufacturing_cost) FROM fact_manufacturing_cost)
ORDER BY manufacturing_cost DESC;


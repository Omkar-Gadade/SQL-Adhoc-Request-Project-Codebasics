SELECT segment, COUNT(product_code) as Product_Count
FROM dim_product
GROUP BY segment
ORDER BY Product_Count DESC;

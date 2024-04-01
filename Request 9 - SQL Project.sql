WITH cte1 as
(
SELECT c.channel, ROUND(SUM(g.gross_price*f.sold_quantity)/1000000, 2) as Gross_Sales_Mln
FROM fact_sales_monthly f
JOIN dim_customer c 
USING (customer_code)
JOIN fact_gross_price g
USING (product_code, fiscal_year)
WHERE f.fiscal_year = 2021
GROUP BY c.channel
)

SELECT channel, Gross_Sales_Mln,
CONCAT(ROUND((Gross_Sales_Mln*100)/(SELECT SUM(Gross_Sales_Mln) FROM cte1), 2), " %")  as pct_contr
FROM cte1
ORDER BY Gross_Sales_Mln DESC;
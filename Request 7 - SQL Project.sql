With cte1 as
(
SELECT f.date, f.fiscal_year, c.customer, f.sold_quantity, g.gross_price, f.product_code
FROM fact_sales_monthly f
JOIN fact_gross_price g
using (product_code, fiscal_year)
JOIN dim_customer c
using (customer_code)
)


SELECT CONCAT(MONTHNAME(date), " (", YEAR(date), ")") as "Month", fiscal_year as "Year", CONCAT(ROUND(SUM(gross_price*sold_quantity)/1000000, 2), "M") as "Gross_Sales_Amt_MLN"

 FROM cte1 
 WHERE customer = "Atliq Exclusive"
 group by date



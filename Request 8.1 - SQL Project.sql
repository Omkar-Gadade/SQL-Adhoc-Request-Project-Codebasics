with cte1 as
(
SELECT date, fiscal_year,
(
CASE 
WHEN MONTH(date) in (09, 10, 11) THEN "Q1"
WHEN MONTH(date) in (12, 01, 02) THEN "Q2"
WHEN MONTH(date) in (03, 04, 05) THEN "Q3"
ELSE "Q4"
END
) as Qtr, sold_quantity
FROM fact_sales_monthly 
)

SELECT monthname(date), Qtr, SUM(sold_quantity) as sold_quantity_Mln
FROM cte1
WHERE fiscal_year = 2020
group by monthname(date), Qtr
ORDER BY sold_quantity_Mln desc;
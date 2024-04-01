with cte1 as (
SELECT f.customer_code, f.fiscal_year, c.customer, c.market, f.pre_invoice_discount_pct
FROM fact_pre_invoice_deductions f
JOIN dim_customer c
using (customer_code)
)

select customer_code, customer, ROUND(avg(pre_invoice_discount_pct)*100, 2) as avge
from cte1 
where fiscal_year = 2021 and market = "India"
group by customer_code
order by avge desc limit 5;
# Write your MySQL query statement below
select trim(lower(product_name)) as product_name, left(sale_date,7) as sale_date, count(product_name) as total
from sales
group by 1, 2
order by 1, 2
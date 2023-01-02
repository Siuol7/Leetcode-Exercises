# Write your MySQL query statement belo
with cte as (select seller_id, ifnull(sum(order_cost),0) as total
from orders
where year(sale_date)='2020'
group by 1)

select seller_name from seller s
where seller_id not in (select seller_id from cte)
order by seller_name asc
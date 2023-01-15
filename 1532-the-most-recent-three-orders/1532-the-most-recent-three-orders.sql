# Write your MySQL query statement below
with sub as (select customer_id,order_id,order_date,dense_rank()over(partition by customer_id order by order_date desc) as rnk
from orders )
select c.name as customer_name, s.customer_id,s.order_id,s.order_date from sub s
inner join customers c
using(customer_id)
where s.rnk<=3
order by 1,2,4 desc
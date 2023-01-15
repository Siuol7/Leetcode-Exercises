# Write your MySQL query statement below
select customer_id,product_id,product_name from
(select o.customer_id,product_id,count(o.product_id) as cnt, p.product_name,dense_rank()over(partition by customer_id order by count(o.product_id) desc) as rnk
from orders o
inner join products p
using(product_id)
group by o.customer_id,o.product_id) t
where rnk=1

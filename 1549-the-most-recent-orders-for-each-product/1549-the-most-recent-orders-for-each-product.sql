with sub as(select order_id,product_id,ordeR_date,dense_rank()over(partition by product_id order by order_date desc) as rnk
from orders)
select p.product_name,s.product_id,s.order_id,s.order_date from sub s
inner join products p
using(product_id)
where rnk=1
order by 1, 2,3
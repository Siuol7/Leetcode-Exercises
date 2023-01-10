# Write your MySQL query statement below
select user_id,product_id from(
select s.user_id,p.product_id, sum(s.quantity*p.price),
        dense_rank()over(partition by s.user_id order by sum(s.quantity*p.price) desc) as rnk
from sales s
inner join product p
using(product_id)
group by 1,2 ) t
where rnk=1


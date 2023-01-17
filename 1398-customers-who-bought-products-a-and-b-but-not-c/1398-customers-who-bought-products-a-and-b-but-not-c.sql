# Write your MySQL query statement below
select t.customer_id,c.customer_name
from orders t
inner join customers c
using(customer_id)
group by 1
having count( case when product_name='A' then 1 end)>0 and 
    count( case when product_name='B' then 1 end)>0 and 
    count( case when product_name='C' then 1 end)=0


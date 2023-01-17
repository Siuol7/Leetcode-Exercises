# Write your MySQL query statement below
with cte as (select p.invoice_id, sum(p.quantity*q.price) as total 
from purchases p
left join products q
using(product_id)
group by 1
order by 2 desc, 1
limit 1)
select p.product_id, p.quantity, p.quantity*q.price as price 
from purchases p
left join products q
using(product_id)
where p.invoice_id =(select invoice_id from cte)

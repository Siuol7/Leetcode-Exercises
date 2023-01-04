# Write your MySQL query statement below
select p.name,ifnull(sum(i.rest),0) as rest,ifnull(sum(i.paid),0) as paid, ifnull(sum(i.canceled),0) as canceled, ifnull(sum(i.refunded),0) as refunded 
from invoice i
right join product p
using(product_id)
group by product_id
order by 1
# Write your MySQL query statement below
select order_id 
from ordersdetails
group by 1
having max(quantity)>(select max(m2) from (select avg(quantity) as m2
from ordersdetails
group by order_id) t)



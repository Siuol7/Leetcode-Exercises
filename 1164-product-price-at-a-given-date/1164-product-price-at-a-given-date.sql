# Write your MySQL query statement below
with cte as (select product_id,max(change_date) as md
from products
where change_date <='2019-08-16'
group by product_id)

select p.product_id,p.new_price as price from cte c
left join products p
on p.change_date=c.md and p.product_id=c.product_id
union 
select product_id, 10 as price
from products
where product_id not in (select distinct product_id from cte) 


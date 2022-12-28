# Write your MySQL query statement below
select  distinct product_id, sum(quantity) as total_quantity
from sales 
group by product_id
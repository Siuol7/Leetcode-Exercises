# Write your MySQL query statement below
with cte as(select product_id,count(product_id) as cnt,year(purchase_date) as year
from orders 
group by 3,1
having count(cnt)>=3)

select distinct c1.product_id
from cte c1
inner join cte c2
on c1.product_id=c2.product_id and c2.year-c1.year=1


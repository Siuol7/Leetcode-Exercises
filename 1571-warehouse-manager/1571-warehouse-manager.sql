# Write your MySQL query statement below
select w.name as warehouse_name, sum(p.width*p.length*p.height*w.units) as volume 
from warehouse w
left join products p
using(product_id)
group by name
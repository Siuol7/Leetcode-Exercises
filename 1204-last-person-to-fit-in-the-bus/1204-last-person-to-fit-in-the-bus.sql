# Write your MySQL query statement below
select person_name 
from (select turn,person_name,weight,sum(weight) over(order by turn asc) as total
            from queue) t
where total <=1000
order by total desc
limit 1

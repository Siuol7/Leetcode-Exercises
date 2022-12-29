# Write your MySQL query statement below
with cte as (select count(employee_id) as cnt from project
group by project_id
order by cnt desc
limit 1)
select project_id
from project
group by project_id
having count(employee_id)=(select * from cte)

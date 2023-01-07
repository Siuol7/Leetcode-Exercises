# Write your MySQL query statement below
select project_id,employee_id 
from (select p.project_id,p.employee_id, dense_rank() over(partition by p.project_id order by e.experience_years desc) as rnk 
from project p
left join employee e
using(employee_id)) t
where rnk=1


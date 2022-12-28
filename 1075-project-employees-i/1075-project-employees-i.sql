# Write your MySQL query statement bel
select p.project_id, round(avg(e.experience_years),2) as average_years
from project p
left join employee e
using(employee_id)
group by project_id
# Write your MySQL query statement below
select e.employee_id,e.name,e.salary,t.rnk as team_id
from employees e
inner join (select employee_id,name,salary,count(salary) as cnt, rank() over(order by salary asc) as rnk 
from employees
group by salary
having cnt>=2) t
using(salary)
order by 4,1
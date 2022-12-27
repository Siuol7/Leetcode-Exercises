# Write your MySQL query statement below
with cte as(select dense_rank() over(partition by departmentID order by salary desc) as'rank',id, name, salary,departmentId from employee)
select d.name as 'Department',e.name as 'Employee', e.Salary
from cte e
inner join Department d
on e.departmentID=d.id
where e.rank<=3
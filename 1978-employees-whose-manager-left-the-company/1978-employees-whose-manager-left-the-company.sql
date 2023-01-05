# Write your MySQL query statement below
with cte as(select manager_id from employees where manager_id not in (select employee_id from employees))
select employee_id from employees
where manager_id in (select manager_id from cte) and salary<30000
order by employee_id
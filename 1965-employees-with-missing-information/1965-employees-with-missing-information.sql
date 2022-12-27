# Write your MySQL query statement below
select a.employee_id from employees a
where a.employee_id not in (select b.employee_id from salaries b)
union all
select b.employee_id from salaries b
where b.employee_id not in (select a.employee_id from employees a)
order by employee_id
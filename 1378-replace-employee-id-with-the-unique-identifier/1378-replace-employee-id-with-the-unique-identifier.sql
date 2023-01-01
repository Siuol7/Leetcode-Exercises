# Write your MySQL query statement below
select ifnull(e2.unique_id,null) as unique_id, e1.name from employees e1
left join employeeuni e2
using (id)

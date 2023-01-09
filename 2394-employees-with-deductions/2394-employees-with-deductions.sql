# Write your MySQL query statement below
with cte as(  select employee_id,sum(total) as total from (select employee_id, 
    case 
    when second(out_time)-second(in_time)>0 then timestampdiff(minute,in_time,out_time)+1
    else  timestampdiff(minute,in_time,out_time)
    end  as total
from logs) t
group by 1)
select e.employee_id from employees e
left join cte c
using(employee_id)
where c.total is null or c.total<e.needed_hours*60


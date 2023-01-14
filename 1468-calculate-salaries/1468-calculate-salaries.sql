# Write your MySQL query statement below
select company_id,employee_id,employee_name,
    case
    when max(salary) over(partition by company_id)<1000 then salary
    when max(salary) over(partition by company_id) between 1000 and 10000 then round(salary*.76,0)
    else round(salary*.51,0)
    end as salary
from salaries




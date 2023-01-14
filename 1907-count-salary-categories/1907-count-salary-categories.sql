# Write your MySQL query statement below
select m.category,ifnull(count(t.category),0) as accounts_count
from (select 'Low Salary' as category
union 
select 'Average Salary' as category
union 
select 'High Salary' as category) m
left join
(select account_id,income, 
        case
        when income<20000 then 'Low Salary'
        when income between 20000 and 50000 then 'Average Salary'
        else 'High Salary'
        end as category
from accounts) t
using (category)
group by category


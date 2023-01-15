# Write your MySQL query statement below
with trans as(select paid_by as user_id,-1*amount as amount from transactions
union all
select paid_to as user_id,amount from transactions)
select u.user_id,u.user_name,u.credit +ifnull(sum(t.amount),0) as credit, 
        case 
        when u.credit +sum(t.amount)<0 then 'Yes'
        else 'No'
        end as credit_limit_breached
from trans t
right join users u
using(user_id)
group by 1


# Write your MySQL query statement below
with cte as (select account_id,day,type,
        case 
        when type='Deposit' then amount*1 
        else amount*-1
        end as amount
from transactions)

select account_id,day,sum(amount) over(partition by account_id order by day) as balance from cte
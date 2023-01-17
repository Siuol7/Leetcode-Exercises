# Write your MySQL query statement below
select left(trans_date,7) as month,country,
            ifnull(count(*),0) as trans_count,
            ifnull(count(case when state='approved' then 1 end),0) as approved_count,
            ifnull(sum(amount),0) as trans_total_amount,
            ifnull(sum(case when state='approved' then amount end),0) as approved_total_amount
from transactions
group by 1,2
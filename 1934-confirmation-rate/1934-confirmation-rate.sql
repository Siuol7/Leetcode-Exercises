# Write your MySQL query statement below
select s.user_id, ifnull(round(count(case when c.action='confirmed' then 1 end)/count(c.action),2),0.00) as confirmation_rate
from signups s
left join confirmations c
using(user_id)
group by 1


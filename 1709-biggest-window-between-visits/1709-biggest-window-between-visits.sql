# Write your MySQL query statement below
with cte as (select *,lag(visit_date)over(partition by user_id order by visit_date) as today
from (select* from uservisits
    union 
(select user_id,a.visit_date from uservisits join(select '2021-1-1' as visit_date)a))b)
select user_id,max(timestampdiff(day,today,visit_date)) as biggest_window
from cte
group by 1

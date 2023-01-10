# Write your MySQL query statement below

select distinct user_id from (select user_id,purchase_date,timestampdiff(day,lag(purchase_date)over(partition by user_id order by purchase_date),purchase_date) as cnt
from purchases) t
where cnt<=7
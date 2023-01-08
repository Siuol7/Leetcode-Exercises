# Write your MySQL query statement below
select activity_date as login_date,count(distinct user_id) as user_count 
from (select user_id,activity_date,dense_rank() over(partition by user_id order by activity_date) as rnk from traffic 
where activity='login' ) t
where  activity_date in(select activity_date from traffic where timestampdiff(day,activity_date,'2019-06-30')<=90) and rnk=1
group by 1
order by 1

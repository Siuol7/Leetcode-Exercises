# Write your MySQL query statement below
with cte as(select  f1.user_id as user1_id,f2.user_id as user2_id,count(f1.follower_id) as cnt, dense_rank() over( order by count(f1.follower_id) desc) as rnk
from relations f1
left join relations f2
on f2.follower_id=f1.follower_id and f1.user_id< f2.user_id
where f1.user_id is not null and f2.user_id is not null
group by 1,2)
select user1_id,user2_id from cte where rnk=1
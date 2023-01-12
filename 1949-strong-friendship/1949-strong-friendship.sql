# Write your MySQL query statement below
with cte as (select user1_id,user2_id from friendship
union
select user2_id,user1_id from friendship)
select f1.user1_id,f2.user1_id as user2_id,count(f1.user2_id) as common_friend
from cte f1
inner join cte f2
on f1.user1_id<f2.user1_id and f1.user2_id=f2.user2_id
where (f1.user1_id,f2.user1_id) in (select* from friendship)
group by 1,2
having count(f1.user2_id)>=3
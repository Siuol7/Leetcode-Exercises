# Write your MySQL query statement below
with cte as(select count(*) as cnt from users)
select r.contest_id,round((count(r.user_id)/(select cnt from cte))*100,2) as percentage from register r
group by contest_id
order by percentage desc,contest_id asc
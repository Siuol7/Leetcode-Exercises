# Write your MySQL query statement below
with cte as(select user_id, count(distinct session_id) as cnt1 from activity
where '2019-06-28'<=activity_date and activity_date<='2019-07-27'
group by user_id
having count(activity_type)>=1)
select ifnull(round(sum(cnt1)/ count(distinct user_id),2),0.0000) as average_sessions_per_user from cte




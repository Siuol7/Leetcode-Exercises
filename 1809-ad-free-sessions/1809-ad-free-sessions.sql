# Write your MySQL query statement below
with cte as(select p.session_id from playback p
left join ads a
using(customer_id)
where a.timestamp between start_time and end_time)
select session_id from playback
where session_id not in (select session_id from cte)
# Write your MySQL query statement below
with cte as (select event_type, avg(occurences) as cnt from events group by 1)
select business_id from events e
left join cte c
using(event_type)
group by business_id
having count(case when e.occurences>c.cnt then 1 end )>1
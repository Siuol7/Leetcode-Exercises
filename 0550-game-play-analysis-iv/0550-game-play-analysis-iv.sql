# Write your MySQL query statement below
with cte as(select count(distinct a.player_id) as cnt from activity a
left join(select player_id,min(event_date) as d from activity
            group by player_id) t
on a.player_id=t.player_id
where datediff(a.event_date,t.d)=1)
select round((select cnt from cte)/(select count(distinct player_id) as cnt1 from activity),2) as fraction
# Write your MySQL query statement below

with cte as(select bus_id,arrival_time,lag(arrival_time,1,0)over(order by arrival_time ) as mintime
from buses)
select bus_id,ifnull(count(p.arrival_time),0) as passengers_cnt from cte c 
left join passengers p on c.arrival_time>= p.arrival_time and p.arrival_time >c.mintime
group by 1
order by 1

# Write your MySQL query statement below

with cte as (select passenger_id,count(passenger_id) as cnt 
from rides 
where passenger_id in (select distinct driver_id from rides)
group by passenger_id )

select distinct r.driver_id, ifnull(c.cnt,0) as cnt
from rides r
left join cte c
on r.driver_id=c.passenger_id
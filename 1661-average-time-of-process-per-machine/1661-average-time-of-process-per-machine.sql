# Write your MySQL query statement below
with cte as(select  machine_id,process_id, 
       case when activity_type ='start' then round(timestamp*-1,3)
       else round(timestamp,3)
       end as timestamp1
from activity)
select machine_id,round(sum(timestamp1)/count( distinct process_id),3) as processing_time from cte
group by machine_id

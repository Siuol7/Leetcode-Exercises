# Write your MySQL query statement below
with cte as(select *
from (select'IOS' as platform
     union
     select 'Android' as platform
     union
     select 'Web' as platform) a
join (select'Reading' as experiment_name
     union
     select 'Programming' as experiment_name
     union
     select 'Sports' as experiment_name) b)
select c.platform,c.experiment_name, ifnull(cnt,0) as num_experiments from 
(select platform,experiment_name,count(experiment_name) as cnt from experiments 
group by platform,experiment_name
order by platform) e
right join cte c
on c.experiment_name=e.experiment_name and c.platform=e.platform 



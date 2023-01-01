# Write your MySQL query statement below
select ad_id, ifnull(round((count(case when action='Clicked' then 1 end)/(count(case when action='Clicked' then 1                             end)+count(case when action='Viewed' then 1 end)))*100,2),0.00) as ctr
from ads
group by ad_id
order by ctr desc, ad_id asc
                     
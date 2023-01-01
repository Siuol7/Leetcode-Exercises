# Write your MySQL query statement below
select c.country_name, 
    case
    when avg(w.weather_state)<= 15 then 'Cold'
    when avg(w.weather_state) >=25 then 'Hot'
    else 'Warm'
    end as weather_type 
from countries c
inner join weather w
using(country_id)
where month(w.day)='11' and year(w.day)='2019'
group by country_id
# Write your MySQL query statement below
with cte as((select departure_airport as airport_id,sum(flights_count) as cnt from flights group by 1 ) 
union (select arrival_airport as airport_id,sum(flights_count) as cnt from flights group by 1 )) 
select airport_id
from (select airport_id,dense_rank()over(order by sum(cnt) desc) as rnk from cte group by 1) t
where rnk=1








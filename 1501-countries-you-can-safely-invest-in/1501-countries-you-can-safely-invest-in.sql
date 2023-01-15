# Write your MySQL query statement below
select c.name as country
from person p
join country c
on left(p.phone_number,3)=c.country_code
join calls ca
on p.id in (ca.caller_id,ca.callee_id) 
group by c.country_code
having avg(ca.duration)>(select avg(duration) from calls)
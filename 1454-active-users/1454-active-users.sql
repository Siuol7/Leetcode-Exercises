# Write your MySQL query statement below
with cte as (select id,login_date,lag(login_date,4) over(partition by id order by login_date) as chk 
from(
select distinct login_date,id
from logins) t)

select c.id,a.name
from cte c inner join accounts a using(id) 
group by c.id
having count(case when timestampdiff(day,c.chk,c.login_date)=4 then 1 end)>0
order by 1


# Write your MySQL query statement below
with cte as(select t.account_id,date_format(day,'%Y%m') as time,sum(amount) as total,a.max_income
from transactions t
left join accounts a
using(account_id)
where type='Creditor'
group by 1,2
having total>max_income
order by account_id )
select c1.account_id
from cte c1
left join cte c2
on c1.account_id=c2.account_id 
where c1.total>c1.max_income and  period_diff(c2.time,c1.time)=1
group by 1
order by 1


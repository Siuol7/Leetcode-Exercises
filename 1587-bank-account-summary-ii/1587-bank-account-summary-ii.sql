# Write your MySQL query statement below
select u.name, sum(t.amount) as balance 
from users u 
left join transactions t 
using(account)
group by t.account 
having balance >10000
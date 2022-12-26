# Write your MySQL query statement below
with a as(select stock_name, 
case when operation='Buy' then price*-1
else price*1
end as c
from stocks)

select stock_name,  sum(c) as capital_gain_loss from a group by stock_name order by capital_gain_loss desc
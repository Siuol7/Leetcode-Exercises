# Write your MySQL query statement below
select u.product_id, round(sum(u.units*p.price)/sum(units),2) as average_price
from unitssold u
left join prices p
on p.product_id=u.product_id 
  and (purchase_date between start_date and end_date)
group by 1
  
  

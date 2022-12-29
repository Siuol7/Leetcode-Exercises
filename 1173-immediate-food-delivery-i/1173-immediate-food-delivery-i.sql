# Write your MySQL query statement below
select ifnull(round(((select count(delivery_id) as cnt from delivery 
                    where order_date=customer_pref_delivery_date)
                    /
                    count(delivery_id))*100,2),0.00) as immediate_percentage 
from delivery

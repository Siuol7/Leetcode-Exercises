# Write your MySQL query statement below
select round(count(case when order_date=customer_pref_delivery_date then 1 end)/
            count(*)*100,2) as immediate_percentage 
from (select *,dense_rank() over(partition by customer_id order by order_date asc) as rnk from delivery) t
where rnk=1


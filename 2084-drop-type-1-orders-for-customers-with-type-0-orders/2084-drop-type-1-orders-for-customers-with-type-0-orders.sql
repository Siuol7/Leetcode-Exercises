# Write your MySQL query statement below
select order_id,customer_id,order_type from orders
where customer_id in (select customer_id from orders group by customer_id having count(case when order_type=0 then 1 end)>0 ) and order_type=0
union
select order_id,customer_id,order_type from orders
where customer_id not in (select customer_id from orders group by customer_id having count(case when order_type=0 then 1 end)>0 ) and order_type=1
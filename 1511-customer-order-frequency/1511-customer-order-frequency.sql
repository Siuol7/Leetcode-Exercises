# Write your MySQL query statement below
with cte as(select o.customer_id, c.name,sum(o.quantity*p.price) as total from orders o
left join product p
using (product_id)
left join customers c
using (customer_id) 
where month(o.order_date)='06' or month(o.order_date)='07'
group by 1,month(o.order_date)
having total>=100)

select customer_id, name from cte
group by 1
having count(customer_id)>1




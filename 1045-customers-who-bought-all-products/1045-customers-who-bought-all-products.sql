# Write your MySQL query statement below
select customer_id from customer
left join product 
using(product_key)
group by customer_id
having count(distinct product_key)=(select count(*) from product)
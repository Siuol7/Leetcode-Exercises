# Write your MySQL query statement below
with cte as(select s.user_id,(s.quantity*p.price) as total from sales s
left join product p
using(product_id))
select user_id, sum(total) as spending from cte
group by user_id
order by spending desc

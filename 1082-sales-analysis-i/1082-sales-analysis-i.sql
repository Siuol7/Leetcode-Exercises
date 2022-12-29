# Write your MySQL query statement below
with cte as(select seller_id,sum(price) as total from sales 
group by seller_id
order by total desc
limit 1)

select seller_id from sales
group by seller_id
having sum(price)=(select total from cte)
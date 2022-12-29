# Write your MySQL query statement below
with cte as(select seller_id,dense_rank() over(order by sum(price) desc) as rn
            from sales 
            group by seller_id)
select seller_id from cte
where rn=1

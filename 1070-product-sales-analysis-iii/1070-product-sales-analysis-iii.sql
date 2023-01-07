# Write your MySQL query statement below
with cte as(select product_id,min(year) as y from sales 
            group by product_id)
select s.product_id,s.year as first_year,s.quantity,s.price from sales s
left join cte c
using(product_id)
where s.year=c.y
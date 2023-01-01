# Write your MySQL query statement below
select p.product_name, sum(o.unit) as unit from orders o
left join products p
using(product_id)
where year(o.order_date)='2020' and month(order_date)='02'
group by product_id
having sum(o.unit)>=100
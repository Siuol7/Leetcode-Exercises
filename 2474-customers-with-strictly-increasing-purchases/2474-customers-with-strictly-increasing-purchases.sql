with cte as (select customer_id,year(order_date) as time ,
        lag(year(order_date))over(partition by customer_id order by order_date) as timediff, sum(price) price,
        ifnull(lag(sum(price))over(partition by customer_id order by order_date),0) as pre
from orders
group by 1,2)

select distinct customer_id from orders where customer_id not in (
select customer_id from cte
where time-timediff>1 or price-pre<=0)


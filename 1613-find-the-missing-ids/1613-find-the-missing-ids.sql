# Write your MySQL query statement below
with recursive cte as(
    select  1 as n 
    union all
    select n+1
    from cte
    where n< (select max(customer_id) from customers)
)
select n as ids from cte where n not in (select customer_id from customers)
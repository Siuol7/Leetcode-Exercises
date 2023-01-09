# Write your MySQL query statement below
 with cte as (select *, sum(if(drink is not null,1,0)) over(rows between unbounded preceding and current row) as rn from coffeeshop)
 #windows open between all rows before current row and current row

 select id, first_value(drink) over(partition by rn) as drink from cte
 #get the first value of the window
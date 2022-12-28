# Write your MySQL query statement below
with cte as(
select num from mynumbers 
group by num 
having count(num)<=1)
select ifnull(max(num),null) as num from cte

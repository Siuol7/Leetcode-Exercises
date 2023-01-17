# Write your MySQL query statement below
select s1.sale_date,s1.sold_num-s2.sold_num as diff
from sales s1
join sales s2
on s1.fruit='apples' and s2.fruit='oranges' and s1.sale_date=s2.sale_date
group by s1.sale_date
order by s1.sale_date
# Write your MySQL query statement below
select p1.id as p1,p2.id as p2,abs(p2.x_value-p1.x_value)*abs(p2.y_value-p1.y_value) as AREA
from points p1
join points p2 
on p2.id!=p1.id and p1.id<p2.id
where abs(p2.x_value-p1.x_value)*abs(p2.y_value-p1.y_value)>0
order by 3 desc,1,2
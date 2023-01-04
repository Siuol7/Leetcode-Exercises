# Write your MySQL query statement below
with cte as(select managerId,count(managerId) as cnt from employee
group by managerId
having count(managerId)>=5)
select name from employee e
inner join cte c
on e.id=c.managerId
# Write your MySQL query statement below
with cte as(select reports_to,count(reports_to) as cnt, round(avg(age)) as age from employees
where reports_to is not null
group by reports_to)
select e.employee_id,name,c.cnt as reports_count,c.age as average_age from employees e
inner join cte c
on e.employee_id=c.reports_to
order by 1

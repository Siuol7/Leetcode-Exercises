# Write your MySQL query statement below
with cte as(select team_id, count(team_id) as cnt from employee group by team_id)
select e.employee_id, c.cnt as team_size from employee e
left join cte c
using(team_id)

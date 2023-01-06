# Write your MySQL query statement below
select d.dept_name, ifnull(count(s.dept_id),0) as student_number from department d
left join student s
using (dept_id)
group by d.dept_id
order by 2 desc, 1 asc
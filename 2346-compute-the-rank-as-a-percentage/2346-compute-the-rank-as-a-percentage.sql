# Write your MySQL query statement below
select student_id, department_id, round(100*percent_rank() over(partition by department_id order by mark desc),2) as percentage
from students

                                          
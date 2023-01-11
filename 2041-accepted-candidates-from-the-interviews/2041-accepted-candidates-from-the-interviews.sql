# Write your MySQL query statement below
select c.candidate_id
from candidates c
inner join rounds r
using(interview_id)
where years_of_exp>=2
group by interview_id
having sum(score)>15
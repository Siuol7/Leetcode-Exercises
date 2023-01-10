# Write your MySQL query statement below
select user_id,gender
from genders
order by rank() over(partition by gender order by user_id),length(gender) desc
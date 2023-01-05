# Write your MySQL query statement below
select problem_id from problems
where (likes/(likes+dislikes))*100<60.00
order by problem_id asc
# Write your MySQL query statement below
with a as (select row_number()over(partition by experience order by salary ) as id, experience, salary from candidates),
 b as (select id,experience,sum(salary)over(partition by experience order by id) as total from a)
 select 'Senior' as experience,count(experience) as accepted_candidates from b
 where experience='Senior' and total<=70000
 union all
 select 'Junior' as experience,count(experience) as accepted_candidates from b
 where experience='Junior' and total<=(select if(max(total) is null,70000,70000-max(total)) from b where experience='Senior' and total<=70000)
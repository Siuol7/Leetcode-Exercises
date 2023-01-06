# Write your MySQL query statement below
select question_id as survey_log from surveylog
group by question_id
order by count(case when action='answer' then 1 end)/ count(case when action='show' then 1 end)  desc, 1 asc
limit 1
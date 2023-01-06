# Write your MySQL query statement below
with cte as(select candidateId,count(candidateId) as cnt from vote 
group by candidateId
order by 2 desc
limit 1)
select name from candidate ca
inner join cte c
on c.candidateId=ca.id



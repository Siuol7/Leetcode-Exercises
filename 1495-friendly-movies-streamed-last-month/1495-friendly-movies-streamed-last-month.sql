# Write your MySQL query statement below
select distinct c.title from content c
left join tvprogram t
using(content_id)
where year(t.program_date)='2020' and month(t.program_date)='06'and c.Kids_content='Y' and c.content_type='Movies'
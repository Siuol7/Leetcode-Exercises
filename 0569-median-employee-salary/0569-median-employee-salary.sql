# Write your MySQL query statement below
with a as (select id,row_number()over(partition by company order by salary ) as stt, company, salary from employee),
b as(
select company,count(company) as cnt,
        case 
        when count(company)%2=0 then 0
        else 1 
        end as chk , max(stt) as med
from a
group by company)

select a.id,a.company,a.salary
from a 
inner join b
on a.company=b.company and b.chk=0
where a.stt=b.med/2 or a.stt=b.med/2+1
union
select a.id,a.company,a.salary
from a 
inner join b
on a.company=b.company and b.chk=1
where a.stt=round(b.med/2) 
order by company,id

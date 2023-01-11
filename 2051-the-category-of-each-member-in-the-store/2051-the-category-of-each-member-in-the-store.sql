# Write your MySQL query statement below
with cte as(select * from (select member_id,count(member_id) as cnt2 from visits group by 1) a
left join (select member_id,count(member_id) as cnt1 from visits v right join purchases p using(visit_id) group by 1)b
using(member_id) )
select m.member_id,m.name,
        case
        when c.cnt1 is null and c.cnt2 is null then 'Bronze'
        when (ifnull(c.cnt1,0)*100/c.cnt2)<50 then 'Silver'
        when (ifnull(c.cnt1,0)*100/c.cnt2)>=80 then 'Diamond'
        else 'Gold'
        end as category
from members m
left join cte c
using(member_id)



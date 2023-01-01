# Write your MySQL query statement below
select b.bin, ifnull(count(s.bin),0) as total from (select case
        when 0<=duration/60 and duration/60<5 then '[0-5>'
        when 5<=duration/60  and duration/60<10 then '[5-10>'
        when 10<=duration/60  and duration/60<15 then '[10-15>'
        else '15 or more'
       end as bin
from sessions) as s
right join ( select '[0-5>' as bin
             union all 
             select '[5-10>' as bin
             union all 
             select '[10-15>' as bin
             union all
             select '15 or more' as bin) as b
using(bin)
group by bin


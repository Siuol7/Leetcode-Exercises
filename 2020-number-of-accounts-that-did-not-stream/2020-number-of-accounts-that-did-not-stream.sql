# Write your MySQL query statement below
select count(sb.account_id) as accounts_count 
from subscriptions sb
left join streams ss
using(account_id)
where (year(sb.start_date)=2021 or year(sb.end_date)=2021)
        and (year(ss.stream_date)!=2021 or ss.stream_date is null)
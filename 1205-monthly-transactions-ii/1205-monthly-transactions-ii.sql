# Write your MySQL query statement below
with cte as (select c.trans_id as id, t.country,'back' as state,t.amount,c.trans_date
from chargebacks c
inner join transactions t
on c.trans_id=t.id
union all
select * from transactions)
select  left(trans_date,7) as month,country,
        ifnull(count(case when state='approved' then 1 end),0) as approved_count,
        ifnull(sum(case when state='approved' then amount  end),0) as approved_amount,
        ifnull(count(case when state='back' then 1  end),0) as chargeback_count,
        ifnull(sum(case when state='back' then amount  end),0) as chargeback_amount
from cte
where state='approved' or state='back'
group by month,country






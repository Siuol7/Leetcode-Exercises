# Write your MySQL query statement below
select transaction_id from
(select *,dense_rank() over(partition by date_format(day,'%Y%m%d') order by amount desc) as rnk from transactions) t
where rnk=1
order by 1 asc

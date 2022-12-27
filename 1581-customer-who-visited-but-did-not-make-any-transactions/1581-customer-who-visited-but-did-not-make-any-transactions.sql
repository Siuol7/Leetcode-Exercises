# Write your MySQL query statement below
select v.customer_id, count(visit_id) as count_no_trans from visits v
where v.visit_id not in (select distinct visit_id from transactions) 
group by v.customer_id 
order by count_no_trans desc
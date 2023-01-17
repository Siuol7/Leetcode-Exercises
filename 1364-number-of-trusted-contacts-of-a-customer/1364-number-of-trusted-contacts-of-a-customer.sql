# Write your MySQL query statement below
with cte as (select c.customer_id,c.customer_name,ifnull(count(distinct co.contact_name),0) as contacts_cnt,
            ifnull(sum(case when co.contact_name in(select customer_name from customers) then 1 end ),0) as trusted_contacts_cnt
from customers c
left join contacts co
on c.customer_id=co.user_id
group by c.customer_id)
select i.invoice_id, t.customer_name,i.price,t.contacts_cnt,t.trusted_contacts_cnt
from cte t
right join invoices i
on i.user_id=t.customer_id
order by 1


# Write your MySQL query statement below
with sub as  (select c.salesperson_id,sum(s.price) as total from customer c
left  join sales s
using(customer_id)
group by c.salesperson_id
order by 1)
select sp.salesperson_id,sp.name,ifnull(sb.total,0) as total from salesperson sp
left join sub sb
using(salesperson_id)
order by 1
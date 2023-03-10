# Write your MySQL query statement below
select user_id as buyer_id, join_date, IFNULL(P.c,0) as orders_in_2019 
from Users as U
LEFT JOIN
(select buyer_id, count(*) as c 
 from Orders
 where year(order_date) = 2019
 Group by buyer_id) as P
on U.user_id = P.buyer_id;
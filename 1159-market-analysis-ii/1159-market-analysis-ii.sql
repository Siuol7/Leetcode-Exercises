# Write your MySQL query statement below


with cte as (select row_number()over(partition by seller_id)as stt,a.seller_id,a.item_id , i.item_brand
from(select seller_id,item_id,lag(item_id)over(partition by seller_id order by order_date asc) as pre
        from orders) a
left join items i
using(item_id)
where (pre is not null or item_id!=pre))

select u.user_id as seller_id,
        case
        when c.item_brand=u.favorite_brand then 'yes'
        else 'no'
        end as 2nd_item_fav_brand
from users u
left join cte c
on c.seller_id=u.user_id and c.stt=1

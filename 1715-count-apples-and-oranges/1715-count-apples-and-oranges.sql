# Write your MySQL query statement below

select sum(apple_count) as apple_count, sum(orange_count) as orange_count
from (select b.box_id,
        case
        when chest_id is not null then b.apple_count+c.apple_count 
        else b.apple_count
        end as apple_count,
        case
        when chest_id is not null then c.orange_count+b.orange_count
        else b.orange_count
        end as orange_count  
from boxes b
left join chests c
using(chest_id)) t


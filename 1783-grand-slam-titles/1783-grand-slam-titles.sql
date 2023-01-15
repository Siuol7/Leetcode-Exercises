# Write your MySQL query statement below
select t.player_id, p.player_name,count(t.player_id) as grand_slams_count
from (select wimbledon as player_id from championships
union all
select fr_open as player_id from championships
union all
select us_open as player_id from championships
union all
select au_open as player_id from championships) t
left join players p
on t.player_id=p.player_id
group by t.player_id

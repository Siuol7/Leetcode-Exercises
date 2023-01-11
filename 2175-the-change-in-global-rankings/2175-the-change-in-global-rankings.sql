# Write your MySQL query statement below
select t.team_id,t.name,cast(dense_rank() over(order by t.points desc,t.name asc) as signed)-
                        cast(dense_rank() over(order by (t.points+p.points_change) desc,t.name asc) as signed) as rank_diff
from teampoints t
inner join pointschange p
using(team_id)


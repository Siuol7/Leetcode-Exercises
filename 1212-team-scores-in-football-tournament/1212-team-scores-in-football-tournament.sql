# Write your MySQL query statement below
with cte as( select host_team,host_goals,guest_goals,
                    case 
                    when host_goals>guest_goals then 3
                    when host_goals=guest_goals then 1
                    else 0
                    end as points from matches
union all
select guest_team,guest_goals,host_goals,
                case 
                    when host_goals<guest_goals then 3
                    when host_goals=guest_goals then 1
                    else 0
                    end as points from matches)
select t.team_id,t.team_name, ifnull(sum(c.points),0) as num_points
from cte c
right join teams t
on t.team_id =c.host_team
group by 1
order by 3 desc, 1
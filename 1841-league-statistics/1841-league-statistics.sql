# Write your MySQL query statement below


select t.team_name,count(c.home_team_id) as matches_played,sum(
        case 
        when c.home_team_goals>c.away_team_goals then 3
        when c.home_team_goals=c.away_team_goals then 1
        else 0
        end ) as points, sum(c.home_team_goals) as goal_for,sum(c.away_team_goals) as goal_against, sum(c.home_team_goals)-sum(c.away_team_goals) as goal_diff
from (select * from matches
union all
select away_team_id,home_team_id,away_team_goals,home_team_goals from matches) c
inner join teams t
on t.team_id=c.home_team_id
group by c.home_team_id
order by 3 desc, 6 desc, 1 asc


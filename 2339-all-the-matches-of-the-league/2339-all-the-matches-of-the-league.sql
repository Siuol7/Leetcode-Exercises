# Write your MySQL query statement below
select a.team_name as home_team,b.team_name as away_team from teams a
join teams b
on a.team_name!=b.team_name
order by home_team desc
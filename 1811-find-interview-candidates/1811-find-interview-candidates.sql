# Write your MySQL query statement below
with cte as(select *,lag(contest_id,2)over(partition by user_id order by contest_id asc) as stt from (select contest_id, gold_medal as user_id from contests
union
select contest_id,silver_medal as user_id from contests
union
select contest_id, bronze_medal as user_id from contests) t),
sub as(
select user_id from cte group by 1 having sum(contest_id-stt=2)>=1
union 
select gold_medal as user_id from contests group by gold_medal having count(gold_medal)>=3)
select z.name,z.mail from users z right join sub using(user_id) order by user_id


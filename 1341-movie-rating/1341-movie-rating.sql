# Write your MySQL query statement below
select name as results from (select m.user_id,u.name,count(m.rating) as cnt from movierating m 
inner join users u
using(user_id)
group by 1 order by 3 desc, 2 asc limit 1)t
union
select title from (select m.movie_id,mo.title,avg(m.rating) as cnt from movierating m 
inner join movies mo
using(movie_id)
where date_format(created_at,'%Y%m')=202002
group by 1 order by 3 desc, 2 asc limit 1)t





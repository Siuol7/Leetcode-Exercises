# Write your MySQL query statement below


with cte as(
select query_name,count(query_name) as cnt from queries
where rating<3
group by query_name)


select query_name,ifnull(round(sum(rating/position)/count(result),2),0.00) as quality,
        ifnull(round((cnt/count(result))*100,2),0.00) as poor_query_percentage from queries 
left join cte
using(query_name)
group by query_name


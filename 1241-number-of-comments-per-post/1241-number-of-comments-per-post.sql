# Write your MySQL query statement below
with cte as(
select distinct sub_id as post_id from submissions where parent_id is null)
select c.post_id , count( distinct s.sub_id) as number_of_comments from cte c
left join  submissions s
on c.post_id=s.parent_id
group by c.post_id
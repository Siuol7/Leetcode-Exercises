# Write your MySQL query statement below
with cte as (select user1_id,user2_id from friendship
where user1_id=1 or user2_id=1 )
select distinct page_id as recommended_page from likes
where user_id!=1 
        and ( user_id in (select user1_id from cte) or user_id in (select user2_id from cte))
        and page_id not in (select page_id from likes where user_id=1)
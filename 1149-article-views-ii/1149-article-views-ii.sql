# Write your MySQL query statement below
select distinct viewer_id as id from (select * from views v1
                                union 
                                select * from views v2) t
group by view_date,viewer_id
having count(viewer_id)>1
order by id asc
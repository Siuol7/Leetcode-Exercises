# Write your MySQL query statement below
select followee as follower,count(followee) as num from follow
where followee in (select follower from follow group by follower having count(follower)>0)
group by followee
having num>0 
order by 1 asc
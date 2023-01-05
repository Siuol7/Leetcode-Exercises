# Write your MySQL query statement below
select distinct a.user_id from confirmations a
left join confirmations c
on a.user_id=c.user_id and a.time_stamp<c.time_stamp
where  timestampdiff(second,a.time_stamp,c.time_stamp)<=86400
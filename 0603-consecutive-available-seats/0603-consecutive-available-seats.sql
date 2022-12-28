# Write your MySQL query statement below
select distinct s1.seat_id from cinema s1
join cinema s2 
on s1.seat_id=s2.seat_id-1
        or s1.seat_id=s2.seat_id+1
where  s1.free >0 and s2.free>0
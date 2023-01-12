# Write your MySQL query statement below
  select s.school_id,ifnull(min(e.score),-1) as score from schools s
  left join exam e
  on e.student_count <=s.capacity
  group by 1
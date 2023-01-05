# Write your MySQL query statement below
select case
        when (select count(student_id) as cny from NewYork where score>=90) >
                (select count(student_id) as cc from California where score>=90) then 'New York University'
        when (select count(student_id) as cny from NewYork where score>=90) <
                (select count(student_id) as cc from California where score>=90) then 'California University'
        else 'No Winner'
        end as winner




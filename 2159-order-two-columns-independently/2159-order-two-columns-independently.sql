# Write your MySQL query statement below
select first_col, second_col from(
select first_col, row_number()over(order by first_col asc) as rnk from data) a 
join(
select second_col, row_number()over(order by second_col desc) as rnk from data) b
where a.rnk=b.rnk

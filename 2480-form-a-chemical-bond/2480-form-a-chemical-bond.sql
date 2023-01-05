# Write your MySQL query statement below
with cte as(select a.symbol from elements a where type='Metal')
select c.symbol as metal, t.symbol as nonmetal from (select symbol from elements where type='Nonmetal') t
join cte c
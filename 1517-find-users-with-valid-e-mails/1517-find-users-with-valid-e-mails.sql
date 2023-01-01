# Write your MySQL query statement below
select user_id,name,mail from users u
where mail regexp '^[a-zA-Z][a-zA-Z0-9_.-]*@leetcode[.]com$'
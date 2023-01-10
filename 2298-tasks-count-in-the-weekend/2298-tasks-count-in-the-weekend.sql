# Write your MySQL query statement below

select   count(case when date_format(submit_date,'%a')='Sat' or date_format(submit_date,'%a')='Sun' then 1 end) as weekend_cnt,
    count(case when date_format(submit_date,'%a')!='Sat' and date_format(submit_date,'%a')!='Sun' then 1 end) as working_cnt
    from tasks
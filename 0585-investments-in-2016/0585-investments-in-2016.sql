# Write your MySQL query statement below
select round(sum(tiv_2016),2) as tiv_2016 from insurance 
where tiv_2015 in (select tiv_2015 as cnt1 from insurance 
                    group by tiv_2015
                    having count(tiv_2015)>1)
                and concat(lat,lon) in (select concat(lat,lon) from insurance 
                        group by lat,lon
                        having count(1)<2)


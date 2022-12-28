# Write your MySQL query statement below
select round(ifnull(
    (select count(*) from (select distinct requester_id,accepter_id from requestaccepted) as A)/
    (select count(*) from (select distinct sender_id,send_to_id from friendrequest)as B),0),2) as accept_rate
    
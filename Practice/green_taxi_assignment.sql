create table greentaxi
(
  vendorid number 
, lpep_pickup_datetime date
, lpep_dropoff_datetime date 
, store_and_fwd_flag char(1byte) 
, ratecodeid number(*, 0) 
, pulocationid number (*, 0) 
, dolocationid number(*, 0) 
, passenger_count number(*, 0) 
, trip_distance float(126) 
, fare_amount float(126) 
, extra float (126) 
, mta_tax float (126) 
, tip_amount float (126)
, tolls_amount float (126) 
, ehail_fee float (126) 
, improvement_surcharge float (126) 
, total_amount float (126) 
, payment_type number(*, 0) 
, trip_type number(*, 0)
, congestion_surcharge float (126) 
);

create table location(
 locid number ,
 borough  varchar2(20) ,
 zone varchar2(20) ,
 service_zone varchar2(20));

create table payment(id number,modeof_payment VARCHAR2(40));

insert into payment values(1,'Credit card');
insert into payment values(2,'Cash');
insert into payment values(3,'No charge');
insert into payment values(4,'Dispute');
insert into payment values(5,'Unknown');
insert into payment values(6,'Voided trip');

A.Find the month wise trip count, average distance and average passenger count from the trips completed by green taxis in 2019. 

select to_char(lpep_dropoff_datetime,'MM'),
count (*) as  trip_count,
avg(trip_distance) as average_distance, 
avg(passenger_count) as avgerage_passenger_count 
from green_taxi
group by to_char(lpep_dropoff_datetime,'MM')
order by to_char(lpep_dropoff_datetime,'MM');


B.Find out the five busiest routes served by the green taxis during 2019. The name of start and drop points to be provided.

select * from 
(
select a.zone as pickup_loc ,b.zone as dropoff_loc, 
count(*) as no_of_trips from greentaxi g
join loc a on a.locationid = g.pulocationid
join loc b on b.locationid = g.dolocationid
group by a.zone,b.zone
order by no_of_trips desc
)
where rownum<=5;


C.What are the top 3 busiest hours of the day for the taxis?

select * from (select to_char(lpep_pickup_datetime,'HH24') current_Hours,count(*) count_of_hours
from greentaxi
group by to_char(lpep_pickup_datetime,'HH24') 
order by count_of_hours desc
where ROWNUM<=3;

D.What is the most preferred way of payment used by the passengers? 
select * from
(
select p.modeof_payment as payment_type,count(*) as cnt
from greentaxi g
join payment p
on g.payment_type = p.id
group by p.modeof_payment
order by cnt desc
)
where rownum = 1;

E.Write a PL/SQL block to read through each record and update ehail_fee to 0.5 (capture the time taken for execution)

set timing on;
begin
update greentaxi set ehail_fee= 0.5 ; 
end;
/

F.Write a normal update statement to update ehail_fee to 0.75
set timing on;
update green_taxi set ehail_fee = 0.75;



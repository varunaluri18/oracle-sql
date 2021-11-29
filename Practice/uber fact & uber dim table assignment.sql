create table fact
(
trip_uuid varchar(10) ,
datestr date,
product_type_name varchar(5),
city_id number(5),
driver_uuid varchar2(30),
is_completed varchar(5),
eta number(5),
ata number(5),
upf_fare float(10),
fare_final float(10) 
);


create table dim
(
city_id number(4),
city_name varchar2(5),
country varchar2(5)
);



A.How many city_ids does uberPOOL operate in?

select count(distinct(city_id)) as no_of_cities
from fact 
where product_type_name='uberPOOL';


B.Which city_id has the highest error in ETA (where error in ETA = {(eta - ata)/ata}) for the given time period?

select city_id from
(
select * from
(
select city_id ,(eta-ata)/ata as ETA 
from fact 
order by ETA desc
)) where rownum=1;


C.Which is the product type with highest total revenue in San Francisco?

select * from 
(
select product_type_name as product_type 
from fact join dim 
on dim.city_id = fact.city_id 
where city_name='SanFrancisco' 
order by fare_final desc
) where rownum=1;

D.Which are the products in each city where total revenue(fare_final) > $100?

select city_name,product_type_name 
from fact join dim 
on fact.city_id = dim.city_id 
group by product_type_name,city_name 
having sum(fare_final)>100;

E.Get to 2nd highest country by Uber Revenue (fare_final) for 2nd week of June 2018 across product?

select country from 
(
select country,rownum as ronum from 
(
select country,sum(fare_final) as sm 
from fact join dim on fact.city_id = dim.city_id
where to_char(to_date(datestr,'dd-mm-yyyy'),'w')=2
and to_char(to_date(datestr,'dd-mm-yyyy'),'mm')=06
and to_char(to_date(datestr,'dd-mm-yyyy'),'yyyy' )=2018
group by dim.country
order by sm desc
)) where ronum=2;


F.Get WOW growth % for US region for June Month. WOW- Week over week.
G.Growth % = ((Current week fare final - previous week fare final) / previous week fare final) * 100


select week,sm,lag,((sm-lag) / lag)*100 as WoW_Growth from
(
select sum(fare_final) as sm,
lag(sum(fare_final)) over(order by to_char(to_date(datestr,'dd-mm-yyyy'),'w') ) as lag ,
to_char(to_date(datestr,'dd-mm-yyyy'),'w') as week 
from fact 
group by to_char(to_date(datestr,'dd-mm-yyyy'),'w')
order by week asc
);

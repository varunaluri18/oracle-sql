LOAD
INFILE 'C:\Users\VarunNagendra\Desktop\training\Oracle SQL\assignment2\fact.csv'

INTO TABLE fact
FIELDS TERMINATED BY "," OPTIONALLY ENCLOSED BY '"'

(
trip_uuid ,
datestr DATE 'DD-MM-YYYY',
product_type_name ,
city_id ,
driver_uuid ,
is_completed ,
eta "to_number(replace(:eta, ',',''))",
ata "to_number(replace(:ata, ',',''))",
ufp_fare,
fare_final 
)
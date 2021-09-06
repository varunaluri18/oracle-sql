LOAD
INFILE 'C:\Users\VarunNagendra\Desktop\training\Oracle SQL\assignment2\dim.csv'
INTO TABLE dim
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
TRAILING NULLCOLS
(
city_id,
city_name,
country
)
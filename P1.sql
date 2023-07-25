create schema cars;
use cars;

-- READ DATA --
SELECT * FROM carlist;

-- CARS AVAILABLE IN 2023 --
SELECT count(*) FROM carlist where year = 2023; #6

-- CARS AVAILABLE IN THE YEAR 2020,2021,2022 --
SELECT count(*) FROM carlist where year in (2020,2021,2022); #84
SELECT year,count(*) FROM carlist where year in (2020,2021,2022) group by year;

-- NO. OF DIESEL CARS IN 2020 --
SELECT year,fuel,count(*) from carlist where year=2020 and fuel = 'diesel';

-- PRINT ALL THE FUEL (petrol,diesel,CNG) CARS come by all the year --
SELECT year, count(*) from carlist where fuel ='petrol'group by year;
SELECT year, count(*) from carlist where fuel ='diesel'group by year;
SELECT year, count(*) from carlist where fuel ='cng'group by year;

-- WHICH YEAR HAD MORE THAN 100 CARS? --
select year, num_cars from (select year, count(*) as num_cars from carlist group by year) x where x.num_cars > 100;
			-- OR --
SELECT year, count(*) from carlist group by year having ( count(*) > 100 );

-- ALL cars count details between the 2015 and 2023 --
SELECT year, count(*) from carlist where year between 2015 and 2023 group by year;
select * from carlist where year between 2015 and 2023 ;

select * from carlist order by fuel ; 

-- HIGHEST CC ENGINE CAR IN 2023 --

SELECT name, engine, fuel, transmission from carlist where year = 2023 order by engine;

-- USAGE OF WINDOW FUNCTION  

select c.year, c.name,c.selling_price,
case when c.selling_price < lead(selling_price) over ( partition by year ) then 'LESSER than Next' else 'HIGHER'
end Comparison 
from (select name, selling_price,year from carlist where year in (2023,2022) order by year) c ;

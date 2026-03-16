Create database project;
use project;
create view `Flights Per Airline` as
select source as Airports,count(source) as `Total flights` from flights
group by source
order by `total flights` desc;


select airline,round(avg(price),2) as `Average Price` from flights
where source='patna' and destination='Indore'
group by airline
order by `Average Price` desc;

use project;
Create view `Flight Per Airline` as 
select distinct(airline),count(airline) as `Total Flights` from flights
Group by Airline
order by `Total Flights` Desc;

Create view `Avg per Stop` as 
select total_stops,round(avg(price),0) as `Average Price` from flights
group by total_stops
order by `Average Price` desc;
 

create view `Flight Category` as 
select airline,source,destination,round(avg(Price),0) as `Average Price`,
case 
when avg(Price)>12000 then 'Premium Flight'
when avg(price)>8000 then 'Standard Flight'
Else 'Regular Flight'
End as `price category`
from flights
group by airline,source,destination
order by `Average Price`Desc;


Create View `Price Category` as 
select airline,round(avg(Price),0) as `Average Price`,
case 
when avg(Price)>12000 then 'Premium Airline'
when avg(price)>8000 then 'Standard Airline'
Else 'Standard Airline'
End as `price category`
from flights
group by airline;



Create view `Route Category` as 
select source ,destination,count(destination) as `Total Flights` ,
case 
when count(destination)>50 then 'Popular Route'
when count(destination)>35 then 'Moderate Popular Route'
Else 'Less Popular Route'
end as `Route category`

from flights 
group by source,destination
order by `total flights` desc;

Create View `Flight Type` as 
select  airline,source,destination,
case 
when total_stops='non-stop' then 'Direct Flight'
else 'Connecting'
end as `Flight Type`
from flights ; 

create view Flights as 
select count(*) as `Total Flight`from flights;

create view `Total Airline` as 
select count(distinct Airline) from Flights;


create view Airlines as 
select distinct airline from flights;
Use Project;
Create view `Flight Time Category` as 
Select `index`,Source,destination,dep_time,
case
 when hour(dep_time) between 4 and 7 then 'Early Morning'
when hour(dep_time) between 7 and 11 then 'Morning'
when hour(dep_time) between 12 and 16 then 'Afternoon'
when hour(dep_time) between 17 and 19 then 'Evening'
else 'Night'
End as `Flight Time Category`
from flights;

Create View Airline as 
Select airline,
case
 when hour(dep_time) between 4 and 7 then 'Early Morning'
when hour(dep_time) between 7 and 11 then 'Morning'
when hour(dep_time) between 12 and 16 then 'Afternoon'
when hour(dep_time) between 17 and 19 then 'Evening'
else 'Night'
End as `Flight Time Category`,round(avg(price),0) as `Average Price` from flights
group by `Flight Time Category`,airline;

Create View `Flight   Type` as 
select  
case 
when total_stops='non-stop' then 'Direct Flight'
else 'Connecting'
end as `Flight Type`,round(avg(price),0) as `Average Price`
from flights 
group by `Flight Type`; 


Create view `Route -   Category` as
select concat(source,' - ',destination) as Route ,round(avg(Price),0) as `Average Price`,
case 
when avg(Price)>9500 then 'Premium Route'
when avg(price)>8500 then 'Standard Route'
Else 'Regular Route'
End as `Route category`
from flights
group by source,destination
order by `Average Price`Desc;

select min(price) from flights;

use project;
create view `Avg Price per Airline` as 
select airline,round(avg(price),0) as `Average Price` from flights
group by airline
order by `Average Price` desc;

Create view `Route by flights` as
select concat(source,' - ',destination) as Route ,count(*) as `Total Flights` from flights
group by source,destination
order by `Total Flights` desc
limit 10;


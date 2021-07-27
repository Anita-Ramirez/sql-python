-- 1 
select 

name, language, percentage

from countries AS c
inner join languages AS l on c.code = l.country_code

where  language = 'Esloveno'

-- 2 

select countries.name, COUNT(cities.name) as cities
from countries
inner join cities on cities.country_code = countries.code
group by countries.name
order by cities desc
-- 3
select name, population, country_id from cities where (country_id = '136') and (population > 500000) order by population desc 

-- 4
select name, language, percentage
from countries as c
inner join languages as l on l.country_code = c.code 
where percentage > 89
order by percentage desc 

-- 5

select *
from countries
where (surface_area < 501) and (population > 100000) 

-- 6 
select name, government_form, capital, life_expectancy
from countries
where government_form = 'Constitutional Monarchy' and capital > 200 and life_expectancy  > 75
-- 7
select countries.name, cities.name, district, cities.population 
from countries
inner join cities on cities.country_code = countries.code
where district = 'Buenos Aires' and cities.population  > 500000

-- 8
select region, COUNT(name) as countries
from countries
GROUP BY region
order by countries desc


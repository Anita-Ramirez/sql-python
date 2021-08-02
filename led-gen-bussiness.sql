use lead_gen_business

SELECT Date,TotalAllowance FROM Calculation WHERE EmployeeId=1 AND Date >= '2011/02/25' AND Date < '2011/02/28'      

-- 1
select SUM(amount) as ingreso_total
from billing
where charged_datetime >= '2012/03/01' AND charged_datetime <= '2012/03/31' 

-- 2
select SUM(amount) as ingreso_total
from billing
where client_id = 2;

-- 3
select *
from sites
where client_id = 10;

-- 4
​
select  a.client_id, COUNT(a.domain_name) as number_websites, monthname(a.created_datetime) as mounth_created, year(a.created_datetime) as year_created
from sites a 
where a.client_id='1'
GROUP BY monthname(a.created_datetime), year(a.created_datetime);


-- 5

SELECT sites.client_id, COUNT(sites.domain_name) as number_of_websites, MONTHNAME(sites.created_datetime) as month_created, YEAR(sites.created_datetime) as year_created
FROM sites 
WHERE sites.client_id ='20'
GROUP BY MONTHNAME(sites.created_datetime), YEAR(sites.created_datetime);
-- ORDER BY sites.site_id; (no me funiciona)


-- 6 ¿Qué consulta ejecutaría para obtener una lista de nombres de clientes y el número total de clientes potenciales que hemos generado para cada uno de nuestros clientes entre el 1 de enero de 2011 y el 31 de diciembre de 2011?
-- SELECT .client_id,CONCAT(clients.first_name," ", clients.last_name) as client_name***** Revisar mas tarde

Select CONCAT(clients.first_name," ", clients.last_name) As client_name,
COUNT(leads.leads_id) as number_of_leads
FROM clients
LEFT JOIN sites ON clients.client_id=sites.client_id 
LEFT JOIN leads ON sites.site_id = leads.site_id 
WHERE leads.registered_datetime BETWEEN '2011/01/01' AND '2011/12/31';

-- la correcta es la de abajo

select CONCAT(a.first_name," ",a.last_name) as client_name, COUNT(c.leads_id) as number_of_leads
from clients a JOIN sites b on a.client_id=b.client_id JOIN leads c on b.site_id=c.site_id
where c.registered_datetime between '2011/01/01' and '2011/12/31'
GROUP by client_name;

-- 7

SELECT CONCAT(clients.first_name," ",clients.last_name) as client_name,
COUNT(leads.id) as number_of_leads, 
MONTHNAME(leads.registered_datetime) as month_generated
FROM clients
LEFT JOIN sites ON clients.id=sites.clients_id 
LEFT JOIN leads ON sites.id=leads.sites_id 
WHERE leads.registered_datetime BETWEEN '2011/01/01' and '2011/06/30'

-- la correcta es la de abajo, puros inventos míos aca
select CONCAT(a.first_name," ",a.last_name) as client_name, COUNT(c.leads_id) as number_of_leads, monthname(c.registered_datetime)
from clients a JOIN sites b on a.client_id=b.client_id JOIN leads c on b.site_id=c.site_id
where c.registered_datetime between '2011/01/01' and '2011/06/30'
GROUP by client_name, c.leads_id
ORDER BY c.registered_datetime;
GROUP BY leads.id;

/*8 */
select CONCAT(a.first_name," ",a.last_name) as client_name, b.domain_name, count(b.site_id) number_of_leads
from clients a LEFT JOIN sites b on a.client_id=b.client_id LEFT JOIN leads c on b.site_id=c.site_id
group by client_name, b.domain_name
order by client_name;



/*9*/
select CONCAT(a.first_name," ",a.last_name) as client_name, sum(b.amount) as total_revenue, monthname(b.charged_datetime) as month_charge, year(b.charged_datetime) as year_charge
from clients a JOIN billing b on a.client_id = b.client_id
group by client_name, month_charge, year_charge
order by a.client_id;


/*10*/
select CONCAT(a.first_name," ",a.last_name) as client_name, group_concat( distinct b.domain_name order by b.domain_name separator ' / ' ) as websites
from clients a LEFT JOIN sites b on a.client_id = b.client_id
group by client_name



select * from sites
select * from leads
select * from clients
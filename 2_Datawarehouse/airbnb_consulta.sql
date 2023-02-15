--Total apartamentos
select count(*)
from airbnb_database.property a ;
 
-- Apartamentos con precio > 500
select a.id_property, a.price 
from airbnb_database.property a
where price  > 500
order by price asc;

-- Número de apartamentos con precio > 500
select count(*)
from airbnb_database.property a 
where price  > 500;

-- Número de hosts
select count (distinct id_host) 
from airbnb_database.host b;

-- Máximo de anuncios de un host
select max(b.host_total_listings_count)
from airbnb_database.host b;

-- Media de anuncios por host
select avg(b.host_total_listings_count)
from airbnb_database.host b;

-- agrupacion de apartamentos por número de camas
select beds, count(id_property)
from airbnb_database.property a
group by a.beds
order by a.beds desc; 

-- Puntuación de reseñas del apartamento y tasa de respuesta del host
select a.review_scores_rating  , b.host_response_rate
from airbnb_database.property a, airbnb_database.host b where a.id_property = b.id_property 
order by review_scores_rating asc;

-- Tipo de política de cancelación según antigüedad
select a.cancellation_policy , b.host_since
from airbnb_database.host b right join  airbnb_database.property a on a.id_property = b.id_property;


-- Precio del apartamento y cúantos apartamentos tiene el host
select a.price, b.host_total_listings_count
from airbnb_database.host b right join  airbnb_database.property a on a.id_property = b.id_property 
order by host_total_listings_count desc;

-- ¿Son los 51 apartamentos cuyo host tiene 51 anuncios del mismo host? -> Sí

select count(host_total_listings_count), b.id_host 
from airbnb_database.host b
where host_total_listings_count = 51
group by b.id_host;

-- ¿Son los 92 (46 x 2) apartamentos cuyo host tiene 46 anuncios solo de 2 hosts? -> No

select count(host_total_listings_count), b.id_host 
from airbnb_database.host b
where host_total_listings_count = 46
group by b.id_host



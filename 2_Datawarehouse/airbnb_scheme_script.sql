
--CREACIÓN DEL ESQUEMA

create schema airbnb_database authorization postgres;



--CREACIÓN DE TABLAS 

create table airbnb_database.host(
	id_host int4 not null, --PK
	id_property int4 not null, --PK, FK
	host_since varchar(100)  null,
	host_location varchar(100) null,
	host_response_rate float4 null,
	host_total_listings_count int4 null
);



create table airbnb_database.property(
	id_property int4 not null, --PK
	name varchar(100)  null,
	description varchar(1024) null,
	neighbourhood varchar(100) null,
	city varchar(100) null,
	zipcode int4 null,
	country varchar(100) null,
	latitude float4 null,
	longitude float4 null,
	property_type varchar(100) null,
	room_type varchar(100) null,
	accommodates int4 null,
	bathrooms int4 null,
	bedrooms int4 null,
	beds int4 null,
	price float4 null,
	weekly_price float4 null,
	monthly_price float4 null,
	security_deposit float4 null,
	cleaning_fee float4 null,
	guests_included int4 null,
	extra_people int4 null,
	minimum_nights int4 null,
	maximum_nights int4 null,
	number_of_reviews int4 null,
	review_scores_rating float4 null,
	cancellation_policy varchar(100) null
);



--PRIMARY KEYS & FOREIGN KEYS

alter table airbnb_database.property 
add constraint property_pk primary key (id_property);


alter table airbnb_database.host 
add constraint host_pk primary key (id_host, id_property);

alter table airbnb_database.host 
add constraint property_fk foreign key (id_property)
references airbnb_database.property (id_property);



--CARGA DE DATOS

INSERT INTO airbnb_database.property(id_property, name, description, neighbourhood, city, zipcode, country, latitude, longitude, property_type, room_type, accommodates, bathrooms, bedrooms, beds, price, weekly_price, monthly_price, security_deposit, cleaning_fee, guests_included, extra_people, minimum_nights, maximum_nights, number_of_reviews, review_scores_rating, cancellation_policy)
SELECT id, name, description, neighbourhood_cleansed, city, zipcode, country, latitude, longitude, property_type, room_type, accommodates, bathrooms, bedrooms, beds, price, weekly_price, monthly_price, security_deposit, cleaning_fee, guests_included, extra_people, minimum_nights, maximum_nights, number_of_reviews, review_scores_rating, cancellation_policy FROM public.final_airbnb_cleansed;


INSERT INTO airbnb_database.host(id_host, id_property, host_since, host_location, host_response_rate, host_total_listings_count)
SELECT host_id, id, host_since, host_location, host_response_rate, host_total_listings_count FROM public.final_airbnb_cleansed;















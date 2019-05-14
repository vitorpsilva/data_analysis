-- 1. List the name , model and battery_capacity of all scooters in city ’Copenhagen’
-- that have a rental reservation between noon of 08/07/2019 and midnight of 15/07/2019
-- (both inclusive) for a customer with an Android phone.

select 
	s.name_scooter, s.model, s.battery_capacity
from 
	scooters s
join 
	rental_reservations r on r.scooter_id = s.id
join 
	customers c on c.id = r.customer_id
where 
	s.city ilike('Copenhagen')
	-- ilike USED TO PREVENT DIFFERENCES BETWEEN UPPER OU LOWER CASE
and 
	r.start_datetime >= '2019-07-08 12:00:00'
and 
	r.end_datetime <= '2019-07-15 00:00:00'
and 
	LENGTH(c.platform_token) = 12
	-- GET ONLY ANDROID



-- 2. List all the pairs of customer and scooter IDs that have never occurred together in any
-- rental reservations. In other words, we want the pairs of customers and scooter such that
-- the customer has never rented the scooter. Also, customers who have never rented any
-- scooters, should still be accounted for.

-- 2.1

 select 
 	c.id as customer_id, 
 	s.id as scooter_id 
 from 
 	scooters s, 
 	customers c
 where
 	not exists (
 		select 
			1
		-- NUMBER 1 IS USED AS CONSTANT TO BYPASS DISK IO
		from 
			rental_reservations r
 		where 
			r.customer_id = c.id
 		and 
			r.scooter_id = s.id
 	)


-- 2.2
	
  select *
-- 	c.id as customer_id, 
-- 	s.id as scooter_id 
 from 
-- 	scooters s, 
 	customers c
 where
 	not exists (
 		select 1 from rental_reservations r
 		where r.customer_id = c.id
-- 		and r.scooter_id = s.id
 	)
 	


-- 3. List the median rental period for Android and iPhone users respectively.

-- ANDROID

SELECT AVG(vw.minutos) AS average
  FROM (
  	SELECT (
		DATE_PART('day', r.end_datetime - r.start_datetime) * 24 + 
		DATE_PART('hour', r.end_datetime - r.start_datetime) * 60 +
		DATE_PART('minute', r.end_datetime - r.start_datetime) 
		)::bigint as minutos
	
	-- CONVERT THE PERIOD IN MINUTES
	
	FROM 
		rental_reservations r
	JOIN 
		customers c ON c.id = r.customer_id
	AND 
		LENGTH(c.platform_token) = 12
	
	  -- FILTER ONLY ANDROID  
    ) vw

-- IPHONE

SELECT AVG(vw.minutos) AS average
  FROM (
  	select (
		DATE_PART('day', r.end_datetime - r.start_datetime) * 24 + 
		DATE_PART('hour', r.end_datetime - r.start_datetime) * 60 +
		DATE_PART('minute', r.end_datetime - r.start_datetime) 
		)::bigint as minutos
	FROM 
		rental_reservations r
	JOIN 
		customers c ON c.id = r.customer_id
	AND 
		LENGTH(c.platform_token) = 30
    ) vw

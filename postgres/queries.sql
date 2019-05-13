-- 1. List the name , model and battery_capacity of all scooters in city ’Copenhagen’
-- that have a rental reservation between noon of 08/07/2019 and midnight of 15/07/2019
-- (both inclusive) for a customer with an Android phone.

SELECT s.name_scooter, s.model, s.battery_capacity
FROM scooters s
left outer join rental_reservations r on r.scooter_id = s.id
join customers c on c.id = r.customer_id
where s.city = upper('Copenhagen')
and r.start_datetime >= '2019-07-08 12:00:00' 
and r.end_datetime <= '2019-07-15 00:00:00'
and LENGTH(c.platform_token) = 12



-- 2. List all the pairs of customer and scooter IDs that have never occurred together in any
-- rental reservations. In other words, we want the pairs of customers and scooter such that
-- the customer has never rented the scooter. Also, customers who have never rented any
-- scooters, should still be accounted for.




-- 3. List the median rental period for Android and iPhone users respectively.

-- ANDROID

SELECT AVG(result.minutos :: bigint) AS average, sum(result.minutos :: bigint) AS total
  FROM (SELECT 
		DATE_PART('day', r.end_datetime - r.start_datetime) * 24 + 
		DATE_PART('hour', r.end_datetime - r.start_datetime) * 60 +
		DATE_PART('minute', r.end_datetime - r.start_datetime) as minutos
	FROM rental_reservations r
	JOIN customers c ON c.id = r.customer_id
	AND LENGTH(c.platform_token) = 12
        GROUP BY 1) result

-- IPHONE

SELECT AVG(result.minutos :: bigint) AS average, sum(result.minutos :: bigint) AS total
  FROM (SELECT 
		DATE_PART('day', r.end_datetime - r.start_datetime) * 24 + 
		DATE_PART('hour', r.end_datetime - r.start_datetime) * 60 +
		DATE_PART('minute', r.end_datetime - r.start_datetime) as minutos
	FROM rental_reservations r
	JOIN customers c ON c.id = r.customer_id
	AND LENGTH(c.platform_token) = 30
        GROUP BY 1) result


-- BUILDING
SELECT DISTINCT r.customer_id, r.scooter_id
FROM rental_reservations r
where r.start_datetime is not null
-- and r.start_datetime >= '2019-07-08 08:00:00'
-- and r.end_datetime <= '2019-07-15 00:00:00'
AND r.customer_id NOT IN (
    SELECT DISTINCT r2.customer_id
    FROM   rental_reservations r2
    where r2.start_datetime is not null
    and r2.start_datetime >= '2019-07-08 12:00:00' 
	and r2.end_datetime <= '2019-07-14 00:00:00'
    );
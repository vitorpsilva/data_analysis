-- CHALLENGE ONE

SELECT s.name_scooter, s.model, s.battery_capacity
FROM scooters s
left outer join rental_reservations r on r.scooter_id = s.id
join customers c on c.id = r.customer_id
where s.city = upper('Copenhagen')
and r.start_datetime >= '2019-07-08 12:00:00' 
and r.end_datetime <= '2019-07-15 00:00:00'
and LENGTH(c.platform_token) = 12


-- CHALLENGE TWO

SELECT AVG(result.minutos :: bigint) AS average, sum(result.minutos :: bigint) AS total
  FROM (SELECT 
		DATE_PART('day', r.end_datetime - r.start_datetime) * 24 + 
		DATE_PART('hour', r.end_datetime - r.start_datetime) * 60 +
		DATE_PART('minute', r.end_datetime - r.start_datetime) as minutos
	FROM rental_reservations r
	JOIN customers c ON c.id = r.customer_id
	AND LENGTH(c.platform_token) = 12
        GROUP BY 1) result


-- BUILDING
SELECT DISTINCT r.customer_id, r.scooter_id
FROM rental_reservations r
where r.start_datetime is not null
and r.start_datetime >= '2019-07-08 08:00:00'
and r.end_datetime <= '2019-07-15 00:00:00'
AND r.customer_id NOT IN (
    SELECT DISTINCT r2.customer_id
    FROM   rental_reservations r2
    where r2.start_datetime is not null
    and r2.start_datetime >= '2019-07-08 12:00:00' 
	and r2.end_datetime <= '2019-07-14 00:00:00'
    );
    

   SELECT c.id, s.name_scooter, s.model, s.city, c.platform_token, DATEDIFF(minutes, r.start_datetime, r.end_datetime)
FROM scooters s
left outer join rental_reservations r on r.scooter_id = s.id
join customers c on c.id = r.customer_id
where s.city = upper('Copenhagen')
and r.start_datetime is not null
and r.end_datetime <= '2019-07-15 00:00:00'
and LENGTH(c.platform_token) = 30

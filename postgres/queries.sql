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

select AVG(n1.minutos :: bigint) as average, sum(n1.minutos :: bigint) as total
  from (SELECT 
		DATE_PART('day', r.end_datetime - r.start_datetime) * 24 + 
	    DATE_PART('hour', r.end_datetime - r.start_datetime) * 60 +
	    DATE_PART('minute', r.end_datetime - r.start_datetime) as minutos
	FROM rental_reservations r
	join customers c on c.id = r.customer_id
	and LENGTH(c.platform_token) = 12
          group by 1) n1


--last day of last month
select last_day(dateadd (month,-1,dateadd (day,-1,CURRENT_DATE)))

-- x days from today
select TRUNC(dateadd(day, x, CURRENT_DATE))

--curent month from date/timestamp
select extract(month from date)

--month and year from current date
select to_char(current_date, 'YYYY-MM')

--convert to SF timezone Postgres
select convert_timezone('America/Los_Angeles', date)

--convert to SF timezone MySQL
select CONVERT_TZ( current_timestamp, @@session.time_zone, "America/Los_Angeles")


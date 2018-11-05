###### small-numbers table
DROP TABLE IF EXISTS numbers_small;
CREATE TABLE numbers_small (number INT);
INSERT INTO numbers_small VALUES (0),(1),(2),(3),(4),(5),(6),(7),(8),(9);

###### main numbers table
DROP TABLE IF EXISTS numbers;
CREATE TABLE numbers (number BIGINT);
INSERT INTO numbers
SELECT thousands.number * 1000 + hundreds.number * 100 + tens.number * 10 + ones.number
  FROM numbers_small thousands, numbers_small hundreds, numbers_small tens, numbers_small ones
LIMIT 1000000;

###### date table
DROP TABLE IF EXISTS dates;
CREATE TABLE dates (
  date_id          BIGINT PRIMARY KEY, 
  date             DATE NOT NULL,
  timestamp        BIGINT NOT NULL, 
  weekend          CHAR(10) NOT NULL DEFAULT "Weekday",
  day_of_week      CHAR(10) NOT NULL,
  month            CHAR(10) NOT NULL,
  month_day        INT NOT NULL, 
  year             INT NOT NULL,
  week_starting_monday CHAR(2) NOT NULL,
  UNIQUE KEY `date` (`date`),
  KEY `year_week` (`year`,`week_starting_monday`)
);

###### populate it ...
INSERT INTO dates (date_id, date, timestamp, weekend, day_of_week, month, month_day, year, week_starting_monday)
SELECT
    date_id,
    date,
    UNIX_TIMESTAMP(date) AS timestamp,
    IF( DATE_FORMAT( date, "%W" ) IN ('Saturday','Sunday'), 'Weekend', 'Weekday') AS weekend,
    DATE_FORMAT( date, "%W" ) AS day_of_week,
    DATE_FORMAT( date, "%M") AS month,
    DATE_FORMAT( date, "%d" ) AS month_day,
    DATE_FORMAT( date, "%Y" ) AS year,
    DATE_FORMAT(date,'%v') AS week_starting_monday
FROM (
    SELECT
        number AS date_id,
        DATE_ADD( '2010-01-01', INTERVAL number DAY ) AS date
    FROM numbers
    WHERE DATE_ADD( '2010-01-01', INTERVAL number DAY ) BETWEEN '2010-01-01' AND '2020-01-01'
) AS t0
ORDER BY date_id;
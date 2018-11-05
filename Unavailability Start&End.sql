--MySQL start and end of a unavailability
SET    @rownum = 1,
       @rank = 1,
       @prev_val = NULL;

SELECT `user`,date, RANK,
       MIN(uxp),
       MAX(uxp)
FROM (SELECT user,date, @rownum := @rownum + 1 AS ROW,
             @rank := IF (timestampdiff (MINUTE,@prev_val,time) = 15,@rank,@rownum) AS RANK,
             @prev_val := time AS uxp
      FROM (SELECT `user`,date(day_timestamp) as date
                   time(day_timestamp) as time
            FROM reporting_dm.future_availability
            ORDER BY 2,3) AS t1
      ORDER BY uxp) AS t2
GROUP BY `user`, date, RANK;
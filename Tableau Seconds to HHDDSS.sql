STR(INT(SUM( [# of Seconds] )/3600)) + ":" +
// convert minutes back to a string
IF LEN(STR(INT((SUM([# of Seconds]) % 3600 ) / 60))) = 1 THEN
    "0" + STR(INT((SUM([# of Seconds]) % 3600 ) / 60)) 
ELSE
    STR(INT((SUM([# of Seconds]) % 3600 ) / 60)) 
END
+ ":" +
//convert seconds back to a string
IF LEN(STR(INT(SUM([# of Seconds]) % 60))) = 1 THEN
    "0" + STR(INT(SUM([# of Seconds]) % 60)) 
ELSE
    STR(INT(SUM([# of Seconds]) % 60))
END
IF DATEPART('hour',[Shift Start Datetime]) = 0 THEN '12'
ELSEIF DATEPART('hour',[Shift Start Datetime])<10 THEN '0'+STR(DATEPART('hour',[Shift Start Datetime]))
ELSEIF DATEPART('hour',[Shift Start Datetime])<=12 THEN STR(DATEPART('hour',[Shift Start Datetime]))
ELSEIF DATEPART('hour',[Shift Start Datetime])>12 and DATEPART('hour',[Shift Start Datetime])<=21 THEN '0'+STR(DATEPART('hour',[Shift Start Datetime])-12)
ELSE STR(DATEPART('hour',[Shift Start Datetime])-12) END //hour
+ ':' +
IF DATEPART('minute',[Shift Start Datetime])<=9 THEN '0'+STR(DATEPART('minute',[Shift Start Datetime]))
ELSE STR(DATEPART('minute',[Shift Start Datetime])) END //minute
+' '+
IF DATEPART('hour',[Shift Start Datetime])>=12 THEN 'pm' ELSE 'am' END //AM or PM


+' - '+

IF DATEPART('hour',[Shift End Datetime]) = 0 THEN '12'
ELSEIF DATEPART('hour',[Shift End Datetime])<10 THEN '0'+STR(DATEPART('hour',[Shift End Datetime]))
ELSEIF DATEPART('hour',[Shift End Datetime])<=12 THEN STR(DATEPART('hour',[Shift End Datetime]))
ELSEIF DATEPART('hour',[Shift End Datetime])>12 and DATEPART('hour',[Shift End Datetime])<=21 THEN '0'+STR(DATEPART('hour',[Shift End Datetime])-12)
ELSE STR(DATEPART('hour',[Shift End Datetime])-12) END //hour
+ ':' +
IF DATEPART('minute',[Shift End Datetime])<=9 THEN '0'+STR(DATEPART('minute',[Shift End Datetime]))
ELSE STR(DATEPART('minute',[Shift End Datetime])) END //minute
+' '+
IF DATEPART('hour',[Shift End Datetime])>=12 THEN 'pm' ELSE 'am' END //AM or PM
select pid, trim(user_name), starttime, substring(query,1,20)
from stv_recents
where status='Running';


cancel PID; --broj pid-a

--http://docs.aws.amazon.com/redshift/latest/dg/cancel_query.html
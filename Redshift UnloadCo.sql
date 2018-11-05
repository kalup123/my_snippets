unload  ('select * from venue order by venueid')
to 's3://mybucket/tickit/venue/reload_' 
iam_role 'arn:aws:iam::0123456789012:role/MyRedshiftRole' 
manifest 
delimiter '|';

truncate venue;

copy venue 
from 's3://mybucket/tickit/venue/reload_manifest' 
iam_role 'arn:aws:iam::0123456789012:role/MyRedshiftRole'
manifest 
delimiter '|';



truncate table dwh.company;

COPY dwh.company
FROM 's3://spstaging/com.txt'
CREDENTIALS 'aws_iam_role=arn:aws:iam::331272084511:role/RedshiftCopy'
timeformat 'auto'
dateformat 'auto'
ACCEPTINVCHARS 
BLANKSASNULL
TRIMBLANKS
delimiter '~'
;

--csv copy command
COPY dwh.bamboo_leads
FROM 's3://dwhbackups/bamboo_leads.csv'
CREDENTIALS 'aws_iam_role=arn:aws:iam::331272084511:role/RedshiftCopy'
timeformat 'auto'
dateformat 'auto'
ACCEPTINVCHARS
BLANKSASNULL
TRIMBLANKS
ignoreheader 1
delimiter ','
removequotes
;



unload  ('select * from dwh.d_mrr_balance_hist')
to 's3://dwhbackups/d_mrr_balance_hist.txt' 
credentials 'aws_iam_role=arn:aws:iam::331272084511:role/RedshiftUnload'  
delimiter '~'
ALLOWOVERWRITE;



unload  ('select * from  dwh.lead_new')
to 's3://dwhbackups/lead'
credentials 'aws_iam_role=arn:aws:iam::331272084511:role/RedshiftUnload'
ALLOWOVERWRITE
gzip;


COPY dwh.lead_compress
FROM 's3://dwhbackups/lead'
CREDENTIALS 'aws_iam_role=arn:aws:iam::331272084511:role/RedshiftCopy'
timeformat 'auto'
dateformat 'auto'
ACCEPTINVCHARS
BLANKSASNULL
TRIMBLANKS
compupdate ON
gzip
;
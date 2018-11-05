Required Date Month
extract('MM',{required_date})

Required Date Year
extract('YYYY',{required_date})

Required Date Quarter
ifelse({Required Date Month} < 4,'Q1',ifelse({Required Date Month} < 7,'Q2',ifelse({Required Date Month} < 10,'Q3','Q4')))
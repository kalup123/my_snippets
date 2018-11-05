CREATE OR REPLACE LIBRARY uap_python LANGUAGE plpythonu
  FROM 'https://github.com/ajlai/uap-redshift/releases/download/0.7.2/uap-redshift.zip';

CREATE OR REPLACE FUNCTION parse_ua_family (ua VARCHAR)
RETURNS VARCHAR IMMUTABLE AS $$
  from ua_parser import user_agent_parser
  return user_agent_parser.ParseUserAgent(ua)['family']
$$ LANGUAGE plpythonu;

SELECT parse_ua_family('Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36');
--> Chrome


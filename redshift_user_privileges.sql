select nspname as schemaname, array_to_string(nspacl, ',') as acls
from pg_namespace
where nspacl is not null
  and nspowner != 1
  and array_to_string(nspacl, ',') like '%po_segment%'; -- REPLACE USERNAME

select pg_namespace.nspname as schemaname, pg_class.relname as tablename, array_to_string(pg_class.relacl, ',') as acls
from pg_class
       left join pg_namespace on pg_class.relnamespace = pg_namespace.oid
where pg_class.relacl is not null
  and pg_namespace.nspname not in ('pg_catalog', 'pg_toast', 'information_schema')
  and array_to_string(pg_class.relacl, ',') like '%po_segment%' -- REPLACE USERNAME
order by pg_namespace.nspname, pg_class.relname;

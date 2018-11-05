--Pivot data

select company_id, 'admin', admin from first_contact_all
UNION ALL
select company_id, 'Customer', Customer from first_contact_all
UNION ALL
select company_id, 'Email', Email from first_contact_all
UNION ALL
select company_id, 'Call', Call from first_contact_all;


--Unpivot data
select company_id, min(admin) as Admin, min(Customer) as Customer, min(Email) as Email, min(Call) as Call
from
(select company_id,
case type when 'admin' then contacted_date else NULL end as admin,
case type when 'user' then contacted_date else NULL end as Customer,
case type when 'Email' then contacted_date else NULL end as Email,
case type when 'Call' then contacted_date else NULL end as Call
from dwh.first_contact_all)
group by company_id
order by company_id;
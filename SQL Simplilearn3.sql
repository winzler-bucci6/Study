SELECT e.first_name,e.last_name,o.city,e.salary
FROM sql_hr.employees as e inner join sql_hr.offices as o
on e.office_id=o.office_id;

#OR 

SELECT e.first_name,e.last_name,o.city,e.salary
FROM sql_hr.employees as e inner join sql_hr.offices as o
using (office_id)
order by salary;

SELECT c.customer_id,c.first_name,c.last_name,o.order_id,o.status
FROM sql_store.customers as c left join sql_store.orders as o
on c.customer_id=o.customer_id;

SELECT c.customer_id,c.first_name,c.last_name,o.order_id,o.status
FROM sql_store.customers as c left join sql_store.orders as o
on c.customer_id=o.customer_id
where order_id is null;

SELECT concat(m.last_name, ',',m.first_name) as Manager,concat(e.last_name,',',e.first_name) as Employee
FROM sql_hr.employees as e inner join sql_hr.employees as m
on e.employee_id=m.reports_to
order by Manager;

SELECT c.first_name,c.last_name,o.order_id
FROM sql_store.customers as c left join sql_store.orders as o
on c.customer_id=o.customer_id
union
SELECT c.first_name,c.last_name,o.order_id
FROM sql_store.customers as c right join sql_store.orders as o
on c.customer_id=o.customer_id;

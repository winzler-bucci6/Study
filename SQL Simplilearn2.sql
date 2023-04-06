SELECT avg(salary)
FROM sql_hr.employees;

SELECT round(avg(points),1) as Ave_points,city
FROM sql_store.customers
group by city;

SELECT sum(points) as Total_points,city
FROM sql_store.customers
group by city;

SELECT count(customer_id),city
FROM sql_store.customers
order by count(customer_id) desc

SELECT product_id,sum(unit_price * quantity) as totals
FROM sql_store.order_items
group by product_id

SELECT p.product_id,sum(o.unit_price * quantity)
FROM sql_store.order_items as o inner join sql_store.products as p
where o.product_id=p.product_id
group by p.product_id 

SELECT office_id,avg(salary) as Avg_salary
FROM sql_hr.employees
group by office_id
having avg(salary)>75000;

SELECT office_id,count(employee_id) as emp_count
FROM sql_hr.employees
group by office_id
having count(employee_id)>3;

SELECT city,count(*)as cust_count
FROM sql_store.customers
where city != "Orlando"
group by city ;

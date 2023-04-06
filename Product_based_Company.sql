



create table billing
(
      customer_id               int
    , customer_name             varchar(1)
    , billing_id                varchar(5)
    , billing_creation_date     date
    , billed_amount             int
);


SELECT *
FROM product_based_company.billing;

insert into billing values (1, 'A', 'id1', date('2020-10-10'), 100);
insert into billing values (1, 'A', 'id2', date('2020-11-11'), 150);
insert into billing values (1, 'A', 'id3', date('2021-11-12'), 100);
insert into billing values (2, 'B', 'id4', date('2019-11-10'), 150);
insert into billing values (2, 'B', 'id5', date('2020-11-11'), 200);
insert into billing values (2, 'B', 'id6', date('2021-11-12'), 250);
insert into billing values (3, 'C', 'id7', date('2018-01-01'), 100);
insert into billing values (3, 'C', 'id8', date('2019-01-05'), 250);
insert into billing values (3, 'C', 'id9', date('2021-01-06'), 300);

select customer_id,customer_name,sum(billed_amount)
from product_based_company.billing
where billing_creation_date between '2019-01-01' and '2021-12-31'
group by customer_id;



with cte as
(select customer_id,customer_name
,sum(case when date_format(billing_creation_date, '%Y')='2019' then billed_amount else 0 end)  as sum_2019
,sum(case when date_format(billing_creation_date, '%Y')='2020' then billed_amount else 0 end)  as sum_2020
,sum(case when date_format(billing_creation_date, '%Y')='2021' then billed_amount else 0 end)  as sum_2021
,count(case when date_format(billing_creation_date,'%Y')='2019' then billed_amount else null end) as cnt_2019
,count(case when date_format(billing_creation_date, '%Y')='2020' then billed_amount else null end) as cnt_2020
,count(case when date_format(billing_creation_date, '%Y')='2021' then billed_amount else null end) as cnt_2021
from product_based_company.billing
group by customer_id,customer_name)
select customer_id,customer_name
,(sum_2019+sum_2020+sum_2021)/(case when cnt_2019 =0 then 1 else cnt_2019 end 
+case when cnt_2020 =0 then 1 else cnt_2020 end 
+case when cnt_2021 =0 then 1 else cnt_2021 end) as Avg_Billed_Amount
from cte
order by 1;


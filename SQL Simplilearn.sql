show databases;
use world;
show tables;
select*
from city;
describe city;
create database sql_intro;
show databases;

create table emp_details(Name varchar(25),Age int,sex char(1),doj date,city varchar(15),salary float);

describe emp_details;

insert into emp_details
values("Jimmy",35,"M","2005-05-30","Chicago",70000),
("Shane",30,"M","1999-06-25","Seattle",55000),
("Marry",28,"F","2009-03-10","Boston",62000),
("Dwayne",37,"M","2011-07-12","Austin",57000),
("Sara",32,"F","2017-10-27","New York",72000),
("Ammy",35,"F","2014-12-20","Seattle",80000);

select *
from emp_details;

select distinct city
from emp_details;


select count(Name) as count_name
from emp_details;

select sum(salary) 
from emp_details;

select avg(salary)
from emp_details;

select Name,Age,city
from emp_details;

select *
from emp_details
where Age>30;

select Name,sex,city
from emp_details
where sex='F';

select *
from emp_details
where city ='Chicago' or city='Austin';

select *
from emp_details
where city in('Chicago','Austin');

select *
from emp_details
where doj between '2000-01-01' and '2010-12-31';

select *
from emp_details
where Age >30 and sex='M';

select sex,sum(salary) as total_salary
from emp_details
group by sex;

select*
from emp_details
order by salary desc;

select (170-120) as subtract;
select length('India') as Total_length;
select repeat('@',10);
select upper('kenya');
select lower('KENYA');

select current_date();
select day(current_date());
select now();





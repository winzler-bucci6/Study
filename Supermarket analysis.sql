SELECT count(Customer_type), Branch
FROM supermarket.supermarket
WHERE Customer_type = 'Member'
group by Branch
order by count(Customer_type) DESC;

SELECT Branch, count(Customer_type),avg(Rating) 
FROM supermarket.supermarket
WHERE Customer_type = 'Member'
group by Branch
order by count(Customer_type) DESC;

SELECT Branch,count('Customer_type'),sum(gross_income)
FROM supermarket.supermarket
where Customer_type ='Member'
group by Branch
order by sum(gross_income) DESC;



SELECT Payment,count(Payment),sum(gross_income)
FROM supermarket.supermarket
group by Payment
order by count(Payment) DESC;

select Gender,sum(cogs),sum(gross_income),avg(gross_margin_percentage),avg(Rating)
FROM supermarket.supermarket
group by Gender;

select Product_line,sum(gross_income)
from supermarket.supermarket
group by Product_line
order by sum(gross_income) DESC;
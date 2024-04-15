-- Walmart Sales Analysis --



-- Questions to Answer --


-- 1. How many unique cities does the data set have?

select 
	distinct city
from walmartsales;


-- 2. In which city is each branch?

select 
	distinct city
	,branch
from Walmartsales;


-- 3. How many unique product lines does the data have?

select
	distinct product_line
from walmartsales;


-- 4. What is the most common payment method?

select 
	payment
	,count(payment) as qty
from walmartsales 
group by 1
order by 2 desc;


-- 5. What is the most selling product line?

select 
	product_line
	,count(product_line) as qty
from walmartsales 
group by 1
order by 2 desc;


-- 6. What is total revenue by month?

select 
	month(date) as month_number
	,monthname(date) as month
	,round(sum(total),0) as revenue
from walmartsales
group by 1,2 
order by 1 asc;


-- 7. What month has the largest cost of goods sold (COGS)?

select 
	month(date) as month_number
	,monthname(date) as month
	,round(sum(cogs),0) as cost
from walmartsales
group by 1,2 
order by 1 asc;


-- 8. What product line had the largest revenue?

select 
	product_line
	,round(sum(total),0) as revenue
from walmartsales 
group by 1
order by 2 desc;


-- 9. What is the city with largest revenue?

select 
	city
	,branch
	,round(sum(total),0) as revenue
from walmartsales 
group by 1, 2
order by 3 desc;


-- 10. Which branch sold more products than average product sold?

select 
	branch
	,sum(quantity) as qty
from walmartsales 
group by 1
having avg(quantity) > (select avg(quantity) from walmartsales);


-- 11. What is the most common product line by gender?

select 
	gender
	,product_line
	,count(gender) as total_count
from walmartsales 
group by 1,2
order by 3 desc;


-- 12. Number of sales made in each time of the day and average rating.

select
	case 
		when time between "06:00:00" and "12:00:00" then 'morning'
		when time between "12:00:01" and "16:00:00" then 'afternoon'
	else 'evening'
	end as time_of_day
	,count(*) as sales
	,round(avg(rating),2) as avg_rating
from walmartsales
group by 1
order by 2 desc;


-- 13. Which of the customer type brings the most revenue?

select 
	customer_type
	,round(sum(total),0) as revenue
from walmartsales 
group by 1;


-- 14. Which customer type buys the most

select
	customer_type
	,count(*) as customer_count
from walmartsales
group by 1;


-- 15. Gender % ratio

select
	gender
	,count(*) / (select count(*) from walmartsales) * 100 as percentage_ratio
from walmartsales
group by 1;


-- 16. Which day of the week has the best sum of gross income?

select
	dayofweek(date) as day_number
	,dayname(date) as day
	,round(sum(gross_income),0) as gross_income
from walmartsales 
group by 1,2 
order by 1 asc;

























	


















































	

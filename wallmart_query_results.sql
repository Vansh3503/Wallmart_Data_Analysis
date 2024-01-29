-- ---------------Feature Engineering-----------
-- SELECT
--   time,
--   CASE
--     WHEN time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
--     WHEN time BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
--     ELSE 'Evening'
--   END AS time_of_day
-- FROM
--   sales;
--   
-- ALTER TAble sales add column time_of_day VARCHAR(20)
-- UPDATE sales
--   set time_of_day=(
--   CASE
--     WHEN time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
--     WHEN time BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
--     ELSE 'Evening'
--     END);
--     
--     select * from sales

-- Adding day_name coloumn ------------------

-- select dayname(date) from sales

-- ALTER TAble sales add column day_name VARCHAR(20)

-- UPDATE sales 
-- set day_name=(dayname(date))

-- Adding month_name column---------------

-- select monthname(date),date from sales


-- ALTER TAble sales add column month_name VARCHAR(20)

-- UPDATE sales 
-- set month_name=(monthname(date))


-- ----------- GENRIC QUESTIONS--------------



-- How many unique cities does the data have?

-- select count(distinct(city)) from sales 

-- IN which city is each branch?

-- SELECT 
-- 	DISTINCT city,
--     branch
-- FROM sales;


-- PRODUCT QUESTIONS ---------

-- How many unique product lines does the data have?

-- select * from sales
-- select distinct(product_line) from sales
-- Answer will be 6

-- What is the most common payment method?

-- select count((payment)),payment from sales group by payment order by count((payment)) desc
-- answer is cash

--  What is the most selling product line?
--  
--  SELECT
-- 	SUM(quantity) as qty,
--     product_line
-- FROM sales
-- GROUP BY product_line
-- ORDER BY qty DESC;


-- What is the total revenue by month?

--  select month_name,sum(total) from sales group by month_name 


-- What month had the largest COGS?

-- select * from sales
-- select sum(cogs),month_name from sales group by month_name order by sum(cogs) 

--  What product line had the largest revenue?

-- select * from sales
--  select sum(total) as total_revenue,product_line from sales group by product_line order by total_revenue desc 


-- - What is the city with the largest revenue?
--  select city,sum(total) from sales group by city order by sum(total) desc LIMIT 1

--  What product line had the largest VAT?


-- SELECT
-- 	product_line,
-- 	AVG(tax_pct) as avg_tax
-- FROM sales
-- GROUP BY product_line
-- ORDER BY avg_tax DESC;


-- Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales

-- SELECT
-- 	product_line,
-- 	CASE
-- 		WHEN AVG(quantity) > 6 THEN "Good"
--         ELSE "Bad"
--     END AS remark
-- FROM sales
-- GROUP BY product_line;

-- Which branch sold more products than average product sold?

-- SELECT 
-- 	branch, 
--     SUM(quantity) AS qnty
-- FROM sales
-- GROUP BY branch
-- HAVING SUM(quantity) > (SELECT AVG(quantity) FROM sales);


--   What is the most common product line by gender-- 


-- SELECT
--     gender,
--     product_line,
--     COUNT(gender) AS total_cnt
-- FROM sales
-- GROUP BY gender, product_line
-- ORDER BY total_cnt DESC;


-- What is the average rating of each product line?
-- select avg(rating),product_line from sales group by product_line
--  
-- SELECT
-- 	ROUND(AVG(rating), 2) as avg_rating,
--     product_line
-- FROM sales
-- GROUP BY product_line
-- ORDER BY avg_rating DESC;




-- --------------------------------------------------------------------
-- --------------------------------------------------------------------

-- --------------------------------------------------------------------
-- -------------------------- Customers -------------------------------
-- --------------------------------------------------------------------



-- How many unique customer types does the data have?
-- select distinct(customer_type) from sales

-- How many unique payment methods does the data have?
-- select distinct(payment) from sales

-- What is the most common customer type?
-- select count(customer_type),customer_type from sales group by customer_type
--  
-- Which customer type buys the most?

-- select customer_type,sum(quantity) from sales group by customer_type

-- What is the gender of most of the customers?

-- SELECT
-- 	gender,
-- 	COUNT(*) as gender_cnt
-- FROM sales
-- GROUP BY gender



-- What is the gender distribution per branch?

-- select gender,branch,count(*)  from sales group by branch,gender 



-- Which time of the day do customers give most ratings?


-- select avg(rating),time_of_day from sales group by time_of_day


-- Which time of the day do customers give most ratings per branch?


--  -- select avg(rating),time_of_day,branch from sales group by time_of_day,branch



-- Which day fo the week has the best avg ratings?
-- select avg(rating),day_name from sales group by day_name order by avg(rating) desc


-- Which day of the week has the best average ratings per branch?

-- select avg(rating),day_name,branch from sales group by day_name,branch order by avg(rating) desc


-- --------------------------------------------------------------------
-- --------------------------------------------------------------------

-- --------------------------------------------------------------------
-- ---------------------------- Sales ---------------------------------
-- --------------------------------------------------------------------




-- Number of sales made in each time of the day per weekday 

-- SELECT
-- 	time_of_day,day_name,
-- 	COUNT(*) AS total_sales
-- FROM sales

-- GROUP BY time_of_day ,day_name
-- ORDER BY total_sales DESC;



--  Which of the customer types brings the most revenue?

-- select customer_type,sum(total) from sales group by customer_type


-- Which city has the largest tax/VAT percent?

-- select avg(tax_pct),city from sales group by city


-- 
-- Which customer type pays the most in VAT?

-- select avg(tax_pct),customer_type from sales group by customer_type
























































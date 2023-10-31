---Displaying the dataset
SELECT *
from supermarketsales;

----What is the total revenue for each branch?
SELECT branch, SUM(total_revenue) AS BranchTotalRevenue
FROM supermarketsales
GROUP BY branch
ORDER BY  BranchTotalRevenue DESC;

--what city has the highest and lowest revenue?
SELECT city, SUM(total_revenue) AS CityTotalrevenue
from supermarketsales
GROUP BY city
OrDER BY CityTotalRevenue DESC;

--What is the average revenue from regular customers compared to new customers?

  SELECT customer_type, ROUND(AVG(total_revenue)) AS AverageCustomerRevenue
  FROM supermarketsales
  GROUP BY customer_type;
  
  --How does the gender of the customer affect the product line they purchase?
  SELECT product_line, gender, COUNT(*) AS GenderPreference
  FROM supermarketsales
  GROUP BY product_line, gender;
  
  --What is the best-selling product line?
  SELECT product_line, SUM(total_revenue) AS BestSelling
  FROM supermarketsales
  GROUP BY product_line
  ORDER BY BestSelling DESC;
  
  --What time of the day has the most transactions?
 SELECT
    CASE
        WHEN time >= '08:00' AND time < '12:00' THEN 'Morning'
        WHEN time >= '12:00' AND time < '18:00' THEN 'Afternoon'
        WHEN time >= '18:00' AND time < '22:00' THEN 'Evening'
    END AS TimeRange,
    COUNT(*) AS TransactionCount
FROM supermarketsales
GROUP BY TimeRange
ORDER BY TransactionCount DESC;

--What quarter generated the highest revenue?
SELECT
    CASE
        WHEN SUBSTR(date, 4, 2) BETWEEN '01' AND '03' THEN 'Q1'
        WHEN SUBSTR(date, 4, 2) BETWEEN '04' AND '06' THEN 'Q2'
        WHEN SUBSTR(date, 4, 2) BETWEEN '07' AND '09' THEN 'Q3'
        WHEN SUBSTR(date, 4, 2) BETWEEN '10' AND '12' THEN 'Q4'
    END AS Quarter,
    SUM(total_revenue) AS TotalRevenue
FROM supermarketsales
GROUP BY Quarter
ORDER BY TotalRevenue DESC;

--What is the most used payment method?
SELECT payment, COUNT(*) AS MostUsedMethod
FROM supermarketsales
GROUP BY payment
ORDER BY MostUsedMethod DESC;

--What is the difference in payment methods between regular and new customers?
SELECT payment, customer_type, COUNT(*) AS CustomerPaymentCount
FROM supermarketsales
GROUP BY payment, customer_type;

--	What is the difference in cost of goods for each product line?
SELECT product_line,SUM(cogs) AS TotalCostPerProductline
FROM supermarketsales
GROUP BY product_line
ORDER BY TotalCostPerProductline DESC;

--What product line has the highest ratings?
SELECT product_line, ROUND(AVG(rating),2) AS AvgRating
FROM supermarketsales
GROUP BY product_line
ORDER BY AvgRating DESC;

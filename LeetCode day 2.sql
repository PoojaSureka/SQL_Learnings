/* 577. Employee Bonus */
SELECT
   e.name, b.bonus 
FROM Employee e
LEFT JOIN Bonus b 
  on e.empId  = b.empId 
where b.bonus<1000 OR b.bonus IS NULL;

/* 584. Find Customer Referee */

SELECT 
  name 
FROM  Customer 
where referee_id != 2 OR referee_id IS NULL;

/* 586. Customer Placing the Largest Number of Orders */

with CTE AS 
(SELECT 
      customer_number, 
      COUNT(order_number) AS NUM_ORDERS
FROM Orders
GROUP BY customer_number) 
SELECT 
      customer_number
FROM CTE 
WHERE NUM_ORDERS = (SELECT Max(NUM_ORDERS) FROM CTE)

/* 595. Big Countries */

SELECT
    name,  
    population,
    area 
FROM World
WHERE  area >= 3000000  OR population  >= 25000000;

/* 596. Classes More Than 5 Students */

with cte as
(SELECT  
    class,
    count(class) AS total_class 
FROM Courses
group by class)

SELECT 
      class 
FROM cte 
WHERE total_class >= 5

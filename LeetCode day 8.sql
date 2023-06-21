/* 1741. Find Total Time Spent by Each Employee */

SELECT 
    event_day AS day, 
    emp_id, 
    SUM(out_time-in_time) AS total_time
FROM Employees
GROUP BY emp_id, event_day;

/* 1757. Recyclable and Low Fat Products */

SELECT 
    product_id 
FROM Products 
WHERE low_fats = "Y" 
AND recyclable = "Y";


/* 1873. Calculate Special Bonus */

SELECT 
    employee_id, 
    CASE WHEN employee_id%2 != 0 
    AND name NOT LIKE "M%" THEN SALARY ELSE 0 END AS bonus
 FROM Employees
 ORDER BY employee_id;


/* 1890. The Latest Login in 2020 */
SELECT 
    DISTINCT user_id, 
    FIRST_VALUE(time_stamp) 
    OVER(PARTITION BY user_id ORDER BY time_stamp DESC)
    AS last_stamp
FROM Logins
WHERE year(time_stamp) = 2020;

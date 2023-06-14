/* 610. Triangle Judgement */
SELECT *, 
CASE WHEN (X+Y>Z) AND (Y+Z>X) AND (Z+X>Y) 
        THEN "Yes" ELSE "No" 
        end AS triangle
FROM Triangle;


/* 619. Biggest Single Number */

with cte AS 
(SELECT 
      num, 
      COUNT(num) AS cn 
FROM MyNumbers
GROUP BY num
HAVING cn = 1)

SELECT 
CASE WHEN cn = 1 THEN  MAX(num) ELSE Null end AS num
FROM cte; 

/* 620. Not Boring Movies */

SELECT id, movie, description, rating
FROM Cinema
WHERE id % 2 != 0 AND description != "boring"
ORDER BY rating DESC;


/* 627. Swap Salary */


UPDATE Salary 
SET sex = CASE WHEN sex = "f" THEN "m"
WHEN sex = "m" THEN "f" END;

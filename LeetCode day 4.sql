/* 1050. Actors and Directors Who Cooperated At Least Three Times */

SELECT 
    actor_id, 
    director_id 
FROM ActorDirector
GROUP BY actor_id, director_id
HAVING COUNT(timestamp) >=3;

/* 1211. Queries Quality and Percentage */

WITH cte AS
(SELECT 
    query_name,
    (rating/ position) AS  qnt,
CASE WHEN rating < 3 THEN 1
ELSE 0 END AS poor_query 
FROM queries)

SELECT 
      query_name, 
      ROUND(avg(qnt),2) AS quality,
      ROUND((sum(poor_query)/count(poor_query))*100,2) AS poor_query_percentage 
FROM cte
GROUP BY query_name;

/* 1251. Average Selling Price */


SELECT 
    p.product_id,
    ROUND(SUM(p.price * us.units)/SUM(us.units),2) AS average_price
FROM Prices p
JOIN UnitsSold us
ON p.product_id = us.product_id
WHERE us.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id;
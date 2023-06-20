/* 1407. Top Travellers  */

SELECT 
    DISTINCT u.name,
    CASE when r.distance IS NOT NULL THEN SUM(r.distance) 
    OVER(PARTITION BY r.user_id ORDER BY user_id) ELSE 0 END AS travelled_distance 
FROM  Users u 
LEFT JOIN Rides r
ON u. id  = r.user_id
ORDER BY  travelled_distance DESC, name;

/* 1484. Group Sold Products By The Date  */

SELECT 
    sell_date, 
    COUNT(DISTINCT product) AS num_sold,
    GROUP_CONCAT(DISTINCT product ORDER BY product) AS products
FROM Activities
GROUP BY sell_date
ORDER BY sell_date;

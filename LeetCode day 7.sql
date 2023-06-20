/* 1581. Customer Who Visited but Did Not Make Any Transactions */

SELECT 
    V.customer_id, 
    COUNT(V.visit_id ) AS count_no_trans
FROM Visits V
LEFT JOIN Transactions t
ON V.visit_id = t.visit_id
WHERE t.transaction_id IS NULL
GROUP BY V.customer_id;

1587. Bank Account Summary II

/* 1587. Bank Account Summary II */

SELECT 
    u.name, 
    SUM(t.amount) AS balance
FROM  Users u
JOIN Transactions t
ON  u.account = t.account
GROUP BY u.account
HAVING  balance > 10000;

/* Invalid Tweets */
SELECT 
    tweet_id
FROM Tweets
WHERE LENGTH(content) > 15;

/* 1693. Daily Leads and Partners */

SELECT  
    date_id, 
    make_name, 
    COUNT(DISTINCT lead_id) AS unique_leads , 
    COUNT(DISTINCT partner_id) AS unique_partners
FROM DailySales
GROUP BY date_id, make_name;

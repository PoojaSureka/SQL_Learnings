/* 175. Combine Two Tables */
SELECT 
    p.firstName,
	p.lastName, 
	a.city, 
	a.state
FROM Person p
LEFT JOIN Address a
	ON p. personId  = a.personId;

/* 181. Employees Earning More Than Their Managers */
	
SELECT
  e1.name AS Employee
FROM Employee e1
JOIN Employee e2
  on e1.managerId = e2.id
WHERE 
  e1.salary > e2.salary;
  
/* 182. Duplicate Emails */
  
SELECT email 
FROM 
  (SELECT id, email, 
  RANK() OVER(PARTITION BY email ORDER BY id DESC) AS rn FROM Person) AS a
WHERE rn = 2;	
  
/* 183. Customers Who Never Order */  

SELECT
    c.name AS customers 
FROM customers C 
LEFT JOIN orders o 
    ON c.id = o.customerId
WHERE o.customerId is NULL;
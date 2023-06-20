

/* 1280. Students and Examinations */

WITH cte AS
(SELECT * FROM students 
CROSS JOIN Subjects ),

cte1 AS 
(SELECT 
      student_id, subject_name, 
      COUNT( subject_name) as no_of_subject
FROM Examinations
GROUP BY 
student_id, subject_name)

SELECT 
    cte.student_id, 
    cte.student_name, 
    cte.subject_name, 
    CASE WHEN no_of_subject IS NOT NULL THEN no_of_subject ELSE 0 END AS attended_exams
FROM cte LEFT JOIN cte1
ON cte.student_id = cte1.student_id
AND
cte.subject_name = cte1.subject_name
ORDER BY cte.student_id, cte.subject_name;

/* 1378. Replace Employee ID With The Unique Identifier */

SELECT 
    en.unique_id ,
    e.name
FROM Employees e
LEFT JOIN EmployeeUNI en 
ON e.id = en.id;
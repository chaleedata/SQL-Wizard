-- This file to show use function REGEXP (MySQL ,PostgreSQL ,SQLite)
-- REGEXP allows for much more complex and flexible pattern matching than LIKE.

Input: 
Patients table:
+------------+--------------+--------------+
| patient_id | patient_name | conditions   |
+------------+--------------+--------------+
| 1          | Daniel       | YFEV COUGH   |
| 2          | Alice        |              |
| 3          | Bob          | DIAB100 MYOP |
| 4          | George       | ACNE DIAB100 |
| 5          | Alain        | DIAB201      |
+------------+--------------+--------------+

Output: 
+------------+--------------+--------------+
| patient_id | patient_name | conditions   |
+------------+--------------+--------------+
| 3          | Bob          | DIAB100 MYOP |
| 4          | George       | ACNE DIAB100 | 
+------------+--------------+--------------+



SELECT patient_id , patient_name , conditions
FROM Patients 
WHERE conditions REGEXP '\\bDIAB1' --The '\\bDIAB1' expression is a regular expression pattern that matches a word that starts with "DIAB1".
ORDER BY patient_id

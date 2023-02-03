-- Write an SQL query to fix the names so that only the first character is uppercase and the rest are lowercase.

Input: 
Users table:
+---------+-------+
| user_id | name  |
+---------+-------+
| 1       | aLice |
| 2       | bOB   |
+---------+-------+

Output: 
+---------+-------+
| user_id | name  |
+---------+-------+
| 1       | Alice |
| 2       | Bob   |
+---------+-------+

--Breakdown the steps
-- Firstly we need to fetch the first letter and convert it to upperCase
SUBSTRING(string, start, [length])

UPPER(SUBSTRING(name , 1 ,1))
-- Secondly we need to fetch the remaing string to lowerCase
LOWER(SUBSTRING(name , 2))
-- Third concat two strings A+B
CONCAT(string1, string2)

--ANS
SELECT user_id , CONCAT(UPPER(SUBSTRING(name , 1 ,1)) , LOWER(SUBSTRING(name , 2))) AS name
FROM Users
ORDER BY Users.user_id ASC
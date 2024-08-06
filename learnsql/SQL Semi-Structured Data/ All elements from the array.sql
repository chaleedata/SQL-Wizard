-- Selecting All Elements from the Array
-- use UNNEST
SELECT id , name , UNNEST(emails) as email
FROM users
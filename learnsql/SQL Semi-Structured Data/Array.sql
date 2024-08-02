-- use bracket [] for create array

SELECT "Lee" as name
       [skill1 , skill2] 
FROM (
    SELECT 
        "SQL" as skill1,
        "Python " as skill2
    )

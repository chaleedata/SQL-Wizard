--use offset
SELECT skills[offset(0)] as offset_0 , 
        skills[offset(1)] as offset_1
FROM (SELECT ["Java" , "Python"] as skills)
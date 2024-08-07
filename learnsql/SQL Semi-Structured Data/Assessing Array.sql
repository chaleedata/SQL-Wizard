--In Big query
--use offset
SELECT  skills[offset(0)] as offset_0 , 
        skills[offset(1)] as offset_1
FROM (SELECT ["Java" , "Python"] as skills)

--Amazon Redshift
-- store array in json 
WITH skills_data as (
    SELECT '["Java" , "Python"]'::json AS skills
),
indexed_skills AS (
    SELECT 
        JSON_EXTRACT_ARRAY_ELEMENT_TEXT(skills) WITH ORDINALITY AS skill ,ordinality
    FROM skills_data
)
SELECT 
    MAX(CASE WHEN ordinality = 1 THEN skill ELSE NULL END) AS offset_0 ,
    MAX(CASE WHEN ordinality = 2 THEN skill ELSE NULL END) AS offset_1
FROM indexed_skills;
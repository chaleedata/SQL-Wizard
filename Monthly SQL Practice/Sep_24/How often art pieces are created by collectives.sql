-- Step 1: Identify whether artworks are created by collectives or individuals
WITH is_collective_or_individual AS (
    SELECT a.id AS artwork_id,
           CASE 
               WHEN EXISTS (
                   SELECT 1
                   FROM artwork_artist aa 
                   JOIN collective_membership cm ON aa.artist_id = cm.collective_id
                   WHERE aa.artwork_id = a.id
               ) THEN 'collective'
               ELSE 'individual'
           END AS flag
    FROM artwork a
), 

-- Step 2: Count the number of individual and collective artworks
art_counts AS (
    SELECT 
        SUM(CASE WHEN flag = 'individual' THEN 1 ELSE 0 END) AS individual_artist_pieces,
        SUM(CASE WHEN flag = 'collective' THEN 1 ELSE 0 END) AS collective_pieces
    FROM is_collective_or_individual
)

-- Step 3: Calculate the percentage and display results
SELECT 
    individual_artist_pieces, 
    collective_pieces, 
    ROUND(CAST(collective_pieces AS decimal) / (individual_artist_pieces + collective_pieces) * 100, 2) AS collective_percentage 
FROM art_counts;
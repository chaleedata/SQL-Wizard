-- Analyze the depth, height, and width of specific art pieces and then select the greatest dimension value among them.

SELECT GREATEST(MAX(depth_cm), MAX(height_cm), MAX(width_cm)) AS max_dimension
FROM artwork a
JOIN (
    SELECT artwork_id 
    FROM artwork_artist 
    WHERE artist_id = '999'
) b
ON a.id = b.artwork_id;
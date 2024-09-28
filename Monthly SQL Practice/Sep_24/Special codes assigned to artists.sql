
-- Create The special code consists of the first two letters of the artist's
/*
| name            | special_code |
|-----------------|--------------|
| Marwan          | ma           |
| Lisa Yuskavage  | liyu         |
| Roberto Obregon | roob         |
| Wolfgang Paalen | wopa         |
| Roberto Ossaye  | roos         | */

SELECT 
    name,
    LOWER(
        CONCAT(
            SUBSTRING(SPLIT_PART(name, ' ', 1), 1, 2), 
            SUBSTRING(SPLIT_PART(name, ' ', 2), 1, 2)
        )
    ) AS special_code
FROM 
    artist;
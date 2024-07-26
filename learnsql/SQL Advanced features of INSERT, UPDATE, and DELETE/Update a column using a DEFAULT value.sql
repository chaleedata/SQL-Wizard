/*The author Alan Hillary ( id = 3 ) would like to set the is_active value to the
default and change the path for his photo to imgs/alan3.jpg */

UPDATE author
SET photo = 'imgs/alan3.jpg', 
    is_active = DEFAULT
WHERE id = 3;
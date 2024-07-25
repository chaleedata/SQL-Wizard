/*
default value is a constraint that says that 
if there is no value added to this column during an INSERT or UPDATE operation, 
the specified default value will be used.

In our database, the author table has default values for the following columns:
• photo (default value of'imgs/no-photo.jpg')
• create_timestamp
• is_active (default value of false )
The post table has a default value for modified_timestamp 

Exercise
Let's add the data for Cindy Barry into the author table. She should have an 
ID of  2 , a photo path set to 'imgs/cindy.jpg' , and a registration date of '2018-08-27'
*/

INSERT INTO author (id, first_name, last_name, photo, create_timestamp, is_active) 
VALUES (2, 'Cindy', 'Barry', 'imgs/cindy.jpg', '2018-08-27', DEFAULT);
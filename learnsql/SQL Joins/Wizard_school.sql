/*For all groups taught in the La Lingua school, show the following information:
• the ID of a given group,
• the name of the lecturer who teaches that group,
• the language that the group learns,
• the Level of the group, and
• the days and hours when the group has lectures.
However, show this information only for those groups that have both their Lectures at
the same hour and whose tuition is greater than 800 dollars.*/


select   c.id ,  d.name , c.language , c.group_level , a.day , a.hour
from timetable a
join timetable b
on a.hour = b.hour and a.group_id = b.group_id and a.day != b.day
join student_group c
on a.group_id  = c.id
join lecturer d
on c.lecturer_id  = d.id
join tuition e
on a.group_id  = e.group_id
where cost > 800
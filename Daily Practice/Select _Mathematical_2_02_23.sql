Input: 
Employees table:
+-------------+---------+--------+
| employee_id | name    | salary |
+-------------+---------+--------+
| 2           | Meir    | 3000   |
| 3           | Michael | 3800   |
| 7           | Addilyn | 7400   |
| 8           | Juan    | 6100   |
| 9           | Kannon  | 7700   |
+-------------+---------+--------+


Output: 
+-------------+-------+
| employee_id | bonus |
+-------------+-------+
| 2           | 0     |
| 3           | 0     |
| 7           | 7400  |
| 8           | 0     |
| 9           | 7700  |
+-------------+-------+


-- I would like to get employee 2 and 8 get 0 bonus and name not start with M  get 0 bonus

--First  use case when
select employee_id, 
case 
    when employee_id%2 != 0 and name NOT LIKE 'M%' then salary
        else 0
    end as bonus
from employees order by employee_id;

--you will see employee_id have odd and even number you must to dividing the number by 2 is equal to zero it even otherwise odd


--Second use if 
select employee_id,
    if(employee_id % 2 <> 0 and name like 'M%' , 0 , salary) as bonus
from employees order by employee_id;
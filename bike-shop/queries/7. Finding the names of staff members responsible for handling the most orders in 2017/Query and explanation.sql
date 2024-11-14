/*

OBJECTIVE: want to find the names of staff members responsible for handling the most orders in 2017. 

*/


SELECT
last_name AS surname,
order_count
from staffs AS staff
JOIN (
		SELECT 
		staff_id,
		SUM(CASE WHEN EXTRACT(YEAR FROM order_date) = 2017 THEN 1 else 0 END) AS order_count
		from orders
		GROUP BY staff_id
) AS orders
ON staff.staff_id = orders.staff_id
ORDER BY order_count desc;


/*

EXPLANATION
- Combined a subquery and join in this case.

- Used the subquery to aggregate the number of orders that each staff member made specifically in 2017. 
  I.e. if the order_date is in 2017, then we count it (1). Otherwise it is not counted (0).

- Used the join to combine the staffs table (to obtain the name of the staff member) and the orders table (which
  allows us to count all orders handled by each staff_id in the year 2017).

- Ordered by the quantity of orders from highest to lowest (descending order).

*/





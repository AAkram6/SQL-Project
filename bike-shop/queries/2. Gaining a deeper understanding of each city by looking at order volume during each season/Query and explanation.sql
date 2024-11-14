/* 

OBJECTIVE: want to gain a deeper understanding of sales coming from each city. How many orders for bikes 
are coming from customers from each city, during each season.  

*/

select
customers.city AS city,
CASE 
WHEN EXTRACT(MONTH FROM order_date) IN (12, 01, 02) THEN 'winter'
WHEN EXTRACT(MONTH FROM order_date) IN (03, 04, 05) THEN 'spring'
WHEN EXTRACT(MONTH FROM order_date) IN (06, 07, 08) THEN 'summer'
WHEN EXTRACT(MONTH FROM order_date) IN (09, 10, 11) THEN 'autumn'
END AS season,
count(*) AS orders
FROM orders
INNER JOIN customers ON customers.customer_id = orders.customer_id
GROUP BY customers.city, season
ORDER BY city ASC;


/* 

EXPLANATION: 
- Needed to join two tables - the customer table and orders table.

- The customers table has information regarding the city that each customer is from,
  and the orders table contains order date and order volume data. 
  
- Used a conditional statement to group months into seasons. 

- Chose to order by city, as the purpose of this query is to gain a deeper understanding of each city. 
  Ordering by alphabetical order makes it easier to find the city that we want to gain a deeper understanding about. 

*/


/*

OBJECTIVES: list of cities where orders have still not been shipped to. 

*/


select
customers.city AS city,
count(*) AS not_shipped
FROM CUSTOMERS
FULL OUTER JOIN orders ON customers.customer_id = orders.customer_id
WHERE shipped_date IS NULL
GROUP BY city
ORDER BY not_shipped DESC;



/*

EXPLANATION: 
- Needed to join the customer and order tables.

- Only selected cities where the 'shipped date' field is null, this filters out all cities
  where bikes have already been shipped to. 

- Grouped by each city to see the number of orders which have still not been shipped to each city. 

*/

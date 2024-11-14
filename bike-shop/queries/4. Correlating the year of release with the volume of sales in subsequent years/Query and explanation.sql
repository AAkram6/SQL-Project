/* 

OBJECTIVE: correlating the year of release with the volume of sales in subsequent years.

*/

select 
products.model_year as release_Year,
EXTRACT (YEAR FROM order_date) as order_year,
sum(quantity) AS sales
from
products 
INNER JOIN 
order_items ON products.product_id = order_items.product_id
INNER JOIN 
orders ON order_items.order_id = orders.order_id
GROUP BY release_year, order_year
ORDER BY sales DESC;



/* 

CONCLUSION: the highest volume of sales happen during the same year of release. Decline in sales after each
            subsequent year. Best way to observe this is to look at hugely declining sales for bikes released in 2016. 

EXPLANATION: 
- Needed to join three different tables (products, order_items and orders)

- Had to extract only the year from the order_date column from the orders table so we can easily make a comparison with the
  model_year column in the products table.

- Ordered by the quantity of sales, from highest to lowest.

*/




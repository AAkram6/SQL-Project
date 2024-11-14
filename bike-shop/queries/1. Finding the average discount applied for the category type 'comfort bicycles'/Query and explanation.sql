/* 

OBJECTIVE: Finding the average dicount applied for the category type 'comfort bicycles'.  

*/


select 
ROUND(AVG(discount), 2) AS average_discount
from order_items 
where product_id IN (
					  select 
					  product_id
					  from products 
					  where category_id IN (
											 select 
											 category_id 
											 from categories 
											 where category_name LIKE 'Comfort Bicycles' ));


/* 

EXPLANATION: 
- Used two subqueries to find the solution to this. 

- The final subquery allows me to run the query without having to know the category_id. I.e. I am using the 
  LIKE operator to find the category_id using the category name 'Comfort Bicycles'. I can then use this category_id
  for the next subquery.

- I can then find all of the products which fall under the category 'Comfort Bicycles' through the product_id in
  the products table.

- Now that we have every product that falls under the category 'Comfort Bicycles', we can calculate the average 
  discount that was applied for every product under the category 'Comfort Bicycles'.

*/










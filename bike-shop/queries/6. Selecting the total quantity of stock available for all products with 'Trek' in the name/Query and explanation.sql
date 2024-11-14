/*

OBJECTIVE: selecting the total quantity of stock available for all products with 'Trek' in the name.

*/


SELECT 
sum(quantity) AS quantity 
FROM stocks
WHERE product_id IN ( select
					  product_id
					  from products 
					  where product_name LIKE 'Trek%' );


/*

EXPLANATION: 
- Used a subquery (through store_id) to find this information. 

- Used the LIKE operator and used 'Trek%', meaning that I am selecting all prodcucts starting with 'Trek' without
  having to specify the variety of letters / words that come after. 

*/



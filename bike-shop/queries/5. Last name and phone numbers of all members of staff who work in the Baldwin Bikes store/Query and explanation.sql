/* 

OBJECTIVE: last name and phone numbers of all members of staff who work in the Baldwin Bikes store. 

*/


select
last_name,
phone
from staffs
WHERE store_id = ( select store_id
				   from stores 
			       WHERE store_name LIKE 'Baldwin Bikes' );


/* 

EXPLANATION: 
- Used a subquery (through store_id) to find this information. 

- Queried the stores table to find the name 'Baldwin Bikes' using the LIKE operator. Then used this 
  to find the phone numbers and last names of all staff members who work in the store with this name.

*/


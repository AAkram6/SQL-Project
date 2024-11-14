CREATE TABLE customers (
	customer_id INT,
	first_name VARCHAR(40),
	last_name VARCHAR(40),
	phone VARCHAR(15),
	email VARCHAR(50),
	street VARCHAR(40),
	city VARCHAR(40),
	state VARCHAR(40),
	zip_code VARCHAR(10),
	PRIMARY KEY (customer_id)
);



CREATE TABLE orders (
	order_id INT,
	customer_id INT,
	order_status INT, 
	order_date DATE,
	required_date DATE,
	shipped_date DATE,
	store_id int,
	staff_id int,
	PRIMARY KEY (order_id),
	FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE SET NULL
);

ALTER TABLE orders
ADD CONSTRAINT fk_orders_store
FOREIGN KEY (store_id) 
REFERENCES stores (store_id)
ON DELETE SET NULL;

ALTER TABLE orders
ADD CONSTRAINT fk_orders_staffs
FOREIGN KEY (staff_id) 
REFERENCES staffs (staff_id)
ON DELETE SET NULL;




CREATE TABLE order_items (
	order_id INT,
	item_id INT,
	product_id INT,
	quantity INT, 
	list_price decimal(15,2),
	discount decimal(15,2),
	PRIMARY KEY (order_id, item_id)
);

ALTER TABLE order_items
ADD CONSTRAINT fk_items_product
FOREIGN KEY (product_id) 
REFERENCES products (product_id)
ON DELETE SET NULL;




CREATE TABLE stores (
	store_id INT,
	store_name VARCHAR(40),
	phone VARCHAR(15),
	email VARCHAR(50),
	street varchar(40),
	city varchar(40),
	state varchar(40),
	zip_code varchar(10),
	PRIMARY KEY (store_id)
);





CREATE TABLE staffs (
	staff_id INT, 
	first_name VARCHAR(40),
	last_name VARCHAR(40),
	email varchar(50),
	phone varchar(15),
	active SMALLINT,
	store_id INT,
	manager_id INT,
	PRIMARY KEY (staff_id)
);

ALTER TABLE staffs
ADD CONSTRAINT fk_staffs_store
FOREIGN KEY (store_id) 
REFERENCES stores (store_id)
ON DELETE SET NULL;

ALTER TABLE staffs
ADD CONSTRAINT fk_staffs_manager
FOREIGN KEY (manager_id) 
REFERENCES staffs (staff_id)
ON DELETE SET NULL;




CREATE TABLE categories (
	category_id INT,
	category_name VARCHAR(40),
	PRIMARY KEY (category_id)
);




CREATE TABLE products (
	product_id INT,
	product_name varchar(80),
	brand_id int,
	category_id int,
	model_year int,
	list_price decimal(15,2),
	PRIMARY KEY (product_id)
);

ALTER TABLE products
ADD CONSTRAINT fk_products_brand
FOREIGN KEY (brand_id) 
REFERENCES brands (brand_id)
ON DELETE SET NULL;

ALTER TABLE products
ADD CONSTRAINT fk_products_categories
FOREIGN KEY (category_id) 
REFERENCES categories (category_id)
ON DELETE SET NULL;




CREATE TABLE stocks (
	store_id int, 
	product_id int,
	quantity int,
	PRIMARY KEY (store_id, product_id)
);




CREATE TABLE brands (
	brand_id int,
	brand_name varchar(40),
	PRIMARY KEY (brand_id)
);





-- Insert Data into Customers
insert into Customers (name, contact_name, country) values ("Sagar Dahal", "Chaosifier", "USA");
insert into Customers (name, contact_name, country) values ("Yogen Pokhrel", "Sarkar", "Dubai");
insert into Customers (name, contact_name, country) values ("Bisho Silwal", "BishoNath Sahuji", "Germany");
insert into Customers (name, contact_name, country) values ("Gaurav Neupane", "Guru", "Australia");
insert into Customers (name, contact_name, country) values ("Roshan Bhattarai", "Ranchhoddas", "England");

-- Insert Data into Products
insert into Products (product_name, supplier_id, category_id, unit_price) values ("Macbook", 1, 1, 1600.0);
insert into Products (product_name, supplier_id, category_id, unit_price) values ("iPhone 13 Pro", 1, 1, 1039.14);
insert into Products (product_name, supplier_id, category_id, unit_price) values ("Samsung Galaxy S23", 1, 1, 1279.34);
insert into Products (product_name, supplier_id, category_id, unit_price) values ("Sony Bravia TV", 2, 3, 1400.25);
insert into Products (product_name, supplier_id, category_id, unit_price) values ("Dell XPS 15", 1, 1, 1300.28);
insert into Products (product_name, supplier_id, category_id, unit_price) values ("Canon Camera", 3, 2, 2400.45);
insert into Products (product_name, supplier_id, category_id, unit_price) values ("Bose Headphones",4, 4, 350.27);
insert into Products (product_name, supplier_id, category_id, unit_price) values ("Mixer", 5, 5, 200.76);
insert into Products (product_name, supplier_id, category_id, unit_price) values ("Nintendo", 6, 6, 349.3);
insert into Products (product_name, supplier_id, category_id, unit_price) values ("TCL TV", 2, 3, 400.0);
insert into Products (product_name, supplier_id, category_id, unit_price) values ("Microsoft Surface Pro", 1, 1, 009.15);
insert into Products (product_name, supplier_id, category_id, unit_price) values ("Fitbit", 7, 7, 179.3);
insert into Products (product_name, supplier_id, category_id, unit_price) values ("Gas Grill", 8, 8, 800.16);
insert into Products (product_name, supplier_id, category_id, unit_price) values ("Electric Guitar", 9, 9, 1100.2);
insert into Products (product_name, supplier_id, category_id, unit_price) values ("LG Monitor", 2, 3, 300.78);
insert into Products (product_name, supplier_id, category_id, unit_price) values ("GoPro Hero", 10, 2, 400.34);

-- Insert Data into Orders
insert into Orders (customer_id, order_date, ship_city, ship_country) values (1, '2021-11-1', 'Fairfield', 'USA');
insert into Orders (customer_id, order_date, ship_city, ship_country) values (2, '2022-12-12', 'Dubai Marina', 'Dubai');
insert into Orders (customer_id, order_date, ship_city, ship_country) values (3, '2023-10-3', 'Dortmund', 'Germany');
insert into Orders (customer_id, order_date, ship_city, ship_country) values (3, '2024-9-4', 'Bayern', 'Germany');
insert into Orders (customer_id, order_date, ship_city, ship_country) values (4, '2021-9-6', 'Melbourne', 'Australia');
insert into Orders (customer_id, order_date, ship_city, ship_country) values (4, '2022-9-13', 'Sydney', 'Australia');
insert into Orders (customer_id, order_date, ship_city, ship_country) values (5, '2023-10-6', 'London', 'England');
insert into Orders (customer_id, order_date, ship_city, ship_country) values (5, '2024-10-12', 'Manchester', 'England');
insert into Orders (customer_id, order_date, ship_city, ship_country) values (5, '2021-11-14', 'Wolves', 'England');
insert into Orders (customer_id, order_date, ship_city, ship_country) values (5, '2022-11-23', 'Chelsea', 'England');

-- Inserting Data into OrderDetails
insert into OrderDetails (order_id, product_id, quantity) values (1, 5, 7);
insert into OrderDetails (order_id, product_id, quantity) values (3, 10, 3);
insert into OrderDetails (order_id, product_id, quantity) values (7, 2, 8);
insert into OrderDetails (order_id, product_id, quantity) values (5, 8, 5);
insert into OrderDetails (order_id, product_id, quantity) values (9, 3, 10);
insert into OrderDetails (order_id, product_id, quantity) values (2, 15, 2);
insert into OrderDetails (order_id, product_id, quantity) values (4, 12, 6);
insert into OrderDetails (order_id, product_id, quantity) values (6, 4, 4);
insert into OrderDetails (order_id, product_id, quantity) values (8, 9, 7);
insert into OrderDetails (order_id, product_id, quantity) values (10, 11, 3);
insert into OrderDetails (order_id, product_id, quantity) values (1, 7, 9);
insert into OrderDetails (order_id, product_id, quantity) values (3, 13, 1);
insert into OrderDetails (order_id, product_id, quantity) values (7, 6, 5);
insert into OrderDetails (order_id, product_id, quantity) values (5, 14, 6);
insert into OrderDetails (order_id, product_id, quantity) values (9, 1, 8);
insert into OrderDetails (order_id, product_id, quantity) values (2, 3, 4);
insert into OrderDetails (order_id, product_id, quantity) values (4, 2, 7);
insert into OrderDetails (order_id, product_id, quantity) values (6, 8, 3);
insert into OrderDetails (order_id, product_id, quantity) values (8, 5, 9);
insert into OrderDetails (order_id, product_id, quantity) values (10, 15, 5);

-- Show data
select * from customers;
select * from products;
select * from orders;
select * from orderdetails;



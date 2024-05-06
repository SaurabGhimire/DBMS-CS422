-- Insert Data INTO Customers
INSERT INTO Customers (name, contact_name, country) VALUES ("Sagar Dahal", "Chaosifier", "USA");
INSERT INTO Customers (name, contact_name, country) VALUES ("Yogen Pokhrel", "Sarkar", "Dubai");
INSERT INTO Customers (name, contact_name, country) VALUES ("Bisho Silwal", "BishoNath Sahuji", "Germany");
INSERT INTO Customers (name, contact_name, country) VALUES ("Gaurav Neupane", "Guru", "Australia");
INSERT INTO Customers (name, contact_name, country) VALUES ("Roshan Bhattarai", "Ranchhoddas", "England");

-- Insert Data INTO Products
INSERT INTO Products (product_name, supplier_id, category_id, unit_price) VALUES ("Macbook", 1, 1, 1600.0);
INSERT INTO Products (product_name, supplier_id, category_id, unit_price) VALUES ("iPhone 13 Pro", 1, 1, 1039.14);
INSERT INTO Products (product_name, supplier_id, category_id, unit_price) VALUES ("Samsung Galaxy S23", 1, 1, 1279.34);
INSERT INTO Products (product_name, supplier_id, category_id, unit_price) VALUES ("Sony Bravia TV", 2, 3, 1400.25);
INSERT INTO Products (product_name, supplier_id, category_id, unit_price) VALUES ("Dell XPS 15", 1, 1, 1300.28);
INSERT INTO Products (product_name, supplier_id, category_id, unit_price) VALUES ("Canon Camera", 3, 2, 2400.45);
INSERT INTO Products (product_name, supplier_id, category_id, unit_price) VALUES ("Bose Headphones",4, 4, 350.27);
INSERT INTO Products (product_name, supplier_id, category_id, unit_price) VALUES ("Mixer", 5, 5, 200.76);
INSERT INTO Products (product_name, supplier_id, category_id, unit_price) VALUES ("Nintendo", 6, 6, 349.3);
INSERT INTO Products (product_name, supplier_id, category_id, unit_price) VALUES ("TCL TV", 2, 3, 400.0);
INSERT INTO Products (product_name, supplier_id, category_id, unit_price) VALUES ("Microsoft Surface Pro", 1, 1, 009.15);
INSERT INTO Products (product_name, supplier_id, category_id, unit_price) VALUES ("Fitbit", 7, 7, 179.3);
INSERT INTO Products (product_name, supplier_id, category_id, unit_price) VALUES ("Gas Grill", 8, 8, 800.16);
INSERT INTO Products (product_name, supplier_id, category_id, unit_price) VALUES ("Electric Guitar", 9, 9, 1100.2);
INSERT INTO Products (product_name, supplier_id, category_id, unit_price) VALUES ("LG Monitor", 2, 3, 300.78);
INSERT INTO Products (product_name, supplier_id, category_id, unit_price) VALUES ("GoPro Hero", 10, 2, 400.34);

-- Insert Data INTO Orders
INSERT INTO Orders (customer_id, order_date, ship_city, ship_country) VALUES (1, '2021-11-1', 'Fairfield', 'USA');
INSERT INTO Orders (customer_id, order_date, ship_city, ship_country) VALUES (2, '2022-12-12', 'Dubai Marina', 'Dubai');
INSERT INTO Orders (customer_id, order_date, ship_city, ship_country) VALUES (3, '2023-10-3', 'Dortmund', 'Germany');
INSERT INTO Orders (customer_id, order_date, ship_city, ship_country) VALUES (3, '2024-9-4', 'Bayern', 'Germany');
INSERT INTO Orders (customer_id, order_date, ship_city, ship_country) VALUES (4, '2021-9-6', 'Melbourne', 'Australia');
INSERT INTO Orders (customer_id, order_date, ship_city, ship_country) VALUES (4, '2022-9-13', 'Sydney', 'Australia');
INSERT INTO Orders (customer_id, order_date, ship_city, ship_country) VALUES (5, '2023-10-6', 'London', 'England');
INSERT INTO Orders (customer_id, order_date, ship_city, ship_country) VALUES (5, '2024-10-12', 'Manchester', 'England');
INSERT INTO Orders (customer_id, order_date, ship_city, ship_country) VALUES (5, '2021-11-14', 'Wolves', 'England');
INSERT INTO Orders (customer_id, order_date, ship_city, ship_country) VALUES (5, '2022-11-23', 'Chelsea', 'England');

-- Inserting Data INTO OrderDetails
INSERT INTO OrderDetails (order_id, product_id, quantity) VALUES (1, 5, 7);
INSERT INTO OrderDetails (order_id, product_id, quantity) VALUES (1, 7, 9);
INSERT INTO OrderDetails (order_id, product_id, quantity) VALUES (2, 3, 4);
INSERT INTO OrderDetails (order_id, product_id, quantity) VALUES (2, 15, 2);
INSERT INTO OrderDetails (order_id, product_id, quantity) VALUES (3, 10, 3);
INSERT INTO OrderDetails (order_id, product_id, quantity) VALUES (3, 13, 1);
INSERT INTO OrderDetails (order_id, product_id, quantity) VALUES (4, 2, 7);
INSERT INTO OrderDetails (order_id, product_id, quantity) VALUES (4, 12, 6);
INSERT INTO OrderDetails (order_id, product_id, quantity) VALUES (5, 8, 5);
INSERT INTO OrderDetails (order_id, product_id, quantity) VALUES (5, 14, 6);
INSERT INTO OrderDetails (order_id, product_id, quantity) VALUES (6, 4, 4);
INSERT INTO OrderDetails (order_id, product_id, quantity) VALUES (6, 8, 3);
INSERT INTO OrderDetails (order_id, product_id, quantity) VALUES (7, 2, 8);
INSERT INTO OrderDetails (order_id, product_id, quantity) VALUES (7, 6, 5);
INSERT INTO OrderDetails (order_id, product_id, quantity) VALUES (8, 5, 9);
INSERT INTO OrderDetails (order_id, product_id, quantity) VALUES (8, 9, 7);
INSERT INTO OrderDetails (order_id, product_id, quantity) VALUES (9, 1, 8);
INSERT INTO OrderDetails (order_id, product_id, quantity) VALUES (9, 3, 10);
INSERT INTO OrderDetails (order_id, product_id, quantity) VALUES (10, 11, 3);
INSERT INTO OrderDetails (order_id, product_id, quantity) VALUES (10, 15, 5);

-- Show data
SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM orderdetails;



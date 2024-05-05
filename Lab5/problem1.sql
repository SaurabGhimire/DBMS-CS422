-- Create and Use Database
create database Sales_DB;
use Sales_DB;

-- Create Customers Table
create table Customers(
    id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    contact_name varchar(255),
    country varchar(255)
);

-- Create Orders Table
create table Orders(
    id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    customer_id int,
    order_date datetime,
    ship_city varchar(255),
    ship_country varchar(255),
    FOREIGN KEY (customer_id) REFERENCES Customers(id)
);

-- Create Products Table
create table Products(
    id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    product_name varchar(255) NOT NULL,
    supplier_id int,
    category_id int,
    unit_price float default 0.0
);

-- Create OrderDetails Table
create table OrderDetails(
    id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    order_id int, 
    product_id int,
    quantity int, 
    unit_price float,
    FOREIGN KEY (product_id) REFERENCES Products(id),
    FOREIGN KEY (order_id) REFERENCES Orders(id)
);



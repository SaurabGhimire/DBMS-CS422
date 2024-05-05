Create Database Database_miu_422_Store;
use Database_miu_422_Store;


Create Table Category (
    id int NOT NULL PRIMARY KEY AUTO_INCREMENT, 
    name varchar(255) NOT NULL
    );

Create Table Product (
    id int NOT NULL PRIMARY KEY AUTO_INCREMENT, 
    product_name varchar(255) NOT NULL, 
    price float default 0.0, 
    categoryId int NULL, 
    FOREIGN KEY (categoryId) REFERENCES Category(id)
    );

Insert into Category (id, name) values 
    (1, "Electronics"),
    (2, "Clothing"),
    (3, "Home");

Insert into Product (product_name, price, categoryId) values 
("iPhone 12", 799, 1),
("Samsung Galaxy S21", 899, 1),
("MacBook Pro", 1299, 1),
("Nike Air Max", 99, 2),
("Levi\'s Jeans", 59, 2),
("Sofa" ,499, 3),
("Dining Table", 899, 3);

-- a. Retrieve all products
select * from product;

-- b. Retrieve all products that belong to the "Clothing" category
select * from product as p
inner join category as c on p.categoryId = c.id
where c.name = "Clothing"; 

-- c. Retrieve the names and prices of all products that cost less than $100.
select product_name, price
from product
where price<100;

-- d. Update the price of the "MacBook Pro" to $1399.
update product
set price = 1399
where product_name = "MacBook Pro";

-- e. Delete the "Dining Table" product from the "Products" table.
delete from product
where product_name = "Dining Table";

-- f. Retrieve the names and prices of all products that belong to the "Electronics" category.
select product_name, price
from product as p inner join category as c on p.categoryId = c.id
where c.name = "Electronics";

-- g. Retrieve the names of all products that have a price greater than $500
select product_name
from product
where price > 500;

-- h. Retrieve the names and prices of the top 3 most expensive products.
select product_name, price
from product
order by price desc
limit 3;

-- i. Update the price of all products in the "Clothing" category to be 10% higher.
UPDATE product AS p
INNER JOIN category AS c ON p.categoryId = c.id
SET p.price = p.price * 1.1
WHERE c.name = 'Clothing';

-- j. Delete all products that have a price less than $50.
delete from product
where price<50;

-- k. Retrieve the names and prices of all products sorted in descending order by price.
select product_name, round(price,2) from product
order by price desc;

-- l. Retrieve the names and categories of all products, sorted in ascending order by category_name.
select c.name, p.product_name
from product as p inner join category as c on p.categoryId = c.id
order by c.name asc;

-- m. Delete all products that belong to the "Home" category.
delete p
from product as p 
inner join category as c on p.categoryId = c.id
where c.name = "Home";

-- n. Retrieve the names and prices of all products that have a price between $100 and $500.
select product_name, price 
from product
where price between 100 and 500;
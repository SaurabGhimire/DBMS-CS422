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

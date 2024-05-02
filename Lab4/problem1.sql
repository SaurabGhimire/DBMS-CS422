Create Database Database_miu_422_Store;
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


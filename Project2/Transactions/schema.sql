Create Database Database_miu_422_Project2;
use Database_miu_422_Project2;

CREATE TABLE stocks (
    id INT PRIMARY KEY AUTO_INCREMENT,
    symbol VARCHAR(50),
    name VARCHAR(255),
    price DECIMAL(10, 2)
);

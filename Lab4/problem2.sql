-- Create and Use Database
Create Database Database_miu_422_Lab4_Problem2;
Use Database_miu_422_Lab4_Problem2;

Create Table Hotel(
    hotelNo int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    hotelName varchar(255) UNIQUE,
    city varchar(255)
);

Create Table Room (
    roomNo int NOT NULL AUTO_INCREMENT, 
    hotelNo int, 
    type varchar(255), 
    price int, 
    PRIMARY KEY(roomNo, hotelNo), 
    FOREIGN KEY(hotelNo) REFERENCES Hotel(hotelNo)
);

Create Table Guest(
    guestNo int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    guestName varchar(255),
    guestAddress varchar(255)
);

Create Table Booking(
    hotelNo int,
    guestNo int,
    dateFrom datetime,
    dateTo datetime,
    roomNo int,
    PRIMARY KEY(hotelNo, guestNo, dateFrom),
    Foreign key (hotelNo) REFERENCES Hotel(hotelNo),
    Foreign key (guestNo) REFERENCES Guest(guestNo),
    Foreign key (roomNo) REFERENCES Room(roomNo)
);

/**
3.8) Identify the foreign keys in this schema
Ans: The foreign keys are 
        Hotel -> No Foreign Keys
        Room  -> hotelNo
        Guest -> No Foreign Keys
        Booking -> hotelNo, guestNo, roomNo

Entity Integrity Rules:
    It ensure uniqueness and not null of PRIMARY KEY attributes within a Table.
    Uniqueness: 
        Each row in a Table must be uniquely identifiable. 
        This is enforced by declaring a PRIMARY KEY constraint ON one or more columns.
        Example: In the Booking Table, the combination of hotelNo, guestNo, and dateFrom forms the PRIMARY KEY. 
        This ensures that each Booking is uniquely identified by these attributes.
    Not Nullable: 
        Primary key attributes cannot contain null VALUES. This ensures that each row has a UNIQUE identifier.
        Example: None of the columns included in the PRIMARY KEY (hotelNo, guestNo, and dateFrom) can be null in the Booking Table.

Referential Integrity Rules are maintained using Foreign Key Constraints: 
    Foreign key constraints enforce referential integrity by ensuring that the VALUES in a column (or columns) of one Table 
    match the VALUES in a column (or columns) of another Table's PRIMARY KEY.
    Example: In the Booking Table:
        hotelNo is a FOREIGN KEY referencing the Hotel Table's hotelNo column.
        guestNo is a FOREIGN KEY referencing the Guest Table's guestNo column.
        roomNo is a FOREIGN KEY referencing the Room Table's roomNo column.
    Cascade Actions: 
        Cascade actions specify what should happen to related rows in other tables 
        when a row in the referenced Table is modified or deleted.
        Example: If a Hotel is deleted FROM the Hotel Table, all corresponding bookings associated with that Hotel 
        can be automatically deleted FROM the Booking Table due to a cascade delete action.
    Restricted Actions: 
        Restricted actions prevent operations that would violate referential integrity. 
        Example: We can specify ON DELETE RESTRICT to prevent deletion of a Hotel FROM the Hotel Table 
                 if there are corresponding bookings in the Booking Table.
*/


-- Populate Hotel
INSERT INTO Hotel (hotelName, city) VALUES
('Grosvenor Hotel', 'London'),
('Dwarika''s Hotel', 'Fairfield'),
('Hotel Yak & Yeti', 'New York'),
('Hotel Shangri-La', 'London'),
('Temple Tree Resort & Spa', 'New York');

-- Populate Room  
INSERT INTO Room (hotelNo, type, price) VALUES
(1, 'Single', 20),
(1, 'Double', 100),
(2, 'Family', 70),
(2, 'Double', 30),
(3, 'Family', 60);

-- Populate Guest 
INSERT INTO Guest (guestName, guestAddress) VALUES
('Bisho Silwal', 'Fairfield'),
('Sagar Dahal', 'London'),
('Yogen Pokhrel', 'New York'),
('Gaurav Neupane', 'London'),
('Roshan Bhattarai', 'Chicago');

-- Populate Booking Table with Nepali Booking details
INSERT INTO Booking (hotelNo, guestNo, dateFrom, dateTo, roomNo) VALUES
(1, 1, '2024-07-15', '2024-07-20', 1),
(2, 2, '2024-07-10', '2024-07-15', 3),
(3, 3, '2024-07-20', '2024-07-25', 2),
(4, 4, '2024-08-01', '2024-08-05', 4),
(5, 5, '2024-08-10', '2024-08-15', 5);

-- SIMPLE QUERIES
-- 5.7 List full details of all hotels
SELECT * FROM Hotel;

-- 5.8 Hotels in London
SELECT * FROM Hotel
WHERE city = "London";
 
-- 5.9 guests in London
SELECT * FROM Guest
WHERE guestAddress like '%London%';

-- 5.10 double or family rooms below 40$ in asc order
SELECT * FROM Room
WHERE type = "Double" or type="Family" and
price<40
ORDER BY price asc;

-- 5.11 bookings for which dateTo has been specified
SELECT * FROM Booking
WHERE dateTo is NOT NULL;

-- AGGREGATE FUNCTIONS
-- 5.12 No. of hotels
SELECT count(*) AS hotel_count
FROM Hotel;

-- 5.13 Average price of a Room
SELECT AVG(price) AS average_price
FROM Room;

-- 5.14 Total revenue per night FROM all double rooms
SELECT ROUND(AVG(price),2) AS revenue_from_double_rooms
FROM Room
WHERE type = "Double";

-- 5.15 How many different guests have made bookings for August?
SELECT COUNT(DISTINCT guestNo) AS num_guests
FROM Booking
WHERE MONTH(dateFrom) = 8;

-- SUBQUERIES AND JOINS
-- 5.16 Rooms at Grosvenor Hotel
SELECT r.price, r.type FROM Hotel AS h
INNER JOIN Room AS r ON h.hotelNo = r.hotelNo
WHERE h.hotelName = "Grosvenor Hotel";

-- 5.17 Guests at Grosvenor Hotel
SELECT g.guestName 
FROM Hotel AS h
INNER JOIN Booking AS b ON b.hotelNo = h.hotelNo
INNER JOIN Guest AS g ON g.guestNo = b.guestNo
WHERE h.hotelName = "Grosvenor Hotel" 
and b.dataFrom<= CURDATE()
and b.dateTo >= CURDATE();

-- 5.18 details of all Room at Grosvenor Hotel
SELECT r.roomNo, r.type, r.price, g.guestName 
FROM Hotel AS h
INNER JOIN Booking AS b ON  b.hotelNo = h.hotelNo
INNER JOIN Room AS r ON b.roomNo = r.roomNo
INNER JOIN Guest AS g ON b.guestNo = g.guestNo
WHERE h.hotelName = "Grosvenor Hotel"; 

-- 5.19 Total income FROM bookings for Grosvenor Hotel
SELECT sum(r.price) AS total_income_from_bookings
FROM Hotel AS h
INNER JOIN Booking AS b ON  b.hotelNo = h.hotelNo
INNER JOIN Room AS r ON b.roomNo = r.roomNo
INNER JOIN Guest AS g ON b.guestNo = g.guestNo
WHERE h.hotelName = "Grosvenor Hotel"; 

-- 5.20 Room currently unoccupied at Grosvenor Hotel
SELECT r.roomNo, r.type, r.price 
FROM Hotel AS h
INNER JOIN Booking AS b ON  b.hotelNo = h.hotelNo
INNER JOIN Room AS r ON b.roomNo = r.roomNo
INNER JOIN Guest AS g ON b.guestNo = g.guestNo
WHERE h.hotelName = "Grosvenor Hotel"
AND CURDATE() NOT BETWEEN b.dateFrom AND b.dateTo;

-- 5.21 Lost income FROM unoccupied rooms at Grosvenor Hotel


-- Grouping
-- 5.22 List the number of rooms in each Hotel
SELECT h.hotelName, count(r.roomNo) AS no_of_rooms
FROM Hotel AS h
INNER JOIN Room AS r ON r.hotelNo = h.hotelNo
group by h.hotelNo;

-- 5.23 List the number of rooms in each Hotel
SELECT h.city, count(r.roomNo) AS no_of_rooms
FROM Hotel AS h
INNER JOIN Room AS r ON r.hotelNo = h.hotelNo
group by h.hotelNo
having h.city = "London";

-- 5.24 Average no of bookings for each Hotel in August
SELECT h.hotelName, b.dateFrom, AVG(b.hotelNo) AS avg_no_of_bookings
FROM Hotel AS h
INNER JOIN Room AS r ON r.hotelNo = h.hotelNo
INNER JOIN Booking AS b ON b.hotelNo = h.hotelNo
WHERE MONTH(b.dateFrom) = 8
GROUP BY h.hotelName, b.dateFrom;

-- 5.25 Most commonly booked Room type for each Hotel in London
SELECT r.type, count(b.hotelNo) AS bookings_count
FROM Hotel AS h
INNER JOIN Room AS r ON r.hotelNo = h.hotelNo
INNER JOIN Booking AS b ON b.hotelNo = h.hotelNo
WHERE h.city = "London"
GROUP BY r.type
ORDER BY bookings_count DESC
LIMIT 1;

-- 5.26 Lost inform FROM unoccupied rooms at each Hotel today

-- Populating tables
-- 5.27 Insert rows into each of these tables
INSERT INTO Hotel(hotelName, city) VALUES 
("Hotel Discover", "Fairfield"),
("Hotel Century", "London");

INSERT INTO Room(hotelNo, type, price) VALUES 
(7, "Family", 123.55),
(7, "Family", 120.00);

INSERT INTO Guest(guestName, guestAddress) VALUES 
("Saurab Ghimire", "Fairfield"),
("Navrattan Tata", "Fairfield");

INSERT INTO Booking(hotelNo, guestNo, roomNo, dateFrom, dateTo) VALUES 
(7, 6, 6, '2024-05-01', '2024-05-02'),
(7, 7, 7, '2024-05-04', '2024-05-05');

-- 5.28 Update price of all rooms by 5%
UPDATE Room
SET price = price * 1.05;
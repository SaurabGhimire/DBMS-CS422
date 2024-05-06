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
    Foreign key (roomNo) REFERENCES room(roomNo)
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
        This is enforced by declaring a PRIMARY KEY constraint on one or more columns.
        Example: In the Booking Table, the combination of hotelNo, guestNo, and dateFrom forms the PRIMARY KEY. 
        This ensures that each Booking is uniquely identified by these attributes.
    Not Nullable: 
        Primary key attributes cannot contain null values. This ensures that each row has a UNIQUE identifier.
        Example: None of the columns included in the PRIMARY KEY (hotelNo, guestNo, and dateFrom) can be null in the Booking Table.

Referential Integrity Rules are maintained using Foreign Key Constraints: 
    Foreign key constraints enforce referential integrity by ensuring that the values in a column (or columns) of one Table 
    match the values in a column (or columns) of another Table's PRIMARY KEY.
    Example: In the Booking Table:
        hotelNo is a FOREIGN KEY referencing the Hotel Table's hotelNo column.
        guestNo is a FOREIGN KEY referencing the Guest Table's guestNo column.
        roomNo is a FOREIGN KEY referencing the room Table's roomNo column.
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
('Annapurna Hotel', 'London'),
('Dwarika''s Hotel', 'Fairfield'),
('Hotel Yak & Yeti', 'New York'),
('Hotel Shangri-La', 'London'),
('Temple Tree Resort & Spa', 'New York');

-- Populate room  
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

-- Simple Queries
-- 5.7 List full details of all hotels
SELECT * FROM Hotel;

-- 5.8 Hotels in London
SELECT * FROM Hotel
where city = "London";
 
-- 5.9 guests in London
SELECT * FROM Guest
where guestAddress like '%London%';

-- 5.10 double or family rooms below 40$ in asc order
SELECT * FROM room
where type = "Double" or type="Family" and
price<40
order by price asc;

-- 5.11 bookings for which dateTo has been specified
SELECT * FROM Booking
where dateTo is NOT NULL;

-- Aggregate Queries
-- 5.12 No. of hotels
SELECT count(*) AS hotel_count
FROM Hotel;

-- 5.13 Average price of a room
SELECT AVG(price) AS average_price
FROM room;

-- 5.14 Total revenue per night FROM all double rooms
SELECT ROUND(AVG(price),2) AS revenue_from_double_rooms
FROM room
where type = "Double";

-- 5.15 How many different guests have made bookings for August?
SELECT COUNT(DISTINCT guestNo) AS num_guests
FROM Booking
WHERE MONTH(dateFrom) = 8;
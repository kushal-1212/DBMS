CREATE TABLE Hotel (
    hotel_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(200),
    phone VARCHAR(15) UNIQUE,
    email VARCHAR(100),
    rating INT
);

CREATE TABLE Room (
    room_id INT PRIMARY KEY,
    room_no INT,
    room_type VARCHAR(50),
    price DECIMAL(10,2),
    status VARCHAR(20),
    hotel_id INT,
    FOREIGN KEY (hotel_id) REFERENCES Hotel(hotel_id)
);

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100),
    address VARCHAR(200),
    id_proof VARCHAR(50)
);

CREATE TABLE Booking (
    booking_id INT PRIMARY KEY,
    check_in_date DATE,
    check_out_date DATE,
    no_of_guests INT,
    total_amount DECIMAL(10,2),
    customer_id INT,
    room_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (room_id) REFERENCES Room(room_id)
);

CREATE TABLE Payment (
    payment_id INT PRIMARY KEY,
    payment_date DATE,
    amount DECIMAL(10,2),
    payment_mode VARCHAR(50),
    booking_id INT UNIQUE,
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)
);

CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    designation VARCHAR(50),
    phone VARCHAR(15),
    salary DECIMAL(10,2),
    hotel_id INT,
    FOREIGN KEY (hotel_id) REFERENCES Hotel(hotel_id)
);
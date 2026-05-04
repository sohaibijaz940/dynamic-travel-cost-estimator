-- ##########################################################
-- 1. DATABASE INITIALIZATION[cite: 3]
-- ##########################################################
CREATE DATABASE IF NOT EXISTS TravelCostEstimator;
USE TravelCostEstimator;

-- ##########################################################
-- 2. TABLE CREATION (DDL)[cite: 3, 5]
-- ##########################################################

CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Password VARCHAR(100),
    Preferences TEXT,
    PhoneNumber VARCHAR(15) -- From Alter commands[cite: 3]
);

CREATE TABLE Hotels (
    HotelID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Location VARCHAR(100),
    Price DECIMAL(10,2),
    Amenities TEXT,
    Rating DECIMAL(3,2),
    CONSTRAINT CheckRating CHECK (Rating BETWEEN 0 AND 5)
);

CREATE TABLE TravelDetails (
    TravelID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    StartLocation VARCHAR(100),
    Destination VARCHAR(100),
    TravelDistance DECIMAL(10,2), -- Renamed from Distance[cite: 3]
    TransportType VARCHAR(50),
    EstimatedCost DECIMAL(10,2),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    HotelID INT,
    CheckInDate DATE,
    CheckOutDate DATE,
    TotalCost DECIMAL(10,2),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (HotelID) REFERENCES Hotels(HotelID)
);

CREATE TABLE PricingData (
    DataID INT PRIMARY KEY AUTO_INCREMENT,
    FuelPrice DECIMAL(10,2),
    FlightPrice DECIMAL(10,2),
    HotelPrice DECIMAL(10,2),
    DateUpdated DATE
);

-- ##########################################################
-- 3. DATA INSERTION (DML)[cite: 3]
-- ##########################################################

INSERT INTO Users (Name, Email, Password, Preferences, PhoneNumber) VALUES
('Ali Khan', 'ali@example.com', 'pass123', 'Economy Travel', '03229401610'),
('Sara Ahmed', 'sara@example.com', 'pass456', 'Luxury Travel', '03001234567'),
('Fahad Latif', 'fahad@example.com', 'fahad123', 'Economy Travel', '03117654321');

INSERT INTO Hotels (Name, Location, Price, Amenities, Rating) VALUES
('Pearl Continental', 'Lahore', 15000, 'WiFi, Pool, Breakfast', 4.5),
('Serena Hotel', 'Islamabad', 18000, 'WiFi, Spa, Gym', 4.7),
('Hotel One', 'Multan', 9000, 'WiFi, Parking', 4.2);

INSERT INTO TravelDetails (UserID, StartLocation, Destination, TravelDistance, TransportType, EstimatedCost) VALUES
(1, 'Lahore', 'Islamabad', 380, 'Car', 8000),
(2, 'Karachi', 'Lahore', 1200, 'Flight', 25000);

INSERT INTO Bookings (UserID, HotelID, CheckInDate, CheckOutDate, TotalCost) VALUES
(1, 1, '2024-06-01', '2024-06-05', 60000),
(2, 2, '2024-07-10', '2024-07-15', 90000);

INSERT INTO PricingData (FuelPrice, FlightPrice, HotelPrice, DateUpdated) VALUES
(300.50, 12000, 15000, '2024-04-01');

-- ##########################################################
-- 4. VIEWS[cite: 1]
-- ##########################################################

-- Top Rated Hotels (> 4.5)
CREATE VIEW TopRatedHotels AS 
SELECT HotelID, Name, Location, Rating FROM Hotels WHERE Rating > 4.5;

-- User Travel Summary
CREATE VIEW UserTravelSummary AS 
SELECT U.Name AS UserName, SUM(TD.EstimatedCost) AS TotalEstimatedTravelCost 
FROM Users AS U 
JOIN TravelDetails AS TD ON U.UserID = TD.UserID 
GROUP BY U.Name;

-- ##########################################################
-- 5. STORED PROCEDURES[cite: 1]
-- ##########################################################

DELIMITER //

-- Get Travel Details by User ID
CREATE PROCEDURE sp_GetTravelDetailsByUserID (IN p_UserID INT)
BEGIN
    SELECT * FROM TravelDetails WHERE UserID = p_UserID;
END //

-- Update Hotel Price
CREATE PROCEDURE sp_UpdateHotelPrice (IN p_HotelID INT, IN p_NewPrice DECIMAL(10,2)) 
BEGIN 
    UPDATE Hotels SET Price = p_NewPrice WHERE HotelID = p_HotelID; 
END //

-- Add New Travel Detail
CREATE PROCEDURE sp_AddTravelDetail (
    IN p_UserID INT, 
    IN p_StartLocation VARCHAR(100), 
    IN p_Destination VARCHAR(100), 
    IN p_Distance DECIMAL(10,2), 
    IN p_TransportType VARCHAR(50), 
    IN p_EstimatedCost DECIMAL(10,2)
) 
BEGIN 
    INSERT INTO TravelDetails (UserID, StartLocation, Destination, TravelDistance, TransportType, EstimatedCost) 
    VALUES (p_UserID, p_StartLocation, p_Destination, p_Distance, p_TransportType, p_EstimatedCost); 
END //

DELIMITER ;

-- ##########################################################
-- 6. SAMPLE TEST QUERIES[cite: 1, 2]
-- ##########################################################

-- Inner Join: Users and Travel Details[cite: 2]
SELECT U.Name, T.Destination, T.EstimatedCost 
FROM Users AS U 
INNER JOIN TravelDetails AS T ON U.UserID = T.UserID;

-- Nested Query: Hotels above average price[cite: 1]
SELECT Name, Price FROM Hotels WHERE Price > (SELECT AVG(Price) FROM Hotels);

-- Call Procedure[cite: 1]
CALL sp_GetTravelDetailsByUserID(1);
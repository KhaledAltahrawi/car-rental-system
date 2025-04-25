-- Drop tables if they exist to avoid conflicts
DROP TABLE RentalHistory CASCADE CONSTRAINTS;
DROP TABLE Rentals CASCADE CONSTRAINTS;
DROP TABLE Customers CASCADE CONSTRAINTS;
DROP TABLE Cars CASCADE CONSTRAINTS;
DROP TABLE Locations CASCADE CONSTRAINTS;
DROP TABLE CarTypes CASCADE CONSTRAINTS;

-- Create CarTypes Table
CREATE TABLE CarTypes (
    CarTypeID INT PRIMARY KEY,
    TypeName VARCHAR(50) NOT NULL
);

-- Example Data for CarTypes
INSERT INTO CarTypes (CarTypeID, TypeName) VALUES (1, 'Sedan');
INSERT INTO CarTypes (CarTypeID, TypeName) VALUES (2, 'SUV');
INSERT INTO CarTypes (CarTypeID, TypeName) VALUES (3, 'Truck');
INSERT INTO CarTypes (CarTypeID, TypeName) VALUES (4, 'Sports car');
INSERT INTO CarTypes (CarTypeID, TypeName) VALUES (5, 'Minivan');


-- Create Locations Table
CREATE TABLE Locations (
    LocationID INT PRIMARY KEY,
    LocationName VARCHAR(100) NOT NULL,
    Address VARCHAR(255) NOT NULL
);

-- Example Data for Locations
INSERT INTO Locations (LocationID, LocationName, Address) VALUES (1, 'Scarborough Town Centre', '300 Borough Dr, Scarborough, ON M1P 4P5, Canada');
INSERT INTO Locations (LocationID, LocationName, Address) VALUES (2, 'Rouge National Urban Park', '1749 Meadowvale Rd, Scarborough, ON M1B 5W8, Canada');
INSERT INTO Locations (LocationID, LocationName, Address) VALUES (3, 'Scarborough Bluffs', '1 Brimley Rd S, Scarborough, ON M1M 1C1, Canada');
INSERT INTO Locations (LocationID, LocationName, Address) VALUES (4, 'Toronto Zoo', '2000 Meadowvale Rd, Scarborough, ON M1B 5K7, Canada');
INSERT INTO Locations (LocationID, LocationName, Address) VALUES (5, 'Centennial College Progress Campus', '941 Progress Ave, Scarborough, ON M1G 3T8');

-- Create Cars Table
CREATE TABLE Cars (
    CarID INT PRIMARY KEY,
    Make VARCHAR(50) NOT NULL,
    Model VARCHAR(50) NOT NULL,
    Year INT NOT NULL,
    LicensePlate VARCHAR(20) NOT NULL,
    Status VARCHAR(20) NOT NULL,
    CarTypeID INT,
    FOREIGN KEY (CarTypeID) REFERENCES CarTypes(CarTypeID)
);

-- Example Data for Cars
INSERT INTO Cars (CarID, Make, Model, Year, LicensePlate, Status, CarTypeID) VALUES (1, 'Chevrolet', 'Tahoe', 2021, 'JKL3456', 'Available', 2);-- SUV
INSERT INTO Cars (CarID, Make, Model, Year, LicensePlate, Status, CarTypeID) VALUES (2, 'Nissan', 'Altima', 2020, 'MNO7890', 'Maintenance', 1);-- Sedan
INSERT INTO Cars (CarID, Make, Model, Year, LicensePlate, Status, CarTypeID) VALUES (3, 'Hyundai', 'Santa Fe', 2019, 'PQR1234', 'Available', 2);-- SUV
INSERT INTO Cars (CarID, Make, Model, Year, LicensePlate, Status, CarTypeID) VALUES (4, 'Volkswagen', 'Passat', 2018, 'STU5678', 'Rented', 1); -- Sedan
INSERT INTO Cars (CarID, Make, Model, Year, LicensePlate, Status, CarTypeID) VALUES (5, 'Toyota', 'Camry', 2020, 'ABC1234', 'Available', 1);   -- Sedan
INSERT INTO Cars (CarID, Make, Model, Year, LicensePlate, Status, CarTypeID) VALUES (6, 'Honda', 'Civic', 2019, 'DEF5678', 'Available', 1);    -- Sedan
INSERT INTO Cars (CarID, Make, Model, Year, LicensePlate, Status, CarTypeID) VALUES (7, 'Mazda', 'CX-5', 2020, 'YZA3456', 'Maintenance', 2);   -- SUV
INSERT INTO Cars (CarID, Make, Model, Year, LicensePlate, Status, CarTypeID) VALUES (8, 'Ford', 'F-150', 2020, 'EFG1234', 'Available', 3);    -- Truck
INSERT INTO Cars (CarID, Make, Model, Year, LicensePlate, Status, CarTypeID) VALUES (9, 'Ford', 'Escape', 2018, 'GHI9012', 'Rented', 2);       -- SUV
INSERT INTO Cars (CarID, Make, Model, Year, LicensePlate, Status, CarTypeID) VALUES (10, 'Chevrolet', 'Camaro', 2019, 'WXY5678', 'Rented', 4); -- Sports car
INSERT INTO Cars (CarID, Make, Model, Year, LicensePlate, Status, CarTypeID) VALUES (11, 'Chevrolet', 'Silverado', 2019, 'HIJ5678', 'Rented', 3);-- Truck
INSERT INTO Cars (CarID, Make, Model, Year, LicensePlate, Status, CarTypeID) VALUES (12, 'Subaru', 'Forester', 2019, 'BCD7890', 'Available', 2);-- SUV
INSERT INTO Cars (CarID, Make, Model, Year, LicensePlate, Status, CarTypeID) VALUES (13, 'Kia', 'Sorento', 2021, 'VWX9012', 'Available', 2);    -- SUV
INSERT INTO Cars (CarID, Make, Model, Year, LicensePlate, Status, CarTypeID) VALUES (14, 'BMW', '3 Series', 2021, 'KLM9012', 'Available', 1);  -- Sedan
INSERT INTO Cars (CarID, Make, Model, Year, LicensePlate, Status, CarTypeID) VALUES (15, 'Audi', 'A4', 2020, 'NOP3456', 'Maintenance', 1);     -- Sedan
INSERT INTO Cars (CarID, Make, Model, Year, LicensePlate, Status, CarTypeID) VALUES (16, 'Mercedes-Benz', 'C-Class', 2018, 'QRS7890', 'Available', 1);-- Sedan
INSERT INTO Cars (CarID, Make, Model, Year, LicensePlate, Status, CarTypeID) VALUES (17, 'Honda', 'Odyssey', 2019, 'FGH7890', 'Available', 5); -- Minivan
INSERT INTO Cars (CarID, Make, Model, Year, LicensePlate, Status, CarTypeID) VALUES (18, 'Porsche', '911', 2021, 'TUV1234', 'Available', 4);   -- Sports car
INSERT INTO Cars (CarID, Make, Model, Year, LicensePlate, Status, CarTypeID) VALUES (19, 'Dodge', 'Challenger', 2020, 'ZAB9012', 'Maintenance', 4);-- Sports car
INSERT INTO Cars (CarID, Make, Model, Year, LicensePlate, Status, CarTypeID) VALUES (20, 'Toyota', 'Sienna', 2021, 'CDE3456', 'Available', 5); -- Minivan

-- Create Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Phone VARCHAR(20) NOT NULL,
    DriverLicense VARCHAR(20) NOT NULL
);

-- Example Data for Customers

INSERT INTO Customers (CustomerID, Name, Email, Phone, DriverLicense) VALUES (1, 'ZNSConsulting', 'info@znstech.com', '647-123-4567', 'D9876543');
INSERT INTO Customers (CustomerID, Name, Email, Phone, DriverLicense) VALUES (2, 'Bishal Sharma', 'bishal.sharma@example.com', '647-234-5678', 'N8765432');  
INSERT INTO Customers (CustomerID, Name, Email, Phone, DriverLicense) VALUES (3, 'Li Wei', 'li.wei@example.com', '647-345-6789', 'C7654321');                
INSERT INTO Customers (CustomerID, Name, Email, Phone, DriverLicense) VALUES (4, 'Ahmad Al-Masri', 'ahmad.almasri@example.com', '647-456-7890', 'J6543210'); 
INSERT INTO Customers (CustomerID, Name, Email, Phone, DriverLicense) VALUES (5, 'Olena Ivanova', 'olena.ivanova@example.com', '647-567-8901', 'U5432109');  
INSERT INTO Customers (CustomerID, Name, Email, Phone, DriverLicense) VALUES (6, 'Sunil Thapa', 'sunil.thapa@example.com', '647-678-9012', 'N4321098');      
INSERT INTO Customers (CustomerID, Name, Email, Phone, DriverLicense) VALUES (7, 'Wang Fang', 'wang.fang@example.com', '647-789-0123', 'C3210987');          
INSERT INTO Customers (CustomerID, Name, Email, Phone, DriverLicense) VALUES (8, 'Yara Qasem', 'yara.qasem@example.com', '647-890-1234', 'J2109876');        
INSERT INTO Customers (CustomerID, Name, Email, Phone, DriverLicense) VALUES (9, 'Taras Shevchenko', 'taras.shevchenko@example.com', '647-901-2345', 'U1098765'); 
INSERT INTO Customers (CustomerID, Name, Email, Phone, DriverLicense) VALUES (10, 'James Smith', 'james.smith@example.com', '647-012-3456', 'D0987654');




-- Create Rentals Table
CREATE TABLE Rentals (
    RentalID INT PRIMARY KEY,
    CustomerID INT,
    CarID INT,
    RentalDate DATE NOT NULL,
    ReturnDate DATE NOT NULL,
    TotalCost DECIMAL(10, 2) NOT NULL,
    LocationID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (CarID) REFERENCES Cars(CarID),
    FOREIGN KEY (LocationID) REFERENCES Locations(LocationID)
);

-- Example Data for Rentals
INSERT INTO Rentals (RentalID, CustomerID, CarID, RentalDate, ReturnDate, TotalCost, LocationID) 
VALUES (1, 1, 1, TO_DATE('2024-07-01', 'YYYY-MM-DD'), TO_DATE('2024-07-07', 'YYYY-MM-DD'), 300.00, 1);
INSERT INTO Rentals (RentalID, CustomerID, CarID, RentalDate, ReturnDate, TotalCost, LocationID) 
VALUES (2, 8, 2, TO_DATE('2024-07-08', 'YYYY-MM-DD'), TO_DATE('2024-07-15', 'YYYY-MM-DD'), 360.00, 1);
INSERT INTO Rentals (RentalID, CustomerID, CarID, RentalDate, ReturnDate, TotalCost, LocationID) 
VALUES (3, 9, 3, TO_DATE('2024-07-09', 'YYYY-MM-DD'), TO_DATE('2024-07-16', 'YYYY-MM-DD'), 320.00, 1);
INSERT INTO Rentals (RentalID, CustomerID, CarID, RentalDate, ReturnDate, TotalCost, LocationID) 
VALUES (4, 10, 4, TO_DATE('2024-07-12', 'YYYY-MM-DD'), TO_DATE('2024-07-19', 'YYYY-MM-DD'), 400.00, 2);
INSERT INTO Rentals (RentalID, CustomerID, CarID, RentalDate, ReturnDate, TotalCost, LocationID) 
VALUES (5, 3, 5, TO_DATE('2024-07-13', 'YYYY-MM-DD'), TO_DATE('2024-07-20', 'YYYY-MM-DD'), 350.00, 2);
INSERT INTO Rentals (RentalID, CustomerID, CarID, RentalDate, ReturnDate, TotalCost, LocationID) 
VALUES (6, 4, 6, TO_DATE('2024-07-14', 'YYYY-MM-DD'), TO_DATE('2024-07-21', 'YYYY-MM-DD'), 380.00, 2);
INSERT INTO Rentals (RentalID, CustomerID, CarID, RentalDate, ReturnDate, TotalCost, LocationID) 
VALUES (7, 7, 7, TO_DATE('2024-07-17', 'YYYY-MM-DD'), TO_DATE('2024-07-24', 'YYYY-MM-DD'), 450.00, 3);
INSERT INTO Rentals (RentalID, CustomerID, CarID, RentalDate, ReturnDate, TotalCost, LocationID) 
VALUES (8, 2, 8, TO_DATE('2024-07-18', 'YYYY-MM-DD'), TO_DATE('2024-07-25', 'YYYY-MM-DD'), 410.00, 3);
INSERT INTO Rentals (RentalID, CustomerID, CarID, RentalDate, ReturnDate, TotalCost, LocationID) 
VALUES (9, 5, 9, TO_DATE('2024-07-19', 'YYYY-MM-DD'), TO_DATE('2024-07-26', 'YYYY-MM-DD'), 430.00, 3);
INSERT INTO Rentals (RentalID, CustomerID, CarID, RentalDate, ReturnDate, TotalCost, LocationID) 
VALUES (10, 6, 10, TO_DATE('2024-07-22', 'YYYY-MM-DD'), TO_DATE('2024-07-29', 'YYYY-MM-DD'), 380.00, 4);
INSERT INTO Rentals (RentalID, CustomerID, CarID, RentalDate, ReturnDate, TotalCost, LocationID) 
VALUES (11, 7, 11, TO_DATE('2024-07-23', 'YYYY-MM-DD'), TO_DATE('2024-07-30', 'YYYY-MM-DD'), 390.00, 4);
INSERT INTO Rentals (RentalID, CustomerID, CarID, RentalDate, ReturnDate, TotalCost, LocationID) 
VALUES (12, 6, 12, TO_DATE('2024-07-24', 'YYYY-MM-DD'), TO_DATE('2024-07-31', 'YYYY-MM-DD'), 400.00, 4);
INSERT INTO Rentals (RentalID, CustomerID, CarID, RentalDate, ReturnDate, TotalCost, LocationID) 
VALUES (13, 5, 13, TO_DATE('2024-07-27', 'YYYY-MM-DD'), TO_DATE('2024-08-03', 'YYYY-MM-DD'), 430.00, 5);
INSERT INTO Rentals (RentalID, CustomerID, CarID, RentalDate, ReturnDate, TotalCost, LocationID) 
VALUES (14, 4, 14, TO_DATE('2024-07-28', 'YYYY-MM-DD'), TO_DATE('2024-08-04', 'YYYY-MM-DD'), 440.00, 5);
INSERT INTO Rentals (RentalID, CustomerID, CarID, RentalDate, ReturnDate, TotalCost, LocationID) 
VALUES (15, 2, 18, TO_DATE('2024-07-29', 'YYYY-MM-DD'), TO_DATE('2024-08-05', 'YYYY-MM-DD'), 450.00, 5);



-- Create RentalHistory Table
CREATE TABLE RentalHistory (
    HistoryID INT PRIMARY KEY,
    RentalID INT,
    CustomerID INT,
    CarID INT,
    RentalDate DATE NOT NULL,
    ReturnDate DATE NOT NULL,
    TotalCost DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (RentalID) REFERENCES Rentals(RentalID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (CarID) REFERENCES Cars(CarID)
);

-- Example Data for RentalHistory
INSERT INTO RentalHistory (HistoryID, RentalID, CustomerID, CarID, RentalDate, ReturnDate, TotalCost) 
VALUES (1, 1, 1, 1, TO_DATE('2024-07-01', 'YYYY-MM-DD'), TO_DATE('2024-07-07', 'YYYY-MM-DD'), 300.00);

INSERT INTO RentalHistory (HistoryID, RentalID, CustomerID, CarID, RentalDate, ReturnDate, TotalCost) 
VALUES (2, 2, 2, 2, TO_DATE('2024-07-01', 'YYYY-MM-DD'), TO_DATE('2024-07-07', 'YYYY-MM-DD'), 230.00);

INSERT INTO RentalHistory (HistoryID, RentalID, CustomerID, CarID, RentalDate, ReturnDate, TotalCost) 
VALUES (3, 3, 3, 3, TO_DATE('2024-07-01', 'YYYY-MM-DD'), TO_DATE('2024-07-07', 'YYYY-MM-DD'), 280.00);

INSERT INTO RentalHistory (HistoryID, RentalID, CustomerID, CarID, RentalDate, ReturnDate, TotalCost) 
VALUES (4, 4, 4, 4, TO_DATE('2024-07-01', 'YYYY-MM-DD'), TO_DATE('2024-07-07', 'YYYY-MM-DD'), 320.00);

INSERT INTO RentalHistory (HistoryID, RentalID, CustomerID, CarID, RentalDate, ReturnDate, TotalCost) 
VALUES (5, 5, 5, 5, TO_DATE('2024-07-01', 'YYYY-MM-DD'), TO_DATE('2024-07-07', 'YYYY-MM-DD'), 370.00);

INSERT INTO RentalHistory (HistoryID, RentalID, CustomerID, CarID, RentalDate, ReturnDate, TotalCost) 
VALUES (6, 6, 6, 6, TO_DATE('2024-07-01', 'YYYY-MM-DD'), TO_DATE('2024-07-07', 'YYYY-MM-DD'), 350.00);

INSERT INTO RentalHistory (HistoryID, RentalID, CustomerID, CarID, RentalDate, ReturnDate, TotalCost) 
VALUES (7, 7, 7, 7, TO_DATE('2024-07-01', 'YYYY-MM-DD'), TO_DATE('2024-07-07', 'YYYY-MM-DD'), 310.00);

INSERT INTO RentalHistory (HistoryID, RentalID, CustomerID, CarID, RentalDate, ReturnDate, TotalCost) 
VALUES (8, 8, 8, 8, TO_DATE('2024-07-01', 'YYYY-MM-DD'), TO_DATE('2024-07-07', 'YYYY-MM-DD'), 360.00);

INSERT INTO RentalHistory (HistoryID, RentalID, CustomerID, CarID, RentalDate, ReturnDate, TotalCost) 
VALUES (9, 9, 9, 9, TO_DATE('2024-07-01', 'YYYY-MM-DD'), TO_DATE('2024-07-07', 'YYYY-MM-DD'), 290.00);

INSERT INTO RentalHistory (HistoryID, RentalID, CustomerID, CarID, RentalDate, ReturnDate, TotalCost) 
VALUES (10, 10, 10, 10, TO_DATE('2024-07-01', 'YYYY-MM-DD'), TO_DATE('2024-07-07', 'YYYY-MM-DD'), 300.00);










-- Drop the sequence if it exists
DROP SEQUENCE car_id_sequence;

-- Determine the current maximum CarID
DECLARE
    max_car_id NUMBER;
BEGIN
    SELECT MAX(CarID) INTO max_car_id FROM Cars;

    -- Create the sequence starting from max_car_id + 1
    EXECUTE IMMEDIATE 'CREATE SEQUENCE car_id_sequence START WITH ' || (max_car_id + 1) || ' INCREMENT BY 1';
END;
/



-- Insert sample data using the sequence
INSERT INTO Cars (CarID, Make, Model, Year, LicensePlate, Status, CarTypeID)
VALUES (car_id_sequence.NEXTVAL, 'Chevrolet', 'Impala', 2019, 'DDD888', 'Available', 1);

-- use this sequence for updating

DECLARE
    current_car_id NUMBER;
BEGIN
    SELECT car_id_sequence.CURRVAL INTO current_car_id FROM dual;

    -- Update the Status of the car using the current value of the sequence
    UPDATE Cars
    SET Status = 'Maintenance'
    WHERE CarID = current_car_id;
END;
/


-- Drop the sequence if it exists
DROP SEQUENCE rental_id_seq;

-- Determine the current maximum RentalID
DECLARE
    max_rental_id NUMBER;
BEGIN
    SELECT MAX(RentalID) INTO max_rental_id FROM Rentals;

    -- Create the sequence starting from max_car_id + 1
    EXECUTE IMMEDIATE 'CREATE SEQUENCE rental_id_seq START WITH ' || (max_rental_id + 1) || ' INCREMENT BY 1';
END;
/




-- Drop indexes if they exist
DROP INDEX idx_customers_email;
DROP INDEX idx_customers_phone;
DROP INDEX idx_cars_licenseplate;
DROP INDEX idx_cars_status;

-- Create an index on the Email column of the Customers table
CREATE INDEX idx_customers_email
ON Customers (Email);

-- Create an index on the Phone column of the Customers table
CREATE INDEX idx_customers_phone
ON Customers (Phone);

-- Create an index on the LicensePlate column of the Cars table
CREATE INDEX idx_cars_licenseplate
ON Cars (LicensePlate);

-- Create an index on the Status column of the Cars table
CREATE INDEX idx_cars_status
ON Cars (Status);






-- Drop the triggers if it exists
BEGIN
    EXECUTE IMMEDIATE 'DROP TRIGGER trg_before_insert_rentals';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -4080 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TRIGGER trg_after_delete_rentals';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -4080 THEN
            RAISE;
        END IF;
END;
/

-- Trigger 1: Before Insert Trigger on Rentals Table
CREATE OR REPLACE TRIGGER trg_before_insert_rentals
BEFORE INSERT ON Rentals
FOR EACH ROW
BEGIN
    -- Update the status of the car to 'Rented'
    UPDATE Cars
    SET Status = 'Rented'
    WHERE CarID = :NEW.CarID;
END;
/

-- Trigger 2: After delete Trigger on Rentals Table
CREATE OR REPLACE TRIGGER trg_after_delete_rentals
AFTER DELETE ON Rentals
FOR EACH ROW
BEGIN
    -- Set the car status back to 'Available' when a rental record is deleted
    UPDATE Cars
    SET Status = 'Available'
    WHERE CarID = :OLD.CarID;
END;
/








-- Drop the procedure if it exists
BEGIN
    EXECUTE IMMEDIATE 'DROP PROCEDURE AddNewRental';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -4043 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP PROCEDURE CompleteRental';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -4043 THEN
            RAISE;
        END IF;
END;
/




-- Procedure 1: Add New Rental
CREATE OR REPLACE PROCEDURE AddNewRental (
    p_customerID IN Rentals.CustomerID%TYPE,
    p_carID IN Rentals.CarID%TYPE,
    p_rentalDate IN Rentals.RentalDate%TYPE,
    p_returnDate IN Rentals.ReturnDate%TYPE,
    p_totalCost IN Rentals.TotalCost%TYPE,
    p_locationID IN Rentals.LocationID%TYPE
) IS
BEGIN
    -- Insert a new rental record
    INSERT INTO Rentals (RentalID, CustomerID, CarID, RentalDate, ReturnDate, TotalCost, LocationID)
    VALUES (rental_id_seq.NEXTVAL, p_customerID, p_carID, p_rentalDate, p_returnDate, p_totalCost, p_locationID);

    DBMS_OUTPUT.PUT_LINE('New rental added.');

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END AddNewRental;
/
SHOW ERRORS;







-- Procedure 2: List Rentals for a Customer

CREATE OR REPLACE PROCEDURE ListRentalsForCustomer (
    p_customerID IN Rentals.CustomerID%TYPE
) IS
    CURSOR rental_cursor IS
        SELECT r.RentalID, r.RentalDate, r.ReturnDate, r.TotalCost, c.CarID, c.Model, c.Status
        FROM Rentals r
        JOIN Cars c ON r.CarID = c.CarID
        WHERE r.CustomerID = p_customerID AND r.ReturnDate IS NULL;
        
    v_rentalID Rentals.RentalID%TYPE;
    v_rentalDate Rentals.RentalDate%TYPE;
    v_returnDate Rentals.ReturnDate%TYPE;
    v_totalCost Rentals.TotalCost%TYPE;
    v_carID Cars.CarID%TYPE;
    v_carModel Cars.Model%TYPE;
    v_carStatus Cars.Status%TYPE;
BEGIN
    OPEN rental_cursor;

    LOOP
        FETCH rental_cursor INTO v_rentalID, v_rentalDate, v_returnDate, v_totalCost, v_carID, v_carModel, v_carStatus;
        
        EXIT WHEN rental_cursor%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Rental ID: ' || v_rentalID || 
                             ', Rental Date: ' || v_rentalDate ||
                             ', Return Date: ' || v_returnDate ||
                             ', Total Cost: ' || v_totalCost ||
                             ', Car ID: ' || v_carID ||
                             ', Car Model: ' || v_carModel ||
                             ', Car Status: ' || v_carStatus);
    END LOOP;

    CLOSE rental_cursor;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END ListRentalsForCustomer;
/





-- Drop existing functions if they exist
BEGIN
    EXECUTE IMMEDIATE 'DROP FUNCTION CalculateRentalCost';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -4043 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP FUNCTION GetCarStatus';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -4043 THEN
            RAISE;
        END IF;
END;
/

-- Function 1: Calculate Rental Cost
CREATE OR REPLACE FUNCTION CalculateRentalCost (
    p_rentalDate IN DATE,
    p_returnDate IN DATE,
    p_dailyRate IN NUMBER
) RETURN NUMBER IS
    v_totalCost NUMBER;
BEGIN
    v_totalCost := (p_returnDate - p_rentalDate) * p_dailyRate;
    RETURN v_totalCost;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        RETURN NULL;
END CalculateRentalCost;
/
SHOW ERRORS;

-- Function 2: Get Car Status
CREATE OR REPLACE FUNCTION GetCarStatus (
    p_carID IN Cars.CarID%TYPE
) RETURN VARCHAR2 IS
    v_status VARCHAR2(20);
BEGIN
    SELECT Status INTO v_status
    FROM Cars
    WHERE CarID = p_carID;
    RETURN v_status;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: No car found with the given CarID');
        RETURN 'Unknown';
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        RETURN 'Error';
END GetCarStatus;
/
SHOW ERRORS;









-- Drop existing package if it exists
BEGIN
    EXECUTE IMMEDIATE 'DROP PACKAGE CarRentalPackage';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -4043 THEN
            RAISE;
        END IF;
END;
/

-- Package Specification
CREATE OR REPLACE PACKAGE CarRentalPackage AS
    -- Global variable
    g_daily_rate NUMBER := 50;

    -- Type definition for CarRecord
    TYPE CarRecord IS RECORD (
        CarID Cars.CarID%TYPE,
        Make Cars.Make%TYPE,
        Model Cars.Model%TYPE,
        Year Cars.Year%TYPE,
        Status Cars.Status%TYPE
    );

    -- Procedure declarations
    PROCEDURE AddNewRental (
        p_customerID IN Rentals.CustomerID%TYPE,
        p_carID IN Rentals.CarID%TYPE,
        p_rentalDate IN Rentals.RentalDate%TYPE,
        p_returnDate IN Rentals.ReturnDate%TYPE,
        p_totalCost IN Rentals.TotalCost%TYPE,
        p_locationID IN Rentals.LocationID%TYPE
    );


       PROCEDURE ListRentalsForCustomer (
     p_customerID IN Rentals.CustomerID%TYPE
    );




    -- Function declarations
    FUNCTION CalculateRentalCost (
        p_rentalDate IN DATE,
        p_returnDate IN DATE
    ) RETURN NUMBER;

    FUNCTION GetCarStatus (
        p_carID IN Cars.CarID%TYPE
    ) RETURN VARCHAR2;
    
    -- Private variable (not accessible outside the package)
    v_private_variable NUMBER := 100;

END CarRentalPackage;
/
SHOW ERRORS;




-- Package Body
CREATE OR REPLACE PACKAGE BODY CarRentalPackage AS

    -- Procedure AddNewRental

    PROCEDURE AddNewRental (
    p_customerID IN Rentals.CustomerID%TYPE,
    p_carID IN Rentals.CarID%TYPE,
    p_rentalDate IN Rentals.RentalDate%TYPE,
    p_returnDate IN Rentals.ReturnDate%TYPE,
    p_totalCost IN Rentals.TotalCost%TYPE,
    p_locationID IN Rentals.LocationID%TYPE
) IS
BEGIN
    -- Insert a new rental record
    INSERT INTO Rentals (RentalID, CustomerID, CarID, RentalDate, ReturnDate, TotalCost, LocationID)
    VALUES (rental_id_seq.NEXTVAL, p_customerID, p_carID, p_rentalDate, p_returnDate, p_totalCost, p_locationID);

    DBMS_OUTPUT.PUT_LINE('New rental added.');

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END AddNewRental;


    -- Procedure ListRentalsForCustomer


    PROCEDURE ListRentalsForCustomer (
    p_customerID IN Rentals.CustomerID%TYPE
) IS
    CURSOR rental_cursor IS
        SELECT r.RentalID, r.RentalDate, r.ReturnDate, r.TotalCost, c.CarID, c.Model, c.Status
        FROM Rentals r
        JOIN Cars c ON r.CarID = c.CarID
        WHERE r.CustomerID = p_customerID AND r.ReturnDate IS NULL;
        
    v_rentalID Rentals.RentalID%TYPE;
    v_rentalDate Rentals.RentalDate%TYPE;
    v_returnDate Rentals.ReturnDate%TYPE;
    v_totalCost Rentals.TotalCost%TYPE;
    v_carID Cars.CarID%TYPE;
    v_carModel Cars.Model%TYPE;
    v_carStatus Cars.Status%TYPE;
BEGIN
    OPEN rental_cursor;

    LOOP
        FETCH rental_cursor INTO v_rentalID, v_rentalDate, v_returnDate, v_totalCost, v_carID, v_carModel, v_carStatus;
        
        EXIT WHEN rental_cursor%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Rental ID: ' || v_rentalID || 
                             ', Rental Date: ' || v_rentalDate ||
                             ', Return Date: ' || v_returnDate ||
                             ', Total Cost: ' || v_totalCost ||
                             ', Car ID: ' || v_carID ||
                             ', Car Model: ' || v_carModel ||
                             ', Car Status: ' || v_carStatus);
    END LOOP;

    CLOSE rental_cursor;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END ListRentalsForCustomer;



    -- Function CalculateRentalCost
    FUNCTION CalculateRentalCost (
        p_rentalDate IN DATE,
        p_returnDate IN DATE
    ) RETURN NUMBER IS
        v_totalCost NUMBER;
    BEGIN
        v_totalCost := (p_returnDate - p_rentalDate) * g_daily_rate;
        RETURN v_totalCost;

    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
            RETURN NULL;
    END CalculateRentalCost;

    -- Function GetCarStatus
    FUNCTION GetCarStatus (
        p_carID IN Cars.CarID%TYPE
    ) RETURN VARCHAR2 IS
        v_status VARCHAR2(20);
    BEGIN
        SELECT Status INTO v_status
        FROM Cars
        WHERE CarID = p_carID;
        RETURN v_status;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Error: No car found with the given CarID');
            RETURN 'Unknown';
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
            RETURN 'Error';
    END GetCarStatus;

END CarRentalPackage;
/
SHOW ERRORS;


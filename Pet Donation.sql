-- Create the database
CREATE DATABASE Donors;
USE Donors;

-- Create the DonorsList table
CREATE TABLE DonorsList (
    DonorID INT PRIMARY KEY,
    AddressID INT,
    Address VARCHAR(255),
    Donor_first_name VARCHAR(50),
    Donor_last_name VARCHAR(50),
    Date DATE,
    Time TIME,
    Amount DECIMAL(10, 1),
    Type VARCHAR(50),
    VolunteerID INT
);

-- Create the DonorsAddress table
CREATE TABLE DonorsAddress (
    AddressID INT PRIMARY KEY,
    Unit_num VARCHAR(10),
    Street_num VARCHAR(10),
    Street_name VARCHAR(50),
    Street_type VARCHAR(20),
    Street_direction VARCHAR(10),
    Postal_code VARCHAR(10),
    City VARCHAR(50),
    Province VARCHAR(50)
);

-- Create the Volunteer table
CREATE TABLE Volunteer (
    VolunteerID INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Group_leaderID VARCHAR(10)
);

-- Create the GroupLeader table
CREATE TABLE GroupLeader (
    Group_leaderID VARCHAR PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    VolunteerID INT
);

-- Select DonorsList table
SELECT * FROM DonorsList

-- Check the average value of the donation
SELECT AVG(Amount) AS AveAmount FROM DonorsList 

-- 1. Average donation amount by day, month and year
SELECT
    DATEPART(year, Date) AS Year,
    DATEPART(month, Date) AS Month,
    DATEPART(day, Date) AS Day,
    AVG(Amount) AS AverageAmount,
	SUM(Amount) AS TotalAmount
FROM DonorsList
GROUP BY
    DATEPART(year, Date),
    DATEPART(month, Date),
    DATEPART(day, Date)
ORDER BY Year, Month, Day;

-- Make a new table as AverageDonation
SELECT
    DATEPART(year, Date) AS Year,
    DATEPART(month, Date) AS Month,
    DATEPART(day, Date) AS Day,
    AVG(Amount) AS AverageAmount,
	SUM(Amount) AS TotalAmount
INTO DonationAmount
FROM DonorsList
GROUP BY
    DATEPART(year, Date),
    DATEPART(month, Date),
    DATEPART(day, Date);

-- Check the new table
SELECT * FROM DonationAmount

-- Agregate average and total donation by year
SELECT Year, AVG(AverageAmount) AS AveAmount, SUM(TotalAmount) AS TotAmount
From DonationAmount
Group by Year;

-- Agregate average and total donation by month
SELECT Month, AVG(AverageAmount) AS AveAmount, SUM(TotalAmount) AS TotAmount
From DonationAmount
Group by Month;

-- 2. Check DonorsAddress and DonorsList table
SELECT * FROM DonorsAddress;
SELECT * FROM DonorsList;

-- Check the name of the city
SELECT City FROM DonorsAddress
Group by City

-- Check how many months are listed in the table
SELECT Year, Month FROM DonationAmount
Group by Year, Month

-- Variables for flexibility
DECLARE @City NVARCHAR(50) = 'Mississauga'; -- replace with your desired city
DECLARE @Month INT = 1; -- replace with your desired month (e.g., 12 for December)
DECLARE @Year INT = 2024; -- replace with your desired year

-- Query to calculate average and sum of donations by postal code and city for a specific month
SELECT 
    DA.Postal_code,
    DA.City,
    DATEPART(year, DL.Date) AS Year,
    DATEPART(month, DL.Date) AS Month,
    AVG(DL.Amount) AS AverageDonation,
    SUM(DL.Amount) AS TotalDonation
FROM 
    DonorsList DL
JOIN 
    DonorsAddress DA ON DL.AddressID = DA.AddressID
WHERE 
    DA.City = @City
    AND DATEPART(month, DL.Date) = @Month
    AND DATEPART(year, DL.Date) = @Year
GROUP BY 
    DA.Postal_code, 
    DA.City,
    DATEPART(year, DL.Date),
    DATEPART(month, DL.Date)
ORDER BY 
    Year, 
    Month;

-- 3. Check DonorsList table
SELECT * FROM DonorsList

-- Replace "Credit" with 'Credit Card'
UPDATE DonorsList
SET Type = 'Credit Card'
WHERE Type = 'Credit';

-- Replace "Check" with 'Cheque'
UPDATE DonorsList
SET Type = 'Cheque'
WHERE Type = 'Check';

-- Remove extraneous space 
UPDATE DonorsList
SET Type = LTRIM(RTRIM(Type))

-- Donation collected per payment method from the city with highest value
SELECT MAX(DL.Amount) As TopDonation, DL.Type, DA.City
From DonorsList DL
JOIN DonorsAddress DA ON DL.AddressID = DA.AddressID
GROUP BY DL.Type, DA.City
ORDER BY DA.City, TopDonation DESC;



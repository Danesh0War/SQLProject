----CREATION SCRIPT

--Firstly run CREATE DATABASE [Nadlan] separatly and only then CREATE TABLE commands
CREATE DATABASE [Nadlan]; 

--Run after CREATE DATABASE command
USE Nadlan;

CREATE TABLE Cities
(
 CityID INT Primary Key Identity (1,1),
 CityName NVARCHAR (30) NOT NULL Unique, --No 2 same sities in DB. Insures 1:N Policy
);

CREATE TABLE Neighborhoods
(
NeighborhoodID INT Primary Key Identity (1,1),

NeighborhoodName NVARCHAR (50) NOT NULL,

CityID INT References Cities (CityID), 
UNIQUE (NeighborhoodName, CityID), --Make sure the couple NeighborhoodName-CityID is unique. Insures 1:N Policy
);


CREATE TABLE HouseType
(
HouseTypeID INT PRIMARY KEY IDENTITY(1,1),

HouseTypeName NVARCHAR(100) NOT NULL UNIQUE, -- No 2 same HouseTypes in the DB. Insures 1:N Policy
Description NVARCHAR(500)
);



CREATE TABLE Salesmen
(
 SalesmanID CHAR (9) Primary Key, --ID Validation should be done in the code by running on string length and counting sum

 FirstName NVARCHAR(20) NOT NULL,
 LastName NVARCHAR(20) NOT NULL,
 Email VARCHAR(100), --VARCHAR Would save the exact data length compared to fixed CHAR
 Phone VARCHAR(15),
 BirthDate datetime,
 HireDate datetime,
 Salary DECIMAL(10, 2),

 SpecializedHouseType INT References HouseType(HouseTypeID)
 );

 
 CREATE TABLE Customers
 (
  CustomerID CHAR (9) Primary Key,  --ID Validation should be done in the code by running on string length and counting sum
  FirstName NVARCHAR(20) NOT NULL,
  LastName NVARCHAR(20) NOT NULL,
  Email VARCHAR(100), --VARCHAR Would save the exact data length compared to fixed CHAR
  Phone VARCHAR(15),
  BirthDate datetime,
  --IsOwner BIT default 0, --Usefull for distinguishing between the customer types 
  --IsBuyer BIT default 0,

 );


CREATE TABLE HousesForSale
(
HouseID INT Primary Key Identity (1,1),

Adress NVARCHAR(80) NOT NULL,
RequestedHousePrice INT CHECK (RequestedHousePrice > 0), --For Millions we do not mess with floating part
BuildDate date, -- Don't care about specific day
HouseSquareMeters FLOAT,
NumberOfRooms INT,
--Optional house facilities
Terrace BIT,
PrivateParkingZone BIT,
Elevator BIT,
SecureSpace BIT,
Describtion NVARCHAR(1000),

NeighborhoodID INT References Neighborhoods(NeighborhoodID),
HouseTypeID INT References HouseType (HouseTypeID),
OwnerID CHAR(9) REFERENCES Customers(CustomerID),

);


CREATE TABLE Sales -- In contrast to ERD, decided to make sale as entity and not as ternary relation so we can keep actual sale price (usefull in general and for this task especially) 
(
    SaleID INT PRIMARY KEY IDENTITY(1,1),
	ActualHousePrice INT Check (ActualHousePrice> 0) NOT NULL,
    SaleDate DATETIME DEFAULT GETDATE(),

    HouseID INT REFERENCES HousesForSale(HouseID),
	--OwnerID
    BuyerID Char(9) REFERENCES Customers(CustomerID),
    SalesmanID Char(9) REFERENCES Salesmen(SalesmanID),
);






----INSERT SCRIPT

use Nadlan

--Cities:

INSERT INTO Cities (CityName) VALUES ('Tel Aviv');
INSERT INTO Cities (CityName) VALUES ('Jerusalem');
INSERT INTO Cities (CityName) VALUES ('Haifa');
INSERT INTO Cities (CityName) VALUES ('Beersheba');
INSERT INTO Cities (CityName) VALUES ('Ramat Gan');
INSERT INTO Cities (CityName) VALUES ('Kfar Saba');
INSERT INTO Cities (CityName) VALUES ('Bat Yam');
INSERT INTO Cities (CityName) VALUES ('Bnei Brak');
INSERT INTO Cities (CityName) VALUES ('Herzliya');
INSERT INTO Cities (CityName) VALUES ('Petah Tikva');
INSERT INTO Cities (CityName) VALUES ('Rishon LeZion');
INSERT INTO Cities (CityName) VALUES ('Rehovot');
INSERT INTO Cities (CityName) VALUES ('Ashdod');
INSERT INTO Cities (CityName) VALUES ('Netanya');
INSERT INTO Cities (CityName) VALUES ('Holon');
INSERT INTO Cities (CityName) VALUES ('Nahariya');

--Neighborhoods:

-- For Tel Aviv
INSERT INTO Neighborhoods (NeighborhoodName, CityID) VALUES ('Kohav Hatsafon', 1);
INSERT INTO Neighborhoods (NeighborhoodName, CityID) VALUES ('Shapira', 1);
INSERT INTO Neighborhoods (NeighborhoodName, CityID) VALUES ('Florentin', 1);

-- For Jerusalem
INSERT INTO Neighborhoods (NeighborhoodName, CityID) VALUES ('Old City', 2);
INSERT INTO Neighborhoods (NeighborhoodName, CityID) VALUES ('Ein Kerem', 2);
INSERT INTO Neighborhoods (NeighborhoodName, CityID) VALUES ('Katamon', 2);
INSERT INTO Neighborhoods (NeighborhoodName, CityID) VALUES ('Shmuel HaNavi', 2);


-- For Haifa
INSERT INTO Neighborhoods (NeighborhoodName, CityID) VALUES ('Ramat Hanasi', 3);
INSERT INTO Neighborhoods (NeighborhoodName, CityID) VALUES ('Bat Galim', 3);
INSERT INTO Neighborhoods (NeighborhoodName, CityID) VALUES ('Hadar HaCarmel', 3);


-- For Beersheba
INSERT INTO Neighborhoods (NeighborhoodName, CityID) VALUES ('Old City', 4);
INSERT INTO Neighborhoods (NeighborhoodName, CityID) VALUES ('Shchuna D', 4);


--For Herzliya
INSERT INTO Neighborhoods (NeighborhoodName, CityID) VALUES ('Herzliya Pituach', 9);
INSERT INTO Neighborhoods (NeighborhoodName, CityID) VALUES ('Neve Amal', 9);

-- For Rishon LeZion
INSERT INTO Neighborhoods (NeighborhoodName, CityID) VALUES ('Nahlat Yehuda', 11);
INSERT INTO Neighborhoods (NeighborhoodName, CityID) VALUES ('Neve Hilel', 11);

-- For Ashdod
INSERT INTO Neighborhoods (NeighborhoodName, CityID) VALUES ('Marina', 13);
INSERT INTO Neighborhoods (NeighborhoodName, CityID) VALUES ('Rova Alef', 13);


-- For Nahariya
INSERT INTO Neighborhoods (NeighborhoodName, CityID) VALUES ('Gaaton', 16);
INSERT INTO Neighborhoods (NeighborhoodName, CityID) VALUES ('Tsfoni', 16);


select *
from Cities join Neighborhoods on Cities.CityID = Neighborhoods.CityID
order by Cities.CityID, NeighborhoodID

-- HouseTypes:

INSERT INTO HouseType (HouseTypeName, Description) VALUES ('Villa', 'A large, detached structure with spacious land.');
INSERT INTO HouseType (HouseTypeName, Description) VALUES ('Apartment', 'A single unit in a multi-unit building.');
INSERT INTO HouseType (HouseTypeName, Description) VALUES ('Penthouse', 'An apartment on the highest floor of an apartment building.');
INSERT INTO HouseType (HouseTypeName, Description) VALUES ('Townhouse', 'A terraced or semi-detached dwelling.');
INSERT INTO HouseType (HouseTypeName, Description) VALUES ('Studio', 'A small apartment which combines living room, bedroom, and kitchen into a single room.');
INSERT INTO HouseType (HouseTypeName, Description) VALUES ('Loft', 'An apartment that is generally located in a converted industrial building.');
INSERT INTO HouseType (HouseTypeName, Description) VALUES ('Duplex', 'A structure divided into two separate homes.');
INSERT INTO HouseType (HouseTypeName, Description) VALUES ('Garden Apartment', 'An apartment with access to a garden or yard.');


--Salesmen:

INSERT INTO Salesmen (SalesmanID, FirstName, LastName, Email, Phone, BirthDate, HireDate, Salary, SpecializedHouseType) 
VALUES 
('123456789', 'Eitan', 'Cohen', 'eitan.cohen@google.com', '0581234567', '1990-01-01', '2015-05-01', 7800, 1),
('987654321', 'Sarit', 'Levy', 'sarit.levy@yahoo.com', '0549876543', '1985-09-15', '2014-03-11', 9500, 2),
('111222333', 'Moshe', 'Peretz', 'moshe.peretz@yandex.com', '0581112223', '1979-05-20', '2010-08-15', 8900, 3),
('444555666', 'Sharon', 'Golan', 'sharon.golan@walla.com', '0544445556', '1988-11-10', '2017-07-01', 7200, 4),
('777888999', 'Rivka', 'Mizrahi', 'rivka.mizrahi@gmail.com', '0507778889', '1992-04-18', '2018-12-05', 6300, 5),
('222333444', 'Amir', 'Weiss', 'amir.weiss@yahoo.com', '0582223334', '1980-06-30', '2013-01-22', 10500, 6),
('555666777', 'Liat', 'Kaplan', 'liat.kaplan@yandex.com', '0545556667', '1975-12-05', '2008-04-15', 9400, 2),
('888999111', 'Oren', 'David', 'oren.david@walla.com', '0508889991', '1987-02-21', '2016-09-19', 8600, 8),
('333444555', 'Yael', 'Rosen', 'yael.rosen@google.com', '0583334445', '1984-03-31', '2012-06-04', 11200, 1),
('666777888', 'Ilan', 'Schwartz', 'ilan.schwartz@yahoo.com', '0546667778', '1990-07-09', '2019-01-30', 6700, 2),
('999111222', 'Tamar', 'Katz', 'tamar.katz@yandex.com', '0589991112', '1978-08-17', '2011-02-25', 7400, 3),
('122344455', 'Doron', 'Fisher', 'doron.fisher@walla.com', '0501223444', '1986-10-04', '2015-11-12', 5100, 4),
('233445566', 'Talia', 'Shahar', 'talia.shahar@gmail.com', '0582334455', '1991-05-29', '2017-08-21', 6500, 5),
('344556677', 'Rafi', 'Green', 'rafi.green@yahoo.com', '0543445566', '1982-01-13', '2014-05-30', 7100, 2),
('455667788', 'Sigal', 'Goldman', 'sigal.goldman@yandex.com', '0504556677', '1977-09-28', '2010-10-05', 9700, 7);

select *
from HouseType join Salesmen on HouseType.HouseTypeID = Salesmen.SpecializedHouseType
Order by HouseTypeID

--Customers:

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, BirthDate) 
VALUES 
('556677889', 'Noam', 'Shahar', 'noam.shahar@gmail.com', '0584455667', '1980-10-15'),
('667788990', 'Orly', 'Friedman', 'orly.friedman@yahoo.com', '0546677889', '1975-05-07'),
('778899001', 'Dan', 'Mizrahi', 'dan.mizrahi@yandex.com', '0587788990', '1985-12-10'),
('889900112', 'Hila', 'Goldberg', 'hila.goldberg@walla.com', '0508899001', '1992-03-25'),
('987541256', 'Neta', 'Levi', 'neta.levi@google.com', '0589900112', '1990-08-12'),
('336119300', 'Gad', 'Baron', 'gad.baron@yahoo.com', '0541122334', '1979-02-09'),
('223344556', 'Maya', 'Alon', 'maya.alon@yandex.com', '0582233445', '1983-06-05'),
('334455667', 'Nir', 'Davidson', 'nir.davidson@walla.com', '0503344556', '1987-11-18'),
('445800650', 'Gal', 'Gershon', 'gal.gershon@gmail.com', '0584455667', '1984-04-30'),
('556677888', 'Sapir', 'Stern', 'sapir.stern@yahoo.com', '0545566778', '1978-09-24'),
('667788586', 'Shai', 'Cohen', 'shai.cohen@yandex.com', '0586677889', '1986-01-11'),
('778548659', 'Shlomi', 'Benjamin', 'shlomi.benjamin@walla.com', '0507788990', '1980-05-25'),
('889589542', 'Idan', 'Feldman', 'idan.feldman@gmail.com', '0588899001', '1991-10-07'),
('990011223', 'Shir', 'Kaplan', 'shir.kaplan@yahoo.com', '0549900112', '1977-12-03'),
('112233445', 'Hagit', 'Gefen', 'hagit.gefen@yandex.com', '0581122334', '1985-07-14'),
('258745120', 'Avi', 'Regev', 'avi.regev@walla.com', '0502233445', '1982-02-28'),
('335189542', 'Dafna', 'Mor', 'dafna.mor@gmail.com', '0583344556', '1989-06-19'),
('445566778', 'Uri', 'Lerner', 'uri.lerner@yahoo.com', '0544455667', '1976-03-10');

select * 
from Customers
order by CustomerID

--HousesForSale:
DROP TABLE HousesForSale
INSERT INTO HousesForSale 
(Adress, RequestedHousePrice, BuildDate, HouseSquareMeters, NumberOfRooms, Terrace, PrivateParkingZone, Elevator, SecureSpace, Describtion, NeighborhoodID, HouseTypeID, OwnerID)
VALUES 
--Tel Aviv
--(Kohav Hatsafon)
('Rothschild Blvd 20', 4800000, '2021-01-15', 120, 4, 1, 1, 1, 1, 'All-inclusive villa. A Robbing price but you will still buy', 1, 1, '556677889'),
--(Kohav Hatsafon)
('Red Lantern Street 7', 2700000, '1986-08-25', 58, 4, 0, 0, 0, 1, 'Small studio built in French modular style to maximize profit for each meter. Located in the centre of old city, near bazar', 1, 5, '556677889'),
--(florentin)
('Allenby St 10', 4200000, '2020-05-12', 110, 3, 1, 1, 1, 1, NULL, 3, 3, '667788990'),
--(florentin)
('Florentin St 3', 4500000, '2021-06-25', 115, 4, 1, 0, 1, 1, 'Modern and vibrant villa', 3, 1, '778899001'),

--Herzliya
--(Herzliya Pituach)
('Hanassi Ave 15', 3900000, '2010-08-22', 100, 3, 0, 1, 0, 1, NULL, 13, 4, '987541256'),
--(Neve Amal)
('Ben Gurion Ave 8', 3300000, '2005-03-16', 95, 3, 1, 0, 0, 0, 'Elegant townhouse with a beautiful sea view.', 14, 4, '889900112'),
('Maale Hagiborim St 25', 3700000, '2013-11-15', 98, 3, 1, 0, 0, 1, 'Comfortable family duplex', 14, 7, '889900112'),

--Haifa (Bat Galim)
('Bat Galim St 10', 2400000, '2018-01-15', 105, 3, 0, 0, 1, 0, 'Cozy apartment near the beach', 9, 2, '334455667'),
--Ramat Hanasi 
('Reuven 17', 3800000, '2014-10-15', 91, 3, 1, 1, 1, 1, 'Modern appartment in the newest Haifa Neighborhood. Seeview included', 8, 2, '334455667'),
('Reuven 23', 3875000, '2014-10-15', 125, 3, 1, 1, 1, 1, 'Biggest roof apartment in the newest Haifa Neighborhood. Seeview included', 8, 2, '334455667'),


----Jerusalem (Old City)
('David St 5', 2800000, '2019-04-20', 62, 2, 0, 1, 0, 1, 'Small studio in the historic Old City', 4, 5, '445800650'),

--Beersheba (Old City)
('Shimon St 12', 1800000, '2012-10-05', 85, 2, 0, 1, 1, 0, 'Apartment in the old city center', 9, 2, '778548659'),
('Bar Cochva St 2', 2230000, '2014-10-05', 98, 2, 0, 1, 1, 0, 'Relatively new appartment located next to the shopping centre and central clinic', 9, 2, '778548659'),

--Shuna D
('Kebab Halili 8', 900000, '1987-04-27', 80, 2, 0, 0, 0, 0, 'At least cheep', 12, 2, '778548659'),


--Rishon LeZion (Nahlat Yehuda)
('Yitzhak St 7', 3000000, '2016-12-10', 100, 3, 1, 1, 0, 0, 'Garden apartment in a quiet area', 15, 8, '258745120'),
--(Neve Hilel)
('Tregerman St 9', 3450000, '2017-07-20', 105, 3, 1, 1, 0, 0, 'Charming garden apartment', 16, 8, '258745120'),


--Ashdod (Rova Alef)
('Rova merkazi 15', 2800000, '2015-05-08', 86, 3, 0, 0, 1, 0, 'Affordable loft in historicly-abonded factory, close to amenities', 18, 6, '445566778'),
('Ort St 1', 3170000, '2018-12-11', 110, 4, 0, 0, 1, 0, 'Luxury loft located in the abonded central bank. Atmospehre of industrial New-York at your hand', 18, 6, '335189542'),


--Nahariya (Gaaton)
('Shderot Gaaton 21', 2700000, '2014-03-30', 93, 3, 1, 0, 0, 1, 'Apartment with spacious terrace', 19, 2, '335189542');


select *
from HousesForSale
Order by HouseID


--Sales:
DROP TABLE Sales
INSERT INTO Sales (ActualHousePrice, SaleDate, HouseID, BuyerID, SalesmanID)
VALUES (5000000, '2023-09-09 10:00:00', 1, '889589542', '123456789');


INSERT INTO Sales (ActualHousePrice, SaleDate, HouseID, BuyerID, SalesmanID)
VALUES (2763000, '2023-11-14 14:00:00', 2, '556677888', '233445566');


INSERT INTO Sales (ActualHousePrice, SaleDate, HouseID, BuyerID, SalesmanID)
VALUES (4218999, '2023-09-09 10:00:00', 3, '445566778', '111222333');

INSERT INTO Sales (ActualHousePrice, SaleDate, HouseID, BuyerID, SalesmanID)
VALUES (4746000, '2023-09-09 10:00:00', 4, '778899001', '123456789');



INSERT INTO Sales (ActualHousePrice, SaleDate, HouseID, BuyerID, SalesmanID)
VALUES (3900000, '2023-09-09 10:00:00', 5, '667788990', '111222333');

INSERT INTO Sales (ActualHousePrice, SaleDate, HouseID, BuyerID, SalesmanID)
VALUES (3386500, '2023-01-10 11:00:00', 6, '335189542', '666777888');

INSERT INTO Sales (ActualHousePrice, SaleDate, HouseID, BuyerID, SalesmanID)
VALUES (4508000, '2022-09-14 12:00:00', 7, '987541256', '333444555');

INSERT INTO Sales (ActualHousePrice, SaleDate, HouseID, BuyerID, SalesmanID)
VALUES (2469999, '2023-11-12 13:00:00', 8, '889900112', '444555666');

INSERT INTO Sales (ActualHousePrice, SaleDate, HouseID, BuyerID, SalesmanID)
VALUES (3845000, '2021-09-13 14:00:00', 9, '987541256', '444555666');

INSERT INTO Sales (ActualHousePrice, SaleDate, HouseID, BuyerID, SalesmanID)
VALUES (3770000, '2022-06-23 14:00:00', 11, '889900112', '444555666');

INSERT INTO Sales (ActualHousePrice, SaleDate, HouseID, BuyerID, SalesmanID)
VALUES (2000000, '2021-02-23 14:00:00', 12, '334455667', '555666777');


INSERT INTO Sales (ActualHousePrice, SaleDate, HouseID, BuyerID, SalesmanID)
VALUES (922500, '2023-12-13 14:00:00', 14, '334455667', '555666777');


INSERT INTO Sales (ActualHousePrice, SaleDate, HouseID, BuyerID, SalesmanID)
VALUES (3280000, '2023-01-26 14:00:00', 15, '556677889', '777888999');


INSERT INTO Sales (ActualHousePrice, SaleDate, HouseID, BuyerID, SalesmanID)
VALUES (3755000, '2022-04-27 14:00:00', 16, '889900112', '344556677');

--INSERT INTO Sales (ActualHousePrice, SaleDate, HouseID, BuyerID, SalesmanID)
--VALUES (3050000, '2021-09-12 14:00:00', 17, '335189542', '344556677');

--INSERT INTO Sales (ActualHousePrice, SaleDate, HouseID, BuyerID, SalesmanID)
--VALUES (3089555, '2021-04-27 14:00:00', 16, '778548659', '888999111');

INSERT INTO Sales (ActualHousePrice, SaleDate, HouseID, BuyerID, SalesmanID)
VALUES (2858000, '2022-11-27 14:00:00', 17, '258745120', '222333444');

INSERT INTO Sales (ActualHousePrice, SaleDate, HouseID, BuyerID, SalesmanID)
VALUES (2725000, '2020-09-27 14:00:00', 19, '778548659', '666777888');

select *
from Sales
Order by  HouseID

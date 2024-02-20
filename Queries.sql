--QUERRIES--



--1:
--Calculate the company's profits from all the brokerages done this year according to the type of house. 
--Profit is calculated by the difference between the company's selling price to the customer and the price requested by the customer who is selling his house.
--For each type of house (for example: an apartment in a building, a penthouse, etc.) the total profits for the year must be presented.


Select HouseType.HouseTypeName, SUM (ActualHousePrice - RequestedHousePrice) as PROFT
FROM Sales JOIN HousesForSale on Sales.HouseID = HousesForSale.HouseID
JOIN HouseType on HouseType.HouseTypeID = HousesForSale.HouseTypeID
Where Year(SaleDate) = Year(GetDate())
Group By HouseType.HouseTypeName
ORDER BY PROFT desc





--2: Show customers who sold through the company's services and bought another house at a price higher than the sale price.

-- I need to temporary distinguish buyers and sellers of the houses
WITH
Buyers AS -- Buyers from Sales + the money they spent for the house
(
	Select
		BuyerID, ActualHousePrice as BoughtPrice
	FROM
		Sales 
),

Sellers AS --Sellers from HousesForSale + the money they got from the house
(
    SELECT 
		HousesForSale.OwnerID, RequestedHousePrice as SoldPrice
    FROM HousesForSale JOIN Sales on HousesForSale.HouseID = Sales.HouseID		
)

SELECT 
    Customers.CustomerID,
	CONCAT(Customers.FirstName, ' ', Customers.LastName) AS 'Full Name',
    Sellers.SoldPrice,
    Buyers.BoughtPrice
FROM  Sellers JOIN Buyers  ON Sellers.OwnerID = Buyers.BuyerID
JOIN Customers ON Sellers.OwnerID = Customers.CustomerID
WHERE Buyers.BoughtPrice > Sellers.SoldPrice; 

-- As you can see I added 2 users with a cople of such delas from real world so the project looks realistically:
-- Hila Goldberg sold 2 houses 3300000, 3700000 and bought 2 more expensive 3770000 and 3755000 respectively. 
-- Shlomi Benjamin sold 2 houses 1800000 + 900000 so he can afford a better one 2725000




--3. What is the most prestigious neighborhood? Display the name of the neighborhood and the name of the city in which the average prices of the houses sold are the most expensive.


SELECT TOP 1 Cities.CityName, Neighborhoods.NeighborhoodName, AVG(Sales.ActualHousePrice) as AverageSoldPrice

FROM Neighborhoods JOIN Cities on Neighborhoods.CityID = Cities.CityID
JOIN HousesForSale on HousesForSale.NeighborhoodID = Neighborhoods.NeighborhoodID
JOIN Sales on Sales.HouseID = HousesForSale.HouseID
GROUP BY Cities.CityName, Neighborhoods.NeighborhoodName
ORDER BY AVG(Sales.ActualHousePrice) DESC


--4. Show the outstanding employee for each year. An outstanding employee is an employee whose total profits from his sales are the highest that year.


WITH YearlyProfits AS
(
    SELECT 
        SalesmanID, 
        SUM(ActualHousePrice) AS TotalProfit,
        YEAR(SaleDate) AS Year
    FROM Sales
    GROUP BY SalesmanID, YEAR(SaleDate)
),

MaxSalesByYear AS 
(
    SELECT 
        YEAR,
        MAX(TotalProfit) AS MAXProfit
    FROM YearlyProfits
    GROUP BY YEAR
)

SELECT 
    YearlyProfits.Year,
    YearlyProfits.SalesmanID,
	CONCAT(Salesmen.FirstName, ' ', Salesmen.LastName) AS 'Full Name',
    YearlyProfits.TotalProfit
FROM YearlyProfits JOIN MaxSalesByYear ON YearlyProfits.Year = MaxSalesByYear.Year AND YearlyProfits.TotalProfit = MaxSalesByYear.MAXProfit
Join Salesmen on Salesmen.SalesmanID = YearlyProfits.SalesmanID
ORDER BY YearlyProfits.Year;




--5. Offer a new and more spacious house to a customer who purchased a house through the company's services two or more years ago in the same city where he lives.
--(more spacious means a larger number of rooms or a larger area). Please note that the house offered must be a house for sale at this moment and not a house that has already been sold.

--I added 2 properties for this querry so it will be interesting (both rooms and total area). This was tricky!

--  Customers who purchased a house more than two years ago:
WITH OldPurchases AS
(
  SELECT 
    s.BuyerID, 
    h.HouseID, 
    n.CityID,
    h.NumberOfRooms,
    h.HouseSquareMeters,
    YEAR(s.SaleDate) as PurchaseYear
  FROM Sales s
  JOIN HousesForSale h ON s.HouseID = h.HouseID
  JOIN Neighborhoods n ON h.NeighborhoodID = n.NeighborhoodID
  WHERE YEAR(s.SaleDate) <= YEAR(GETDATE()) - 2
),

-- Available houses:
AvailableHouses AS (
  SELECT 
    h.HouseID, 
    n.CityID, 
    h.NumberOfRooms,
    h.HouseSquareMeters
  FROM HousesForSale h
  JOIN Neighborhoods n ON h.NeighborhoodID = n.NeighborhoodID
  WHERE h.HouseID NOT IN (SELECT HouseID FROM Sales)
),

-- More spacious houses form the available ones to the selected customers
SpaciousOffers AS (
  SELECT 
    o.BuyerID, 
    o.CityID,
    a.HouseID as NewHouseID,
    a.NumberOfRooms as NewNumberOfRooms,
    a.HouseSquareMeters as NewHouseSquareMeters
  FROM OldPurchases o
  JOIN AvailableHouses a ON o.CityID = a.CityID --house and customer from the same city
  WHERE (a.NumberOfRooms > o.NumberOfRooms) OR (a.HouseSquareMeters > o.HouseSquareMeters)
)

-- Result:
SELECT 
  c.CustomerID,
  CONCAT(c.FirstName, ' ', c.LastName) AS 'CustomerFullName',
  s.NewHouseID,
  s.NewNumberOfRooms,
  s.NewHouseSquareMeters
FROM Customers c
JOIN SpaciousOffers s ON c.CustomerID = s.BuyerID;

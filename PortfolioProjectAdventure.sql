--Basic inner join
SELECT P.ProductNumber as ProductNumber, T.Name as Name 
from [Production].[Product] as P
inner join Production.ProductCategory as T
on P.ProductSubcategoryID = T.ProductCategoryID;

SELECT P.PurchaseOrderID as OrderID, T.ProductID as ProductID, K.OrderQty as Qty, K.SalesOrderID, K.CarrierTrackingNumber, P.DueDate as DueDate
From Purchasing.PurchaseOrderDetail as P
join Production.ProductDocument as T
on P.ProductID = T.ProductID
join Sales.SalesOrderDetail as K
on T.ProductID = P.ProductID and K.UnitPriceDiscount > 0 and P.StockedQty > 100
order by K.SalesOrderID, P.DueDate;

SELECT p.ShoppingCartItemID as ItemID, oh.SalesOrderNumber, oh.CustomerID,  od.SalesOrderID
from Sales.ShoppingCartItem as p
left join Sales.SalesOrderDetail as od
on p.ProductID = od.ProductID
left join Sales.SalesOrderHeader as oh
on od.SalesOrderID = oh.SalesOrderID
order by p.ProductID;


Select C.Name, C.SalesPersonID, a.AddressType, a.AddressLine1, ISNULL(a.AddressLine2, '') as AddressLine2, a.city, a.StateProvinceName, a.CountryRegionName, a.PostalCode
From Sales.Store as C
join Sales.vStoreWithAddresses as a
on a.BusinessEntityID = C.BusinessEntityID and AddressType = 'Main office'

Select oc.AccountNumber, oh.TotalDue, oh.SalesOrderID
From Sales.Customer as oc
join Sales.SalesOrderHeader as oh
on oc.CustomerID = oh.CustomerID
order by SalesOrderID Desc

Select g.FirstName, g.LastName, g.PhoneNumber, j.AccountNumber, j.Name
From Sales.vIndividualCustomer as g
left join Purchasing.Vendor j
on g.BusinessEntityID = j.BusinessEntityID
where AddressLine2 is null
 
Select j.CustomerID,d.ProductID 
From Sales.Customer as g
join Sales.SalesOrderHeader j
on g.CustomerID = j.CustomerID
join Sales.SalesOrderDetail h
on j.SalesOrderID = h.SalesOrderID
join Sales.SpecialOfferProduct d
on h.ProductID = d.ProductID
where h.SalesOrderID is null
order by CustomerID,ProductID 


select JobTitle, COUNT(*) as N_Titles
from HumanResources.Employee
group by JobTitle
order by N_Titles desc

Select SalesOrderID,
		AVG(UnitPrice) as Avg_Price,
		Sum(OrderQty) as Total_Qty,
		Sum(LineTotal) as Total_Gain
From Sales.SalesOrderDetail
Group by SalesOrderID
order by total_Qty Desc


Select SalesOrderID,
		AVG(UnitPrice) as Avg_Price,
		Sum(OrderQty) as Total_Qty,
		Sum(LineTotal) as Total_Gain
From Sales.SalesOrderDetail
Group by SalesOrderID
Having Sum(OrderQty) < 400
order by Total_Gain Desc

select UPPER(FirstName) AS FirstName, LOWER(LastName) as LastName
from Sales.vStoreWithContacts

SELECT 
	YEAR(HireDate) as HireYear,
	MONTH(HireDate) as HireMonth,
	DAY(HireDate) as HireDay,
	Gender,
	SickLeaveHours,
	MaritalStatus
From HumanResources.Employee;


SELECT SUBSTRING(Name, CHARINDEX(' ', Name) + 1, LEN(Name)) AS LastName, Name

FROM Production.Product;

SELECT SUBSTRING(Name, CHARINDEX(' ', Name), LEN(Name)) AS LastName, Name

FROM Production.Product;

select JobTitle, COUNT(*) as N_Titles
from HumanResources.Employee
group by JobTitle
HAVING COUNT(*) > 10
order by N_Titles desc

--Creating View to store data for visualization

Create View JobTitleNumber as
Select JobTitle, COUNT(*) as N_Titles
from HumanResources.Employee
group by JobTitle
HAVING COUNT(*) > 10

Select * From JobTitleNumber


use Northwind
--Base de datos utilizada
---------------------------------------------------------------------------------------------------------------------------
--tabla temporar
select 
CompanyName,OrderDate,Title,FirstName,OrderID,ReportsTo,HireDate,ShipAddress
into tablatemporal5432
from Customers,Orders,Employees


--muestra de tabla de los datos de la tabla temporal
select * from tablatemporal5432
----------------------------------------------------------------------------------------------------------------------------------------------


--Operadores :

--operadores existentes
select
CompanyName,OrderDate,Title,FirstName,OrderID,ReportsTo,HireDate,ShipAddress

from tablatemporal5432
where    exists(
select
OrderDate
from LLA
where   tablatemporal5432.OrderDate = LLA.OrderDate
)
--**************************************************************************************************************
--operadores no existentes
select
CompanyName,OrderDate,Title,FirstName,OrderID,ReportsTo,HireDate,ShipAddress

from tablatemporal5432
where  not  exists(
select
OrderDate
from LLA
where   tablatemporal5432.OrderDate = LLA.OrderDate
)

--fin de operadores utilizadados 
---------------------------------------------------------------------------------------------------------------------------------------------------

--subconsultas
select 
 ShipName,OrderID,ShipVia,EmployeeID,ShipCity,CustomerID ,OrderDate,ShipAddress


from Orders
where EmployeeID in(
select 
EmployeeID
from  Employees
where CustomerID in(
select 
CustomerID
from Customers
where ShipVia='3'
))

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--clasula
select
CompanyName,OrderDate,Title,FirstName,OrderID,ReportsTo,HireDate,ShipAddress
from tablatemporal5432
where OrderDate between '1996/07/12' and '1997/05/03' AND
FirstName = 'laura'

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Fuciones utili

select CompanyName,OrderDate,Title,FirstName,OrderID,ReportsTo,HireDate,ShipAddress,


 Datename(MONTH, OrderDate)+'  ,  '+
 DATENAME(YEAR,OrderDate) as fechas  

 from tablatemporal5432

 --------------------------------------------------------------------------------------------------------------------------------------------------------------------------
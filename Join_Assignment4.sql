use MetroAlt

--1-- need to be clear about question

--Select * from BusScheduleAssignment
--Select * from Employee
--Select * from EmployeePosition
--Select * from BusRoute

Select * from Employee
Cross Join BusRoute
inner join EmployeePosition on Employee.EmployeeKey =EmployeePosition.EmployeeKey

--2

Select BusBarnKey, BusPurchaseDate,
BusTypeDescription, BusTypeCapacity, BusTypeEstimatedMPG, BustypePurchasePrice, BusTypeAccessible
From Bustype
inner join Bus
on BusType.BusTypeKey = Bus.BusTypeKey 
where BusBarnKey =3

--3
Select Sum(BustypePurchasePrice) as TotalBusCost
From Bustype
inner join Bus
on BusType.BusTypeKey = Bus.BusTypeKey 
where BusBarnKey =3

--4
Select * from Bustype
Select Sum(BustypePurchasePrice) as TotalBusCost,BusTypeDescription
From Bustype
inner join Bus
on BusType.BusTypeKey = Bus.BusTypeKey 
where BusBarnKey =3
Group by BusTypeDescription

--5

Select EmployeeLastName, EmployeeFirstName, EmployeeEmail ,PositionName,EmployeeHourlyPayRate
from Employee
inner join EmployeePosition on Employee.EmployeeKey =EmployeePosition.EmployeeKey
inner join Position on EmployeePosition.PositionKey =Position.PositionKey

--6

select DISTINCT EmployeeLastName, BusDriverShiftStartTime, BusDriverShiftStopTime, BusRouteKey ,Bus.BusKey, Bus.BusTypeKey
from Employee
inner join BusScheduleAssignment on Employee.EmployeeKey =  BusScheduleAssignment.EmployeeKey 
inner join BusDriverShift on  BusScheduleAssignment.BusDriverShiftKey=BusDriverShift.BusDriverShiftKey 
inner join Bus on BusScheduleAssignment.BusKey = Bus.BusKey
where BusRouteKey = 43 

--7

Select Distinct EmployeePosition.PositionKey, PositionName, Position.PositionKey
from Position
left outer Join EmployeePosition
on EmployeePosition.PositionKey= Position.PositionKey
where EmployeePosition.PositionKey is null

--8
--question need to clear(to be asked)











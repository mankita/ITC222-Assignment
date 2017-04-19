use MetroAlt

--1-- 

Select * from Employee
Cross Join BusRoute


--2

Select * From  Bustype inner join Bus
on Bus.BusTypeKey = BusType.BusTypeKey 
where BusBarnKey =3

--3

Select BustypePurchasePrice as TotalBusCost,BusBarnKey
From Bustype
inner join Bus
on BusType.BusTypeKey = Bus.BusTypeKey 
where BusBarnKey =3

--4

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

Select Distinct EmployeePosition.PositionKey as EmployeePositionKey, PositionName, Position.PositionKey as PositionKey
from Position
left outer Join EmployeePosition
on EmployeePosition.PositionKey= Position.PositionKey
where EmployeePosition.PositionKey is null

--8

Select Employee.Employeekey, EmployeeLastName, EmployeeFirstName,Positionkey,BusscheduleAssignmentKey
from Employee
inner join EmployeePosition
on  Employee.Employeekey = EmployeePosition.EmployeeKey
left outer join BusscheduleAssignment
on Employee.EmployeeKey = BusscheduleAssignment.EmployeeKey
where PositionKey=1 and  BusscheduleAssignment.EmployeeKey is null


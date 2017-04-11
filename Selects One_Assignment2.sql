use MetroAlt
--1
select * from Employee

--2
select EmployeeLastName,EmployeeFirstName,EmployeeEmail from Employee

--3
 
select EmployeeFirstName,EmployeeLastName from Employee
order by EmployeeLastName

--4
select EmployeeFirstName,EmployeeLastName,EmployeeHireDate from Employee
order by EmployeeHireDate DESC

--5
Select EmployeeFirstName,EmployeeLastName,EmployeeCity from Employee
where EmployeeCity='Seattle'

--6
Select EmployeeFirstName,EmployeeLastName,EmployeeCity from Employee
where NOT EmployeeCity='Seattle'

--7
Select EmployeeFirstName,EmployeeLastName,EmployeePhone from Employee
where EmployeePhone is null

--8
Select EmployeeFirstName,EmployeeLastName,EmployeePhone from Employee
where EmployeePhone is not null

--9
Select  EmployeeFirstName,EmployeeLastName from Employee
where EmployeeLastName like 'c%'

--10
Select EmployeeKey,EmployeeHourlyPayRate from EmployeePosition
Order by EmployeeHourlyPayRate DESC

--11
Select EmployeeKey, EmployeeHourlyPayRate,PositionKey from EmployeePosition
where PositionKey=2

--12
Select top 10 EmployeeKey, EmployeeHourlyPayRate,PositionKey from EmployeePosition
where PositionKey=2

--13
Select EmployeeKey, EmployeeHourlyPayRate,PositionKey from EmployeePosition
where PositionKey=2 ORDER BY EmployeeKey offset 20 rows fetch next 10 rows only

--14
Select Distinct  BusDriverShiftKey,BusRouteKey from BusScheduleAssignment




 













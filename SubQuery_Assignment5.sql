use MetroAlt

--1

Select Employee.EmployeeKey, PositionName, EmployeeLastName,EmployeeFirstName, EmployeeHourlyPayRate
from EmployeePosition
Inner Join Position
on EmployeePosition.PositionKey = Position.PositionKey
Inner Join Employee
on Employee.EmployeeKey = EmployeePosition.EmployeeKey
where EmployeeHourlyPayRate =(Select max(EmployeeHourlyPayRate) from EmployeePosition)

--2
Select EmployeeKey,EmployeeFirstName,EmployeeLastName from Employee
where EmployeeKey in (Select EmployeeKey from EmployeePosition 
where PositionKey in (Select PositionKey from Position where PositionName= 'Manager'))

--3

Select Year(BusScheduleAssignmentDate) as [Year],
Sum(Riders) as [Annual Total], 
AVG(Riders) as [Annual Average],
(Select Sum(Riders) from Ridership) as [Total],
sum(Riders) * 100   / 
(Select Sum(Riders) from Ridership) as [Percent]
from Ridership
Inner join BusScheduleAssignment
on BusScheduleAssignment.BusScheduleAssignmentKey= Ridership.BusScheduleAssigmentKey
Group by Year(BusScheduleAssignmentDate)
Order by Year(BusScheduleAssignmentDate)

--4

SELECT EmployeeKey,EmployeeLastName,EmployeeFirstName,EmployeeEmail
INTO EmployeeZ 
FROM Employee
WHERE EmployeeLastName LIKE 'Z%'

--Drop table EmployeeZ
--Select * from EmployeeZ

--5

Select PositionKey, EmployeeKey, EmployeeHourlyPayRate from employeeposition e1
where EmployeeHourlyPayRate=
(Select  max(EmployeeHourlyPayRate) from EmployeePosition e2 where e1.PositionKey= e2.PositionKey) 











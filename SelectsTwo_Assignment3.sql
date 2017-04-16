--Assignment 3
use MetroAlt

--1
Select EmployeeFirstName,EmployeeLastName,YEAR(EmployeeHireDate) as EmloyeeHireYear from Employee 
order by YEAR(EmployeeHireDate),EmployeeLastName

--2
Select DATEDIFF
(MONTH,(SELECT MIN(EmployeeHireDate)FROM Employee),(SELECT MAX(EmployeeHireDate) 
FROM Employee))


--3
Select Format(Cast(EmployeePhone as bigint), '(000)000-0000') as EmployeePhoneNumber
from Employee


--4
Select Format(EmployeeHourlyPayRate, '$#,##0.00') as EmployeeHourlyWage
from EmployeePosition


--5
Select EmployeeFirstName,EmployeeLastName, 
YEAR(EmployeeHireDate) as EmloyeeHireYear
from employee 
where
YEAR(EmployeeHireDate) between 2013 and 2015

--6
Select PositionKey,EmployeeHourlyPayRate,EmployeeHourlyPayRate * 40 as WeeklyWage from EmployeePosition

--7
Select Max(EmployeeHourlyPayRate) as MaximumHourlyPayRate from EmployeePosition

--8
Select Min(EmployeeHourlyPayRate) as MinimumHourlyPayRate from EmployeePosition

--9
Select Avg(EmployeeHourlyPayRate) as AverageHourlyPayRate from EmployeePosition

--10
Select Distinct PositionKey, 
Avg(EmployeeHourlyPayRate) as AvrgPay from EmployeePosition 
GROUP BY PositionKey

--11

--for employee count display  per year per month
Select Count(EmployeeKey) as EmployeeCount,
Month(EmployeeHireDate) as EmployeeHiringMonth,
Year(EmployeeHireDate) as EmployeeHiringYear
from Employee
GROUP BY Month(EmployeeHireDate), Year(EmployeeHireDate)

--for employee count display  per year
Select Count(EmployeeKey) as EmployeeCount,
Year(EmployeeHireDate) as EmployeeHiringYear
from Employee
GROUP BY Year(EmployeeHireDate)

--12

Select Count(EmployeeKey) as EmployeeCount,
Case Month(EmployeeHireDate)
when 1 then 'January'
when 2 then 'February'
when 3 then 'March'
when 4 then 'April'
when 5 then 'May'
when 6 then 'June'
when 7 then 'July'
when 8 then 'August'
when 9 then 'September'
when 10 then 'October'
when 11 then 'November'
when 12 then 'December' end as [EmployeeHiringMonth],
Year(EmployeeHireDate) as EmployeeHiringYear
from Employee
GROUP BY Month(EmployeeHireDate), Year(EmployeeHireDate)

--13
Select * from EmployeePosition
Select  PositionKey, avg(EmployeeHourlyPayRate) as KeyAverageHourlyPay from EmployeePosition
Group By PositionKey
HAVING avg(EmployeeHourlyPayRate) > 50.00

--14
SELECT SUM(RIDERS) AS TotalRiders from Ridership

--15
Select name from sys.Tables

--16
Select name from sys.DataBases

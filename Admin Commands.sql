--Admin Commands (Assignment)
use MetroAlt

--1
go 
create schema ManagementSchema
go

--2
create view ManagementSchema.Ridership
As
Select * from  Ridership
go

--3

Create view ManagementSchema.EmployeePay
As
Select e.EmployeeKey, EmployeeFirstName, EmployeeLastName, PositionName, EmployeeHourlyPayRate from Employee e
inner join EmployeePosition ep
on e.EmployeeKey = ep.EmployeeKey
inner join Position p
on  p.PositionKey = ep.PositionKey


--4
create role ManagementRole_MetroAlt
go 
Grant Select on schema::ManagementSchema to  ManagementRole

--5 to 11
select e.EmployeeKey,EmployeeFirstName,EmployeeLastName, PositionName, p.PositionKey from EmployeePosition ep
inner join Position p
on ep.PositionKey= p.PositionKey 
inner join Employee e on
e.EmployeeKey = ep.EmployeeKey
where PositionName='Manager'
       

Create login vmartin with password='mpass',
default_database = metroAlt

create user vmartin for login vmartin

exec sp_addrolemember managementrole, vmartin

Backup database MetroAlt to disk='C:\Backup\MetroAlt.bak'


use MetroAlt
--begin tran
go
Create Trigger tr_overtime on [dbo].[BusScheduleAssignment]
for insert 
As
declare @employeekey int 
declare  @busshiftkey int
declare @date Date
declare @count int
Select @employeekey= Employeekey, @date= BusScheduleAssignmentDate, @busshiftkey =BusDriverShiftKey
from inserted
Select @count = Count(BusDriverShiftKey) from BusScheduleAssignment
where [BusScheduleAssignmentDate]=@date
and EmployeeKey= @employeekey

if @count > 1
Begin
if not exists 
(Select name from sys.tables
where Name ='Overtime')
Begin
Create table Overtime
(
BusScheduleAssignmentKey int, 
BusDriverShiftKey int, 
EmployeeKey int, 
BusRouteKey int , 
BusScheduleAssignmentDate date, 
BusKey int
)
End

Insert into Overtime(BusScheduleAssignmentKey, BusDriverShiftKey, EmployeeKey, BusRouteKey, 
BusScheduleAssignmentDate, BusKey)
Select * from inserted
End

Select * from Overtime
Insert into BusScheduleAssignment
(BusDriverShiftKey, 
EmployeeKey, 
BusRouteKey, BusScheduleAssignmentDate, BusKey)
Values(1,2,23,GETDATE(),4)

rollback tran
Insert into BusScheduleAssignment
(BusDriverShiftKey, 
EmployeeKey, 
BusRouteKey, BusScheduleAssignmentDate, BusKey)
Values(1,3,23,GETDATE(),4)

Insert into BusScheduleAssignment
(BusDriverShiftKey, 
EmployeeKey, 
BusRouteKey, BusScheduleAssignmentDate, BusKey)
Values(3,3,23,GETDATE(),4)

--Rollback tran



use WFA3DotNet
---DML Trigger Example

select GETDATE()
Create table PastEmpTable(
empid int,
ename varchar(20),
esal float,
dol datetime default getDate(),

)
Create table PastEmpTy(
empid int,
ename varchar(20),
esal float,
dol datetime default getDate(),
actionperformed varchar(30)
)

alter trigger trgAfterDel on employeetab
after delete
as 
declare 
@empid int,
@ename varchar(20),
@esal float,
@dol datetime
select @empid=deleted.EmpId,@ename=deleted.Empname,@esal=deleted.Salary,@dol=getdate() from deleted

insert into PastEmpTable(empid,ename,esal,dol) values(@empid,@ename,@esal,@dol)
print 'After delete trigger fired on EmpTable'


select * from EmployeeTab
delete from EmployeeTab where empid=2
select * from PastEmpTable

----Trigger using DML Update
alter trigger trgafterUpdate on employeetab
after update
as
declare
@empid int,
@ename varchar(20),
@esal float,
@dol datetime,
@actionperformed varchar(50)
select @empid=inserted.empid,@ename=inserted.empname,@esal=inserted.salary from inserted
if update(Empname)
   set @actionperformed='Updated Name'
if update(Salary)
   set @actionperformed='updated salary'
   
insert into PastEmpTy(empid,ename,esal,dol,actionperformed) values(@empid,@ename,@esal,@dol,@actionperformed)
print 'After update trigger fired on emptable'

select * from PastEmpTy
update EmployeeTab set Empname='Nikhila',Salary=120.00 where EmpId=5
select * from EmployeeTab


--insert into EmployeeTab values(1,'Ramya',655,12)


--select * from PastEmpTable
--update EmployeeTab set @ename='Hello' where empid=5
--select * from Employeetab






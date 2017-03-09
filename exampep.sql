
----1
--create database KtbBank
--use ktbbank

--create table Employees
--(
--EmployeeId int not null primary key identity,
--FirstName nvarchar(50) not null,
--HireDate date not null,
--Salaty decimal not null,
--BranchId int not null
--)

--create table EmployeesAcounts
--(
--EmployeeId int not null,
--AccountId int not null,
--constraint PK_EmployeesAcounts primary key (EmployeeId,AccountId)
--)

--create table EmployeesLoans
--(
--EmployeeId int not null,
--LoansId int not null,
--constraint PK_EmployeesLoans primary key(EmployeeId,LoansId)
--)

--create table Loans
--(
--LoanId int not null primary key  identity,
--StartDate date not null,
--Amount decimal not null,
--Interest decimal not null,
--ExparationDate date not null,
--CustomerId int not null
--)



--create table Customers
--(
--CustomerId int not null primary key identity,
--FirstName nvarchar(50) not null,
--LastName nvarchar(50) not null,
--Gender char(1),
--constraint CheckGender check (Gender in ('m', 'f')),
--DateOfBirth date not null,
--Height int not null,
--CityId int not null
--)

--create table Acounts
--(
--AcountId int not null primary key identity,
--AcountNumber char(10) not null,
--StartDate date not null,
--CustomerId int not null
--)

--create table Branches
--(
--BrancheId int not null primary key identity,
--Name nvarchar(50) not null,
--CityId int not null
--)

--create table Cities
--(
--CityId int not null primary key identity,
--CityName nvarchar (50) not null
--)


alter table [dbo].[EmployeesAcounts]
add constraint FK_EmployeesAcountsEmployees foreign key (EmployeeId)
references Employees (EmployeeId)

alter table [dbo].[EmployeesAcounts]
add constraint FK_EmployeesAcountsAcounts foreign key (AccountID)
references Acounts (AcountID)


alter table [dbo].[EmployeesLoans]
add constraint Fk_EmployeesLoansEmpoyees foreign key(EmployeeId)
references Employees (EmployeeId)

alter table [dbo].[EmployeesLoans]
add constraint Fk_EmployeesLoansLoans foreign key(LoansId)
references Loans (LoanId)

use KtbBank
go

alter table Employees
add constraint FK_EmployeesBranches foreign key (BranchId)
references Branches (BrancheId)

alter table Customers
add constraint FK_customersCities foreign key (CityId)
references  Cities (CityId)

alter table Acounts
add constraint FK_AcountsCustomers foreign key (CustomerId)
references  Customers (CustomerId)


alter table Loans
add constraint FK_LoansCustomers foreign key (CustomerId)
references Customers (CustomerId)

alter table Branches
add constraint Fk_BranchesCities foreign key (cityId)
references Cities (Cityid)

create table Deposits
(
DepositId int not null primary key identity,
Amount decimal (10,2) not null,
StartDate date not null,
EndDate date not null,
DepostitTypeId int not null,
CustomeId int not null
)

create table DepositTypes
(
DepositTypesId int not null primary key,
Name nvarchar(50) not null
)


create table EmployeesDeposits
(
EmployeeId int not null,
DepositId int not null
)

create table CreditHistory
(
CreditHistoryID int not null primary key identity,
Mark char(1) not null,
StartDate date not null,
EndDate date not null,
CustomerId int not null
 
)

create table Payments
(
PaymentId int not null primary key identity,
Date date not null,
Amount decimal (10,2),
LoanId int not null
)

create table Users
(
UserId int not null primary key identity,
UserName nvarchar(20) not null,
Password nvarchar(20) not null,
CustomerId int not null unique
)

alter table Employees
add  ManagerId int not null

alter table Deposits
add constraint FK_DepositsDepositType foreign key (DepostitTypeID)
references DepositTypes(DepositTypesID)

alter table Deposits
add constraint FK_DepositsCustomers foreign key (CustomeID)
references Customers(CustomerID)

alter table EmployeesDeposits
add constraint FK_EmployeesDepositsEmployees foreign key (DepositId)
references Deposits (DepositID)

alter table EmployeesDeposits
add constraint FK_EmployeesDepositsEmployeess foreign key (EmployeeId)
references Employees (EmployeeId)

alter table CreditHistory
add constraint FK_CreditHistoryCustomers foreign key (CustomerId)
references Customers(CustomerId)

alter table Payments
add constraint FK_PaymentsLoan foreign key (LoanId)
references Loans (loanId)

alter table users
add constraint FK_UsersCustomer foreign key (customerId)
references Customers (CUstomerId)


INSERT INTO Customers (CustomerID, FirstName, LastName, Gender, DateOfBirth, Height, CityID)
VALUES
(1,'Bruce','Armstrong','M','19700917',2.11,10),
(2,'Carolyn','Wells','F','19400623',2.11,18),
(3,'Rachel','White','F','20150611',1.65,9),
(4,'Brenda','Boyd','F','19451125',2.05,17),
(5,'Aaron','Campbell','M','19780806',2.14,7),
(6,'Mary','Gordon','F','19390510',1.66,14),
(7,'Amy','Allen','F','20070425',1.7,11),
(8,'Frank','Armstrong','M','19800520',1.95,20),
(9,'Bobby','Hughes','M','19671012',1.72,8),
(10,'Gregory','Hansen','M','19770816',1.37,4),
(11,'Russell','Lawrence','M','19941117',1.78,3),
(12,'Henry','Henry','M','19451013',1.85,8),
(13,'Christina','Little','F','19540102',1.14,12),
(14,'George','Bennett','M','19560416',2.12,14),
(15,'Carolyn','Pierce','F','20040310',1.89,10),
(16,'Tammy','Crawford','F','19931128',1.46,6),
(17,'Samuel','Cooper','M','20000513',1.22,8),
(18,'Patrick','Mills','M','19740804',2.1,14),
(19,'Matthew','Davis','M','19410901',1.82,8),
(20,'Clarence','Meyer','M','20160123',1.18,12),
(21,'Karen','Mason','F','19570312',2.15,19),
(22,'Lawrence','Diaz','M','19800217',1.78,1),
(23,'Deborah','Taylor','F','19461106',1.5,12),
(24,'Robert','Fuller','M','20030105',2.11,13),
(25,'Debra','Crawford','F','19890524',2.16,1),
(26,'Albert','Flores','M','20050303',1.9,6),
(27,'Howard','Wood','M','19651216',1.11,16),
(28,'Sarah','Wheeler','F','20051103',1.76,11),
(29,'Roy','Rogers','M','19851218',2.14,16),
(30,'John','Pierce','M','19990516',1.01,12),
(31,'Justin','Dixon','M','19560830',1.6,17),
(32,'Karen','Cook','F','19670321',1.93,16),
(33,'Shirley','Williamson','F','19841006',1.62,16),
(34,'Joe','Sanders','M','19720629',1.78,1),
(35,'Mildred','Ferguson','F','19580607',1.34,15),
(36,'Mary','Harper','F','19910330',1.44,15),
(37,'George','Ryan','M','19550809',1.91,13),
(38,'Carl','Turner','M','19750128',1.51,17),
(39,'Mark','Wheeler','M','19540202',1.14,1),
(40,'William','Fox','M','19940812',1.92,3)

use KtbBank

insert into EmployeesDeposits (EmployeeID,DepositId) values
(15,4),
(20,15),
(8,7),
(4,8),
(3,13),
(3,8),
(4,10),
(10,1),
(13,4),
(14,9)

insert into DepositTypes (DepositTypesId, Name) values
(1,'Time Deposit'),
(2, 'Call Deposit'),
(3, 'Free Deposit')

insert into Deposits (Amount,StartDate,DepostitTypeId,CustomeId)
(
select 
case
when DateOfBirth > '01-01-1980' then 
	case 
	when Gender = 'm' then 1100
	else 1200
	end
else 
	case 
	when Gender = 'm' then 1600
	else 1700
	end
end,
GETDATE (),
case
when CustomerId >15 then 3
else
case
when CustomerId %2 =0 then 2
else 1
end
end,
CustomerId 
from Customers
where CustomerId <21
)

update Employees
set ManagerId = 
case
when EmployeeId between 2 and 10 
then 1
when EmployeeId between 12 and 20
then 11
when EmployeeId between  22 and 30
then 21
when EmployeeId in (11,21)
then 1
end

delete from EmployeesDeposits
where 
DepositId = 9
or EmployeeId = 3

---1
select EmployeeId,HireDate,Salaty,BranchId 
from Employees
where Salaty >2000
and HireDate > '2009-06-15'


--2
select FirstName,DateOfBirth,
DATEDIFF (YEAR, DateOfBirth, '2016-10-1') as Age
from Customers
where DATEDIFF (YEAR, DateOfBirth,'1-10-2016') between 40 and 50


--3
select 
CustomerId,FirstName,LastName,Gender,CityName
from Customers
inner join Cities
on Cities.CityId = Customers.CityId
where 
(LastName like 'Bu%'
or  FirstName like '%a')
and len (Cities.CityName) >= 8
order by CustomerId asc


---4
select e.EmployeeId,e.FirstName,a.AcountNumber
from Employees as e
inner join EmployeesAcounts as ea
on ea.EmployeeId = e.EmployeeId
inner join Acounts as a
on a.AcountId = ea.AccountId
where
a.StartDate >= '2012'
 order by e.FirstName desc

 --5
 select c.CityName,b.Name,
 count (*) as EmployeesCount
from Employees as e
inner join Branches as b
on b.BrancheId = e.BranchId
inner join Cities as c
on c.CityId = b.CityId
where 
c.CityId != 4 and c.CityId !=5 
group by c.CityName,b.Name
having count (*)>=3

--6
select  
sum (l.Amount) as TotalLoanAmount,
Max (l.Interest) as MaxInterest,
MIN (e.Salaty) as MinEmployeeSalary
from Loans as l
inner join EmployeesLoans as el
on el.LoansId =l.LoanId
inner join Employees as e
on el.EmployeeId = e.EmployeeId

--7
use KtbBank

select top 3 e.FirstName,c.CityName  
from Employees as e
inner join Branches as b
on b.BrancheId = e.BranchId
inner join Cities as c
on c.CityId = b.CityId
union all
select top 3 c.FirstName,cc.CityName
from Customers as c
inner join Cities as cc
on cc.CityId = c.CityId 

--8
select c.CustomerId,c.Height 
from Customers as c
left join Acounts as a
on a.CustomerId = c.CustomerId
where a.AcountNumber is null
//and c.Height between 1.74 and 2.04

--9
select c.CustomerId,l.Amount
from Customers as c
inner join Loans as l
on l.CustomerId = c.CustomerId
where
l.Amount > 
(select AVG (loans.Amount) 
from Loans
inner join Customers 
on Loans.CustomerId = Customers.CustomerId
where Customers.Gender = 'm'
)
order by c.LastName asc

--inner join Customers as c
--on c.CustomerId = l.CustomerId
--where c.Gender = 'm'

--10
select c.CustomerId,c.FirstName,a.StartDate
from Customers as c
inner join Acounts as a
on c.CustomerId = a.CustomerId
where a.StartDate = 
(select min (Startdate) from Acounts)

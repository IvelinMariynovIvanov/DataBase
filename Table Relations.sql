---1
create database OneToOneRelationship
use OneToOneRelationship

create table Persons
(
PersonId int not null identity,
FirstName nvarchar(50) not null,
Salary decimal not null
)

Create table Passports
(
PassportId int not null primary key identity,
PassportNumber nvarchar(8) not null
)

alter table Persons
add constraint PK_PersonId primary key (PersonId)

alter table persons
add  PassposrtId int not null

alter table Persons
add constraint FK_Persons_Passports foreign key (PassposrtId)
references Passports(PassportId)


--2
create database OneToManyRelationship
use OneToManyRelationshi

create table Manifactures
(
ManifacturerId int not null primary key identity,
Name nvarchar(50) not null,
EstablishedOn nvarchar(50) not null
)

create table Models
(
ModelId int not null primary key identity,
Name nvarchar(50) not null,
ManifacturerId int not null foreign key
references Manifactures (ManifacturerId)
)

insert into Manifactures values
( 'bmw', '07/03/1916'),
( 'tesla', '01/01/2003'),
( 'ladal', '01/05/1966')

insert into Models values
( 'x1', 1), ( 'i6', 1), 
('models s', 2), ('modle x', 2), ('model 3', 2),
('nova', 3)

--3
create database ManyToMany
use ManyToMany

create table students
(
StudentId int not null primary key identity,
Name nvarchar (50) not null
)

create table exmams
(
ExamId int not null primary key identity,
Name nvarchar (50) not null
)

create table studentsExams
(
StudentId int not null,
ExamId int not null
constraint PK_studentsExams primary key (StudentId,ExamId),
constraint FK_studentsExams_Students foreign key (StudentId)
references Students (StudentId),
constraint FK_studentsExams_Exams foreign key (ExamId)
references exmams(ExamId)
)

--4
create table Teachers
(
TeacherId int not null primary key identity,
Name nvarchar(50) not null,
ManagerId int not null,
constraint FK_Teachers_Teachers foreign key (ManagerId)
references teachers (teacherId)
)

--5
create database OnlineStore
use OnlineStore

create table Orders
(
OrderId int not null primary key identity,
CustomerId int not null)

constraint FK_Orders_Customers  foreign key (CustomerId)
references Customers (CustoomerId)
)

create table Customers
(
CustomerId int not null primary key identity,
Name nvarchar(50) not null,
Birthday date not null,
CityId int not null
)

create table Cities
(
CityId int not null primary key identity,
Name nvarchar(50)
)

create table items
(
ItemId int not null primary key identity,
Name nvarchar(50) not null,
ItemTypeId int not null
)

create table ItemTypes
(
ItemTypeId int not null primary key identity,
Name nvarchar(50)
)

alter table Items
add constraint FK_Items_ItemsTypes foreign key (ItemTypeId)
references Itemtypes (ItemtypeId)

create table OrdersItems
(
OrderId int not null,
ItemId int not null,
constraint PK_OrdersItems primary key (OrderId,Itemid),
constraint FK_OrdersItems_Items foreign key (ItemId)
references Items (ItemId),
constraint FK_OrdersItems_Orders foreign key (OrderId)
references Orders (OrderId)
)

alter table Orders
add constraint Fk_Orders_Customers foreign key (CustomerId)
references Customers (CustomerId)

alter table Customers
add constraint FK_Customers_Cities foreign key (CityId)
references Cities (CityId)

use SoftUni
--9

select top 5 e.EmployeeID,e.JobTitle,a.AddressID,a.AddressText
 from Employees as e
 inner join Addresses as a
 on a.AddressID = e.AddressID
 order by a.AddressID asc

 --10
 select top 5 EmployeeID,FirstName,Salary,d.Name
 from Employees as e
 inner join Departments as d
 on e.DepartmentID = d.DepartmentID
 where Salary > 15000
 order by e.DepartmentID asc
 
 --11
 select top 3 e.EmployeeID,e.FirstName 
 from Employees as e
 left outer join EmployeesProjects as ep
 on ep.EmployeeID = e.EmployeeID
 where ep.ProjectID is null
 order by EmployeeID

 --12
 select top 5 e.EmployeeID,e.FirstName,p.Name 
 from Employees as e
 left outer join EmployeesProjects as ep
 on ep.EmployeeID = e.EmployeeID
 left outer join Projects as p
 on ep.ProjectID = p.ProjectID
 where p.StartDate > '2002-8-13'
 and p.EndDate is null
 order by EmployeeID asc

 --13
 select e.EmployeeID,e.FirstName,
 case
 when p.Startdate > '2005-01-01' then 'Null'
 else p.Name end as 'Project Name'
 from Employees as e
 inner join EmployeesProjects as ep
 on ep.EmployeeID = e.EmployeeID
 left join Projects as p
 on p.ProjectID = ep.ProjectID
 where e.EmployeeID = 24


 --14

 select e.EmployeeID,e.FirstName,e.ManagerID,ee.FirstName as Mangername
 from Employees as e
 left join Employees as ee
 on e.ManagerID = ee.EmployeeID
where e.ManagerID in(3,7)
order by EmployeeID asc

--15
use Geography
select c.CountryCode,m.MountainRange,p.PeakName,p.Elevation
from Countries as c
inner join MountainsCountries as mc
on c.CountryCode = mc.CountryCode
inner join Peaks as p
on mc.MountainId = p.MountainId
inner join Mountains as m
on m.Id = mc.MountainId
where c.CountryCode = 'bg'
and p.Elevation >2835
order by p.Elevation desc

---16
select c.CountryCode,
count (*) as MountainRanges
from Countries as c
inner join MountainsCountries as mc
on mc.CountryCode = c.CountryCode
inner join Mountains as m
on m.Id = mc.MountainId
where c.CountryName in ('USA', 'Russia', 'Bulgaria')
group by c.CountryCode

--17
select top 5 c.CountryName,r.RiverName 
from Countries as c
left join CountriesRivers as cr
on cr.CountryCode = c.CountryCode
left join Rivers as r
on r.Id = cr.RiverId
left join Continents as con
on c.ContinentCode =con.ContinentCode
where con.ContinentName = 'Africa'
order by c.CountryName asc

 --19 
 select distinct Countries.CountryCode,m.Id 
 into nullMountainsss
 from Countries
right join MountainsCountries as mc
on mc.MountainId = MountainId
right join Mountains as m
on mc.CountryCode =Countries.CountryCode 

select  count(*) as Countt
from (select distinct nm.CountryCode  from nullMountainsss as nm
where nm.id is null) as vz 



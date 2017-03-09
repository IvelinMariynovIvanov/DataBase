drop  database minions

----1
create database Minions

----2
create table Minions
(
Id int not null primary key,
Name nvarchar(50) not null,
Age int not null
);

drop table Minions;

use Minions;

create table Minions
(
Id int not null primary key,
Name nvarchar(50) not null,
Age int not null
);

create table Towns
(
Id int not null primary key,
Name nvarchar(50) not null
);

---3
alter table Minions
add TownId int not null

alter table Minions
add foreign key(TownId)
references Towns(Id)

alter table minions
add foreign key(TownId)
references Towns(Id);

use Minions

alter table Minions
add foreign key(TownId)
references Towns(Id)

---4

insert into Towns values(1, 'Sofia');
insert into Towns values (2, 'Plovdiv');
insert into Towns values (3, 'Varna');

insert into Minions values (1, 'Kelvin', 22,1);
insert into Minions values (2, 'Bob', 15, 3);
insert into Minions values (3, 'Steward', null, 2);

---5
truncate table minions;

--- 6
drop table Minions
drop table Towns

--7
create table People
(
Id int not null identity primary key,
Name nvarchar(200) not null,
Picture varbinary(2),
Height float(2),
Weightt float(2),            --------- weight ??
Gender char(1),
Birtdate date not null,
Biagrafy nvarchar(max)
);

alter table people
drop column Picture

alter table people
add Picture varbinary;

alter table people
add constraint pictureSize check(datalength(Picture)< 2000)

alter table people
add constraint genderCheck check (Gender in ('m', 'f'));

alter table people
drop column Birtdate

alter table people
add Birtdate date

insert into People values ('dsds', null, null, 'm','2016-10-11', null, null)
insert into People values ('iiiiiiiii', 3.123456,  45.7643434, 'f', '2016-10-11', null, null)

alter table people
alter column Height decimal(10,2)

alter table people
alter column  Weightt decimal(10,2)

create table 
 
(
BirthdateId date not null
)

insert into Birthdate values ('1987-05-27')
---8

create table Users
(
Id int not null identity primary key,
Username char(30),
Passwordd char(26),     ------------password ???
ProfilePicture varbinary(1),
LastLoginTime date,
IsDeleted bit
);

insert into Users values ('eclipse','ribamech', null, null, 'false')
insert into Users values ( 'dsadas', 'aaaaaa', null, null, 'true')

alter table users
add constraint pictureMaxSize check (datalength (ProfilePicture) < 900 )
--9
alter table users
drop constraint PK__Users__3214EC0796659DFC

alter table users
add primary key(Id, Username)

---10
use minions
alter table users
add constraint passwordcheck check (len(Passwordd) > 5);  ---????????

--11
alter table users
add constraint defaulttime default 'gettime' for LastLoginTime;

--12
alter table users
drop  constraint [PK__Users__7722245913E104B5]

alter table users
add primary key(Id);

alter table users
add constraint userNamecheck check (len(Username) > 3) ---------??

--13
create database Movies

create table Directors
(
Id int not null primary key identity,
DirectorName nvarchar(30) not null,
Notes nvarchar(30)
);

drop table Directors

use Movies

create table Directors
(
Id int not null primary key identity,
DirectorName nvarchar(30) not null,
Notes nvarchar(30)
);

create table Geners
(
Id int not null primary key identity,
GenderName nvarchar(30) not null,
Notes nvarchar(max)
);

create table Categories
(
Id int not null primary key identity,
CategoryName nvarchar(30) not null,
Notes nvarchar(max)
);

create table Movies
(
Id int not null primary key identity,
DirectorId int not null ,
CopyRightYear int not null,
Lenght time not null,
GenreId int not null ,
CategoryId int not null ,
Rating decimal (2,1) not null,
Notes nvarchar(max)
);

alter table movies
add foreign key(DirectorId)
references Directors(Id)

alter table movies
add foreign key (CategoryId)
references Categories(Id);

alter table movies
add foreign key(GenreId)
references Geners(Id);


---16
create database sofuni1

use sofuni1

create table Towns
(
Id int not null identity primary key,
Name nvarchar(50) not null
);

create table Addresses
(
Id int not null identity primary key,
AddressText nvarchar(50) not null,
TownId int not null,
foreign key(TownId)
references Towns(Id)
) 

create table Departments
(
Id int not null identity primary key,
Name nvarchar(50) not null
); 

create table Employees
(
Id int not null identity primary key,
FirstName nvarchar(50) not null,
MiddleName nvarchar(50) not null,
LastName nvarchar (50) not null,
JobTitle nvarchar(50) not null,
DepartmentId int not null,
HireDate date not null,
Salary decimal (6,2) not null,
AddressId int not null
) 

alter table Employees
add foreign key (DepartmentId)
references Departments(Id)

alter table Employees
add foreign key (AddressId)
references Addresses(Id)

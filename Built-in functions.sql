use SoftUni
go

--1
select e.FirstName,
       e.LastName
from Employees as e
where FirstName like 'sa%'

--2
select FirstName,LastName 
from Employees
where LastName like '%ei%'

--3
select FirstName,HireDate
from Employees
where DepartmentID in (3,10) 
and datename (year, HireDate) between 1995 and 2005

--4
select FirstName,LastName 
from Employees
where JobTitle not like '%engineer%'

--5
select Name 
from Towns
where len(name)between 5 and 6
order by Name asc

--6
select TownID,Name
from Towns
where Name like '[M,K,B,E]%'
order by Name asc

--7
select TownID,Name
from Towns
where Name not like '[R,B,D]%'
order by Name asc

--8
create view V_EmployeesHiredAfter2000 as
select FirstName,LastName, HireDate
from Employees
where DATENAME(year, hiredate) >2000

--9
select FirstName,LastName 
from Employees
where LEN (LastName) =5

--10
use Geography
go

select CountryName,IsoCode
from Countries
where CountryName like '%A%A%A%'
order by IsoCode asc

--11
select PeakName,RiverName,
concat (lower (PeakName), LOWER (RiverName)) as Mix
from Rivers,Peaks
where RIGHT (PeakName,1) = Left (RiverName,1)
order by Mix asc
 
 --12
 use Diablo
 go

 select top 50 Name,FORMAT (start, 'yyyy-MM-dd')
 from Games
 where datename (year, start) between 2011 and 2012
 order by Start asc, Name asc
 

 --13
 use diablo

 select Username,
 SUBSTRING (Email, CHARINDEX('@', email,0)+1, len(email)-CHARINDEX('@', email,0)) 
 as 'Email Provider'
 from Users
 order by [Email Provider] asc
 
 --14
 select Username,IpAddress
 from Users
 where IpAddress like '___.1%.%.___'
 order by Username asc  


 --15
 select Name as Game,
 case 
 when DATEPART(hour, Start) between 0 and 11 then  'Morning'
 when DATEPART(hour, Start) between 12 and 17 then 'Afternoon'
 when DATEPART(hour, Start) between 18 and 23 then 'Evening'
 end as 'Part of day',
 case 
 when Duration < 3 then 'Extra Short'
 when Duration between 4 and 6 then 'Short'
 when Duration > 6 then 'Long'
 else 'Extra Long'
 end as 'Duration'
 from Games
 order by Name asc, [Part of day] asc,Duration asc

 --16


--17

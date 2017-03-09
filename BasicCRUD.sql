--2
use SoftUni
select * from Departments

--3
select Name from Departments 
 
 --4
 select FirstName, LastName, Salary 
 from Employees 

 --5
 select FirstName, MiddleName, LastName 
 from Employees

 --6
 select FirstName +'.' + LastName + '@softuni.bg'  
 as 'Full Email Address' 
 from Employees

 --7
 select distinct e.Salary from Employees as e

 --8
 select * from Employees
 where JobTitle = 'Sales Representative'

 --9
select e.FirstName, e.LastName, e.JobTitle
from Employees as e
where Salary between 20000 and 30000

--10
use SoftUni
select
concat (e.FirstName, ' ', e.MiddleName,' ',e.LastName)
as 'Full Name',
e.Salary
from Employees as e
where e.Salary = 25000 or e.Salary =14000 or e.Salary = 12500 or e.Salary = 236000
---where salari in (25000, 14000, 12500 or 23600)

--11
select e.FirstName,e.LastName 
from Employees as e
where e.ManagerID is null

--12
select e.FirstName, e.LastName, e.Salary 
from Employees as e
where e.Salary > 50000 order by Salary desc

--13
select top 5 e.FirstName, e.LastName, e.Salary
from Employees as e 
order by Salary desc

--14
select e.FirstName, e.LastName 
from Employees as e
where e.DepartmentID != 4

--15
select *from Employees
order by Salary desc, FirstName asc, LastName desc, MiddleName asc

--16

--17

--18
use SoftUni
select distinct e.JobTitle 
from Employees as e

--19
select top 10 * from Projects as p
order by StartDate, Name

--20
select top 7 e.FirstName, e.LastName,e.HireDate 
from Employees as e
order by HireDate desc

--21
update Employees
set Salary =  Salary*1.12
where DepartmentID =1 or DepartmentID = 2 or DepartmentID = 4 or DepartmentID = 11

select Salary from Employees

use Geography

--22
select PeakName from Peaks

--23
select top 30 c.CountryName, c.Population 
from Countries as c
where ContinentCode = 'EU'
order by Population desc

--24
use Geography
select c.CountryName, c.CountryCode,
       case
	       when c.CurrencyCode = 'EUR' then 'EURO'
		   else 'Not Euro'
	   end as 'Curency'
from Countries as c
order by CountryName asc;



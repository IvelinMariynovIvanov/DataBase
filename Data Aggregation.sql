--1
use Gringotts
select  count(*) as Count
 from WizzardDeposits 

 --2
 select MAX(MagicWandSize) as LongestMagicWand
 from WizzardDeposits

 --3
 select DepositGroup,
 max (MagicWandSize) as LongestMagicWand
 from WizzardDeposits
 group by DepositGroup
 order by LongestMagicWand asc


 --4
 select DepositGroup
 from WizzardDeposits
 group by DepositGroup
 order by AVG (MagicWandSize) asc
 
 --5
 select DepositGroup,
 sum (DepositAmount) as TotalSum
 from WizzardDeposits
 group by DepositGroup


 --6
 select DepositGroup,
 sum (DepositAmount) as TotalSum 
 from WizzardDeposits
 where MagicWandCreator = 'Ollivander family'
 group by DepositGroup

 --7
  select DepositGroup,
  sum (DepositAmount) as TotalSum
  from WizzardDeposits
  where MagicWandCreator = 'Ollivander family'
  group by DepositGroup
  having sum (DepositAmount) < 150000
  order by sum (DepositAmount) desc

  --8
  select distinct
  DepositGroup,
  MagicWandCreator,
  MIN (DepositCharge) as MinDepositCharge
  from WizzardDeposits
  group by DepositGroup, MagicWandCreator
  order by MagicWandCreator asc, DepositGroup asc

  --9
  
  select case
  when age <=10 then '[0-10]'
  when age <=20 then '[11-20]'
  when age <=30 then '[21-30]'
  when age <=40 then '[31-40]'
  when age <=50 then '[41-50]'
  when age <=60 then '[51-60]'
  when age >60 then '61+'
  end as Agegroup,
  count (*) as WizardCount
  from WizzardDeposits
  group by case
  when age <=10 then '[0-10]'
  when age <=20 then '[11-20]'
  when age <=30 then '[21-30]'
  when age <=40 then '[31-40]'
  when age <=50 then '[41-50]'
  when age <=60 then '[51-60]'
  when age >60 then '61+'
		END

 --10
 select LEFT (FirstName,1) as firstLetter,
 count (*)
  from WizzardDeposits 
  where DepositGroup = 'Troll Chest'
  group by LEFT (FirstName,1)
  order by LEFT (FirstName,1) asc

  select distinct LEFT (FirstName,1)
  from WizzardDeposits
    where DepositGroup = 'Troll Chest'

--11
select 
DepositGroup,
AVG (DepositInterest) as AverageInterest,
case
when IsDepositExpired = 'true' then '1'
else '0'
end as  IsDepositExpired
 from WizzardDeposits
 where DATEPART(YEAR, DepositStartDate) >= 1985
 group by DepositGroup,IsDepositExpired
 order by DepositGroup desc, IsDepositExpired asc

 --12

 use SoftUni

 select DepartmentID,
  min (salary) as MinSalary
  from Employees
  where DepartmentID in (2,5,7)
  and datepart (year, HireDate) >= 2000
  group by DepartmentID


  --14
  
  select * into newtable 
  from Employees
  where Salary > 30000

  delete from newtable
  where ManagerID= 42

  update newtable
  set Salary = Salary + 5000
where DepartmentID=1 

select DepartmentID,
avg (Salary) as AvgSalry
 from newtable
 group by DepartmentID
 order by DepartmentID
 

 --15
 select DepartmentID,
 MAX (Salary) as MaxSalary
  from Employees
  group by DepartmentID
  having max (Salary) <30000 or MAX (Salary) >70000

  --16
  select  
  count (*) as count
  from Employees
  where ManagerID is null
  
  --17
   SELECT DISTINCT sal.DepartmentId, sal.Salary FROM
(SELECT e.DepartmentId, e.Salary, 
DENSE_RANK() OVER (PARTITION BY e.DepartmentID ORDER BY e.Salary DESC) AS SalaryRank
   FROM [dbo].[Employees] AS e) AS sal
  WHERE sal.SalaryRank = 3

  --18

  select top 10 FirstName,Salary,Employees.DepartmentID
   from  Employees,
   ( select  DepartmentId,
   AVG (Salary) as AvgSalary
  from Employees
  group by DepartmentID) as avgsal
  where  Salary > avgsal.AvgSalary and Employees.DepartmentID = avgsal.DepartmentID
  order by DepartmentID





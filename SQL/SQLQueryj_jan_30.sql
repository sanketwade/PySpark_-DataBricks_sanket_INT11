use AdventureWorks2022;

-- SELECT name FROM sys.tables


SELECT 
	* 
	FROM
	
	HumanResources.Employee;


SELECT 
	* 
	FROM
	
	HumanResources.Employee

	where MaritalStatus ='M';

	-- find all employees under job title Marketing

select *
	from HumanResources.Employee
	where JobTitle like  'marketing%' ;

select * 
	from HumanResources.Employee
	where JobTitle = 'Marketing Manager' or JobTitle =  'Marketing Specialist';

select *
	from HumanResources.Employee
	where JobTitle in ('marketing manager','Marketing Specialist','Marketing Assistant');

select  count(*) from
	HumanResources.Employee
	where Gender = 'M';

select  count(MaritalStatus) from
	HumanResources.Employee
	where Gender = 'Unmarried';


-- Find the employee having salaried flag as 1
-- find the employeeds having vacaation hr more than 70

select count(*) from
	HumanResources.Employee
	where SalariedFlag = '1';


select count(*) from
HumanResources.Employee
where VacationHours > 70;

select count(*) from
HumanResources.Employee
where VacationHours > 70  and VacationHours < 90;

select * from
HumanResources.Employee
where JobTitle  like '%technician%'

select NationalIDNumber, JobTitle, MaritalStatus, Gender from,
HumanResources.Employee
where JobTitle like '%marketing%';


select MAX(VacationHours),
		Min(SickLeaveHours)
from HumanResources.Employee;



-- find all emp from production department

select * from HumanResources.Department
		where  name = 'Production';

select * from HumanResources.Employee
where BusinessEntityID in
(select BusinessEntityID 
from HumanResources.EmployeeDepartmentHistory
where DepartmentID = 7)


-- find all department under group research and dev
-- find all emp under research and dev

select * from HumanResources.Department
where GroupName like '%Research and Development%'

(select BusinessEntityID from HumanResources.EmployeeDepartmentHistory
where DepartmentID in

(select DepartmentID from HumanResources.Department
where GroupName = 'Research and Development'));


select * from HumanResources.Employee
where BusinessEntityID in
(select BusinessEntityID from HumanResources.EmployeeDepartmentHistory
where DepartmentID in
(select DepartmentID from HumanResources.Department
where GroupName='Research and Development'));

select * from HumanResources.Employee;


select * from HumanResources.EmployeeDepartmentHistory;


select * from HumanResources.Department;
select * from HumanResources.Employee where BusinessEntityID in
(select BusinessEntityID from HumanResources.EmployeeDepartmentHistory where DepartmentID in
(select DepartmentID from HumanResources.Department where GroupName='Research and Development'))


-- find all employees who work in day shift


select * from HumanResources.shift;
select * from HumanResources.Employee;
select * from HumanResources.JobCandidate;
select * from HumanResources.EmployeePayHistory;


select count(*) from HumanResources.Employee where BusinessEntityID in 
(select BusinessEntityID from HumanResources.EmployeeDepartmentHistory
where ShiftID in
(select ShiftID from HumanResources.Shift 
where name = 'Day'
))

-- find all employees where pay frequency is 1 --pay

select *  from HumanResources.Employee
where BusinessEntityID in
(select BusinessEntityID from HumanResources.EmployeePayHistory
where PayFrequency = 1)


select count(*)from HumanResources.Employee
where BusinessEntityID in
(select BusinessEntityID from HumanResources.EmployeePayHistory
where PayFrequency = 1)




-- find candidate who are not in place
select * from HumanResources.JobCandidate
where BusinessEntityID is null;

select * from HumanResources.JobCandidate
where BusinessEntityID in (
select BusinessEntityID from
HumanResources.Employee);


-- find the address of employee


select * from Person.Address
select * from HumanResources.Employee

select * from Person.Address 

where AddressID in(
select AddressID from Person.BusinessEntityAddress
where BusinessEntityID in(
select BusinessEntityID from HumanResources.Employee));


SELECT 
    e.BusinessEntityID,
    e.NationalIDNumber,
    p.FirstName, 
    p.LastName, 
    (SELECT a.AddressLine1 
     FROM Person.Address a
     JOIN Person.BusinessEntityAddress bea 
         ON a.AddressID = bea.AddressID
     WHERE bea.BusinessEntityID = e.BusinessEntityID) AS AddressLine1,
    (SELECT a.AddressLine2 
     FROM Person.Address a
     JOIN Person.BusinessEntityAddress bea 
         ON a.AddressID = bea.AddressID
     WHERE bea.BusinessEntityID = e.BusinessEntityID) AS AddressLine2,
    (SELECT a.City 
     FROM Person.Address a
     JOIN Person.BusinessEntityAddress bea 
         ON a.AddressID = bea.AddressID
     WHERE bea.BusinessEntityID = e.BusinessEntityID) AS City,
    (SELECT sp.Name 
     FROM Person.Address a
     JOIN Person.StateProvince sp 
         ON a.StateProvinceID = sp.StateProvinceID
     JOIN Person.BusinessEntityAddress bea 
         ON a.AddressID = bea.AddressID
     WHERE bea.BusinessEntityID = e.BusinessEntityID) AS StateProvince,
    (SELECT a.PostalCode 
     FROM Person.Address a
     JOIN Person.BusinessEntityAddress bea 
         ON a.AddressID = bea.AddressID
     WHERE bea.BusinessEntityID = e.BusinessEntityID) AS PostalCode
FROM HumanResources.Employee e
JOIN Person.Person p 
    ON e.BusinessEntityID = p.BusinessEntityID;






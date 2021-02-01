use WFA3DotNet

---Date and Time Built in Functions
SELECT SYSDATETIME()       AS 'DateAndTime';        -- return datetime      
SELECT SYSDATETIMEOFFSET() AS 'DateAndTime+Offset'; -- datetimeoffset
SELECT SYSUTCDATETIME()    AS 'DateAndTimeInUtc';   -- returns datetime
SELECT CURRENT_TIMESTAMP AS 'DateAndTime';   
SELECT GETDATE()         AS 'DateAndTime';    
SELECT GETUTCDATE()      AS 'DateAndTimeUtc'; 
SELECT DATENAME(YEAR, GETDATE())        AS 'Year';        
SELECT DATENAME(QUARTER, GETDATE())     AS 'Quarter';     
SELECT DATENAME(MONTH, GETDATE())       AS 'Month';       
SELECT DATENAME(DAYOFYEAR, GETDATE())   AS 'DayOfYear';   
SELECT DATENAME(DAY, GETDATE())         AS 'Day';         
SELECT DATENAME(WEEK, GETDATE())        AS 'Week';        
SELECT DATENAME(WEEKDAY, GETDATE())     AS 'WeekDay';     
SELECT DATENAME(HOUR, GETDATE())        AS 'Hour';        
SELECT DATENAME(MINUTE, GETDATE())      AS 'Minute';      
SELECT DATENAME(SECOND, GETDATE())      AS 'Second';      
SELECT DATENAME(MILLISECOND, GETDATE()) AS 'MilliSecond'; 
SELECT DATENAME(MICROSECOND, GETDATE()) AS 'MicroSecond'; 
SELECT DATENAME(NANOSECOND, GETDATE())  AS 'NanoSecond';  
SELECT DATENAME(ISO_WEEK, GETDATE())    AS 'Week'; 
SELECT DATEDIFF(DAY, 2019-31-01, 2019-01-01)      AS 'DateDif'
--Math built in Functions

--Absolute value of x
Select abs(-6) as absolute;
--This method returns 1 if X is positive, -1 if it is negative and 0 if the value of X is 0
Select sign(10) as signs;

--This function returns the value of x raised to the power of Y 
Select power(2,5);


--This function returns the value of X rounded off to the whole integer that is nearest to it
Select round(5,7);
--This function returns the square root of X
Select sqrt(9);
--This function accepts an angle in radians as its parameter and returns its Sine value
Select sin(0);
select * from EmployeeTab
select Avg(salary) as AverageSalary from employeetab
select Min(salary) as MinSalary from EmployeeTab 

select ROUND(23334.5667,2) as RondedValue


---String functions

SELECT ASCII('A') , ASCII('AB') , ASCII('B') 

SELECT CONCAT('Hello',' World')
---CONCAT_WS() is very similar to CONCAT() function, but it allows the user to specify a separator between the concatenated input strings
SELECT CONCAT_WS(',','United States','New York')


--They are used to extract a specific number of characters from the left-side or right-side of a string
SELECT LEFT('Hello World',5) , RIGHT('Hello Wolrd',5)

SELECT LOWER('Hello World') , UPPER('Hello World')


--used to remove additional spaces from the left side or right side of an input string
SELECT RTRIM('Hello  ') , LTRIM('    World')

--Returns the character based on the ASCII code
select char(67)
--Returns the length of a string
select len('Hello')
use WFA3DotNet
create table tblCustomer(
     CustomerID int not null primary key,
	 CustName varchar(20),
	 dob date,
	 city varchar(20)
	 )
insert into tblCustomer values ('123456', 'David Letterman', '04-Apr-1949', 'Hartford'); 

insert into tblCustomer values ('123457', 'Barry Sanders', '12-Dec-1967','Detroit'); 

insert into tblCustomer values ('123458', 'Jean-Luc Picard', '9-Sep-1940', 'San Francisco'); 

insert into tblCustomer values ('123459', 'Jerry Seinfeld', '23-Nov-1965','New York City'); 

insert into tblCustomer values ('123460', 'Fox Mulder', '05-Nov-1962', 'Langley'); 

insert into tblCustomer values ('123461', 'Bruce Springsteen', '29-Dec-1960','Camden'); 

insert into tblCustomer values ('123462', 'Barry Sanders', '05-Aug-1974','Martha''s Vineyard'); 

insert into tblCustomer values ('123463', 'Benjamin Sisko', '23-Nov-1955','San Francisco'); 

insert into tblCustomer values ('123464', 'Barry Sanders', '19-Mar-1966','Langley'); 

insert into tblCustomer values ('123465', 'Martha Vineyard', '19-Mar-1963','Martha''s Vineyard'); 

         select * from tblcustomer;    

create table TblAccount (
          Customerid int foreign key references tblcustomer(CustomerID),
		 AccountNumber varchar(20)  not null primary key, 
		 AccountTypeCode int,
		 
		 DateOpened date, 
		 
		Balance int,
		 ) 
		 drop table tblaccount
		 insert into tblAccount values 

('123456', '123456-1', 1, '04-Apr-1993', 2200.33); 

insert into tblAccount values 

('123456', '123456-2', 2, '04-Apr-1993', 12200.99); 

 

insert into tblAccount values 

('123457', '123457-1', 3, '01-JAN-1998', 50000.00); 

 

insert into tblAccount values 

('123458', '123458-1', 1, '19-FEB-1991', 9203.56); 

 

insert into tblAccount values 

('123459', '123459-1', 1, '09-SEP-1990', 9999.99); 

insert into tblAccount values 

('123459', '123459-2', 1, '12-MAR-1992', 5300.33); 

insert into tblAccount values 

('123459', '123459-3', 2, '12-MAR-1992', 17900.42); 

insert into tblAccount values 

('123459', '123459-4', 3, '09-SEP-1998', 500000.00); 

 

insert into tblAccount values 

('123460', '123460-1', 1, '12-OCT-1997', 510.12); 

insert into tblAccount values 

('123460', '123460-2', 2, '12-OCT-1997', 3412.33); 

 

insert into tblAccount values 

('123461', '123461-1', 1, '09-MAY-1978', 1000.33); 

insert into tblAccount values 

('123461', '123461-2', 2, '09-MAY-1978', 32890.33); 

insert into tblAccount values 

('123461', '123461-3', 3, '13-JUN-1981', 51340.67); 

 

insert into tblAccount values 

('123462', '123462-1', 1, '23-JUL-1981', 340.67); 

insert into tblAccount values 

('123462', '123462-2', 2, '23-JUL-1981', 5340.67); 

 

insert into tblAccount values 

('123463', '123463-1', 1, '1-MAY-1998', 513.90); 

insert into tblAccount values 

('123463', '123463-2', 2, '1-MAY-1998', 1538.90); 

 

insert into tblAccount values 

('123464', '123464-1', 1, '19-AUG-1994', 1533.47); 

insert into tblAccount values 

('123464', '123464-2', 2, '19-AUG-1994', 8456.47); 
select * from tblaccount

create table tblAccountType (
TypeCode int not null primary key,  
TypeDesc varchar(50)
) 
insert into tblAccountType values (1, 'Checking'); 

insert into tblAccountType values (2, 'Saving'); 

insert into tblAccountType values (3, 'Money Market'); 

insert into tblAccountType values (4, 'Super Checking'); 
select * from tblAccountType
select * from tblcustomer
select * from tblAccount
---Q1 Print customer id and balance of customers who have at least $5000 in any of their accounts.

select customerid,balance from tblaccount where balance>=5000

---Q2 Print names of customers whose names begin with a ‘B’
select custname from tblcustomer where CustName like 'B%'


--Q3 Print all the cities where the customers of this bank live

select custname,city from tblCustomer

--Q4 Use IN [and NOT IN] clauses to list customers who live in [and don’t live in] San Francisco or Hartford.

select custname,city from tblCustomer where city IN (select city from tblCustomer where city like 'san Francisco' or city like 'hartford')

select custname,city from tblCustomer where city not IN (select city from tblCustomer where city like 'san Francisco' or city like 'hartford')


--Q5 Show name and city of customers whose names contain the letter 'r' and who live in Langley

select custname,city from tblcustomer where custname like '%r%' and city like 'langley'

--Q6 How many account types does the bank provide?  

select * from TblAccountType
select count(typedesc) as accounttype from TblAccountType

--Q7Show a list of accounts and their balance for account numbers that end in '-1'

select accountnumber,balance from tblaccount where accountnumber like '%-1'

--Q8 Show a list of accounts and their balance for accounts opened on or after July 1, 1990
select * from tblaccount where datediff(day,'1990-07-01',dateopened)>0

--Q9 If all the customers decided to withdraw their money, how much cash would the bank need?  

select sum(balance) as balance from tblaccount

--Q10 List account number(s) and balance in accounts held by ‘David Letterman’.

select t1.custname,t2.accountnumber,t2.balance from tblCustomer as t1,tblaccount as t2 where t1.CustomerID=t2.customerid and t1.CustName like 'David Letterman'

--Q11 List the name of the customer who has the largest balance (in any account)
select  distinct  custname
	from TblCustomer ,TblAccount 
	where TblCustomer.CustomerID IN (select customerid
	from TblAccount where Balance IN(select Max(BAlance) from TblAccount
	group by AccountTypeCode) and TblAccount.CustomerID=TblCustomer.CustomerID)


select max(tblaccount.balance) from tblCustomer,tblaccount where tblcustomer.CustomerID=tblaccount.customerid group by  tblaccount.accounttypecode
select * from tblaccount;
select * from TblAccountType;
select * from tblCustomer;
select CustName from tblCustomer where customerid=(select customerid from tblaccount where balance=(select max(balance) from tblaccount)) 
--Q12 List customers who have a ‘Money Market’ account

select tblCustomer.CustName,TblAccountType.TypeDesc from tblCustomer,tblaccount,TblAccountType where tblcustomer.CustomerID=tblaccount.customerid and tblaccount.accounttypecode=TblAccountType.TypeCode and TypeDesc like 'Money Market'

--Q13 Produce a listing that shows the city and the number of people who live in that city

select city,count(city) as noofppl from tblCustomer group by city
select * from tblCustomer

--Q14 Produce a listing showing customer name, the type of account they hold and the balance in that account.
select custname,typedesc,balance from ((tblCustomer  join TblAccount  on tblcustomer.CustomerID=tblaccount.customerid) join TblAccountType on tblaccount.accounttypecode=TblAccountType.TypeCode)

--Q15 Produce a listing that shows the customer name and the number of accounts they hold.    

select tblcustomer.CustName,tblaccount.customerid,count(tblaccount.customerid) from (tblCustomer  join TblAccount  on tblcustomer.CustomerID=tblaccount.customerid) group by tblaccount.customerid,tblcustomer.custname

--Q16  Produce a listing that shows an account type and the average balance in accounts of that type. 

select TblAccountType.TypeDesc,tblaccount.accounttypecode,AVG(tblaccount.balance) as AVERAGE from TblAccount 
join TblAccountType on tblaccount.accounttypecode=TblAccountType.TypeCode 
group by tblaccount.accounttypecode,TblAccountType.TypeDesc

select * from TblAccountType


select * from tblaccount
select * from tblCustomer
select * from tblaccounttype
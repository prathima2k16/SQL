--Create a Database named BankDB
create database BankDB
use BankDB
--1. CustomersInfo with Auto gen CustomerID
-- (CustomerID(PK) , CustomerName, CustomerCity, CustomerAddress ,
-- CustomerMobileNo(U), PAN (U), CustomerPassword , CustomerEmailID (U) )
create table tbl_CustomerInfo
(
CustomerID int identity(1,1) primary key,
CustomerName varchar(100),
CustomerCity varchar(100),
CustomerAddress varchar(100),
CustomerMobileNo varchar(100) unique,
PAN varchar(100) unique,
CustomerPassword varchar(100),
CustomerEmailID varchar(100) unique
)
select *from tbl_CustomerInfo
insert tbl_CustomerInfo values('John','BGL','MGROAD','2178932','123','pass123','john@gmail.com')
insert tbl_CustomerInfo values('Jay','Pune','KGROAD','922596596','124','pass124','jay@gmail.com')
insert tbl_CustomerInfo values('kate','chennai','magadi','99258962813','125','pass125','kate@gmail.com')
insert tbl_CustomerInfo values('smith','BGL','jayanagar','9948634784','126','pass126','smith@gmail.com')
insert tbl_CustomerInfo values('vishal','Mumbai','KRpuram','9925896325','127','pass127','vishal@gmail.com')
insert tbl_CustomerInfo values('ryan','mumbai','indiranagar','99147896216','128','pass128','ryan@gmail.com')
insert tbl_CustomerInfo values('sai','chennai','kgf','948962552','129','pass129','sai@gmail.com')
insert tbl_CustomerInfo values('rosy','BGL','JPNagar','9548631518','130','pass130','rosy@gmail.com')
insert tbl_CustomerInfo values('afroz','Pune','BTM','91486301452','131','pass131','afroz@gmail.com')
insert tbl_CustomerInfo values('rak','BGL','Nspalya','24896301485','132','pass132','rak@gmail.com')

--2. AccountInfo with auto gen AccountID
-- (AccountID(PK),CustomerID(FK),AccountType,AccountBalance,AccountOpenDate,
--  AccountStatus(Open,Closed,Blocked))

create table tbl_AccountInfo
(
AccountID int identity(1000,1) primary key,
CustomerID int foreign key references tbl_CustomerInfo,
AccountType varchar(100),
AccountBalance int,
AccountOpenDate date,
AccountStatus varchar(100) 
)

select *from tbl_AccountInfo

insert tbl_AccountInfo values(1,'saving',10000,'12/2/2006','open')
insert tbl_AccountInfo values(1,'current',100,'10/15/2016','closed')
insert tbl_AccountInfo values(5,'saving',30000,'7/23/2018','blocked')
insert tbl_AccountInfo values(4,'saving',8000,'2/2/2019','open')
insert tbl_AccountInfo values(6,'current',90000,'3/16/2009','open')
insert tbl_AccountInfo values(1,'saving',900,'6/15/2013','blocked')
insert tbl_AccountInfo values(2,'current',44444,'1/22/2015','closed')
insert tbl_AccountInfo values(7,'saving',50000,'3/17/2018','open')
insert tbl_AccountInfo values(3,'current',800,'9/10/2009','open')
insert tbl_AccountInfo values(8,'current',25000,'8/27/2010','closed')
insert tbl_AccountInfo values(7,'saving',30000,'1/1/2019','open')
--3. TransactionInfo with Auto gen TransactionID
-- (TransactionID (PK),AccountID (FK),TransactionType (D,C),Amount (>0),TransactionDate)
create table tbl_TransationInfo
(
TransationID int identity(2000,1) primary key,
AccountID int foreign key references tbl_AccountInfo,
TransactionType varchar(100),
Amount int check(Amount>0),
TransationDate date
)

select *from tbl_TransationInfo
insert tbl_TransationInfo values(1000,'credit',1000,'1/1/2019')
insert tbl_TransationInfo values(1002,'debit',10000,'4/11/2018')
insert tbl_TransationInfo values(1009,'credit',5000,'2/2/2019')
insert tbl_TransationInfo values(1006,'debit',500,'3/23/2017')
insert tbl_TransationInfo values(1003,'credit',600,'1/27/2019')
insert tbl_TransationInfo values(1004,'credit',10000,'12/12/2018')
insert tbl_TransationInfo values(1001,'credit',1500,'1/11/2019')
insert tbl_TransationInfo values(1005,'debit',700,'7/6/2018')
insert tbl_TransationInfo values(1009,'credit',5000,'2/12/2019')
insert tbl_TransationInfo values(1006,'debit',900,'3/23/2018')
insert tbl_TransationInfo values(1009,'credit',1000,'2/1/2019')
insert tbl_TransationInfo values(1009,'debit',200,'2/3/2019')
insert tbl_TransationInfo values(1009,'credit',9000,'2/6/2019')
insert tbl_TransationInfo values(1009,'debit',800,'3/1/2019')

--1. Latest 5 transactions of an account (Enter Account ID as an Input)
Select *from tbl_Transationinfo where AccountID=1009 order by TransationDate desc

--2. Transaction between two dates of an account (Enter Account ID as an Input)
Select *from tbl_TransationInfo where AccountID=1009 and TransationDate between '1/1/2018' and '3/1/2019' 

--3. List of Accounts of a Customer (Enter Customer ID as an input)
Select *from tbl_AccountInfo where CustomerID=1

--4. List of customers(CustomerID,CustomerName,CustomerAddress,CustomerMobileNo, AccountID , AccountBalance)

Select tbl_CustomerInfo.CustomerID, tbl_CustomerInfo.CustomerName,tbl_CustomerInfo.CustomerAddress,
tbl_CustomerInfo.CustomerMobileNo,tbl_AccountInfo.AccountID,tbl_AccountInfo.AccountBalance
from tbl_CustomerInfo join tbl_AccountInfo on tbl_CustomerInfo.CustomerID=tbl_AccountInfo.CustomerID

--5. List of accounts with transactions (AccountID , AccountBalance , TransID , Amount, TransationType)

Select tbl_AccountInfo.AccountID,tbl_AccountInfo.AccountBalance,tbl_TransationInfo.TransationID,
tbl_TransationInfo.Amount,tbl_TransationInfo.TransactionType from tbl_AccountInfo join tbl_TransationInfo
 on tbl_AccountInfo.AccountID=tbl_TransationInfo.AccountID

 --6. List of customers with accounts and transations (CustomerID,CustomerName,CustomerAddress,
 --CustomerMobileNo, AccountID , AccountBalance,TransationID , Amount, TransationType)
 Select tbl_CustomerInfo.CustomerID,tbl_CustomerInfo.CustomerName,tbl_CustomerInfo.CustomerAddress,
 tbl_CustomerInfo.CustomerMobileNo,tbl_AccountInfo.AccountID,tbl_AccountInfo.AccountBalance,
 tbl_TransationInfo.TransationID,tbl_TransationInfo.Amount,tbl_TransationInfo.TransactionType
 from tbl_CustomerInfo join tbl_AccountInfo on tbl_CustomerInfo.CustomerID=tbl_AccountInfo.CustomerID 
 join  tbl_TransationInfo on tbl_AccountInfo.AccountID=tbl_TransationInfo.AccountID

 --7. List of Customers who have accounts
 Select *from tbl_CustomerInfo where CustomerID in(Select CustomerID from tbl_AccountInfo )

 --8. List of Customer who have no account
 Select *from tbl_CustomerInfo where CustomerID not in(Select CustomerID from tbl_AccountInfo)

 --9. List of Account which has transaction
 Select *from tbl_AccountInfo where AccountID  in(Select AccountID from tbl_TransationInfo)
 
 --10. List of Account which has no transaction
 --insert tbl_AccountInfo values(9,'saving',30000,'1/1/2019','open')
 Select *from tbl_AccountInfo where AccountID not in(Select AccountID from tbl_TransationInfo)

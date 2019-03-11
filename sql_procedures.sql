use batch10db

select * from tbl_Employees

alter proc p_employees(@city varchar(100))
as
begin 
select * from tbl_Employees where EmployeeCity=@city 
end


exec p_employees 'BGL'

select * from tbl_accounts

create proc p_addacount(@name varchar(100),@balance int)
as
begin
insert tbl_accounts values(@name,@balance)
return @@identity
end

declare @id int
exec @id=p_addacount 'john',20000
select @id 

create proc p_updateAccount(@id int,@amt int)
as
begin
update tbl_accounts set AccountBalance =AccountBalance +@amt
where AccountID =@id
return @@rowcount
end

declare @rcount int
exec @rcount=p_updateaccount 1001,2000
select @rcount

Create proc p_delectaccount(@id int)
as
begin
delete tbl_accounts where AccountID =@id
return @@rowcount
end

declare @count int
exec @count= p_delectaccount 1001
select @count

create proc p_update(@id int,@name varchar(100),@balance int)
as
begin
declare @count int=0
update tbl_Employees set EmployeeName=@name where employeeid=@id
set @count =@count +@@ROWCOUNT 
update tbl_accounts set accountbalance=@balance where accountid=@id
set @count =@count +@@ROWCOUNT 
return @count
end

declare @c int
exec @c =p_update 100,'ABCD',50000
select @c



create proc p_accounts
as
begin
select * from tbl_accounts 
end

exec p_accounts 


create proc p_accountdetail(@id int)
as
begin
select * from tbl_accounts where AccountID =@id
end

exec p_accountdetail 1001

create proc p_employeename(@id int,@name varchar(100) output)
as
begin
select @name =employeename from tbl_Employees where Employeeid=@id
end

declare @name varchar(100)
exec p_employeename 100,@name output
select @name


create proc p_search(@key varchar(100))
as
begin
select * from tbl_Employees where Employeeid like @key or EmployeeName like '%'+@key+'%'
end

exec p_search 'AB'












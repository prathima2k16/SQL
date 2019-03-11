create database customers_ado
use  customers_ado

create table tbl_customers
(
Customerid int identity(100,1) primary key,
customername varchar(100),
customerPassword varchar(100),
customerCity varchar(100),
customerMobileNo varchar(100),
customerEmailId varchar(100)
)

create proc p_addCustomer(@name varchar(100),@pwd varchar(100),@city varchar(100),
		@mobileno varchar(100),@emailId varchar(100))
as 
begin 
insert tbl_customers values(@name,@pwd,@city,@mobileno,@emailId)
return @@identity
end

create proc p_find(@id int)
as
begin
select * from tbl_customers where customerid=@id
end

create proc p_search(@key varchar(100))
as
begin
select * from tbl_customers where customerid like @key or customername like '%'+@key+'%' or 
		customercity like '%'+@key+'%' or customerMobileNo like '%'+@key+'%' or customerEmailId 
		like '%'+@key+'%' 
end

create proc p_Login(@id int,@pwd varchar(100))
	as
	begin
	declare @count int
	select @count =count(*) from tbl_customers
	where Customerid=@id and customerPassword=@pwd
	return @count
	end

create proc p_update(@id int,@name varchar(100),@pwd varchar(100),@city varchar(100),
					@mobileNo varchar(100),@emailId varchar(100))
					as
					begin
					update tbl_customers set customername=@name,customerCity=@city,customerPassword =@pwd,
					customerMobileNo=@mobileNo,customerEmailId=@emailId where Customerid=@id
					return @@rowcount
					end

create proc p_delete(@id int)
as
begin
delete tbl_customers where customerid=@id
return @@identity
end

create proc p_getname(@id int)
as
begin
select customername from tbl_customers where Customerid=@id
end

create proc p_getids
as
begin
select customerid,customername,customercity,customerMobileNo,customerEmailId from tbl_customers 
end
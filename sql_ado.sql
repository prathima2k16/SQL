create database b10_ado
use b10_ado

create table tbl_employees
(
employeeid int identity (1000,1) primary key,
employeename varchar(100) not null,
employeepassword varchar(100)not null,
Employeecity varchar(100)
)

create proc p_addemployee
	(@name varchar(100),@pwd varchar(100),@city varchar(100))
	as
	begin
	insert tbl_employees values(@name,@pwd,@city)
	return @@identity 
	end

create proc p_find(@id int)
	as
	begin
	select * from tbl_employees where employeeid=@id
	end

create proc p_search(@key varchar(100))
	as
	begin
	select * from tbl_employees where employeeid like @key or employeename like '%'+@key+'%' or
												employeecity like '%'+@key+'%'
	end

create proc p_login(@id int,@pwd varchar(100))
		as
		begin
		declare @count int
		select @count=count(*) from tbl_employees 
		where employeeid =@id and employeepassword =@pwd
		return @count
		end

create proc p_update(@id int,@name varchar(100),@city varchar(100))
		as
		begin
		update tbl_employees set employeename=@name,Employeecity=@city where employeeid=@id
		return @@rowcount
		end

create proc p_delete(@id int)
		as
		begin
		delete tbl_employees where employeeid =@id
		return @@rowcount
		end

create proc p_getname(@id int)
	as
	begin
	select employeename from tbl_employees where employeeid=@id 
	end

create proc p_getids
	as
	begin
	select employeeid,employeename  from tbl_employees 
	end
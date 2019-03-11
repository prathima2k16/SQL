create database b10_data_integrity

use b10_data_integrity



create table tbl_items
(
itemid int identity(1,1) primary key,
itemname varchar(100)not null,
itemprice int check(itemprice>0) not null
)

create table tbl_orders
(
orderid int identity(1000,1) primary key,
customerid varchar(100) foreign key references tbl_customers(customerid) not null,
ordercity varchar(100) null,
paymenttype varchar(100) check(paymenttype in ('cash' ,'cod','card'))not null,
orderdate datetime not null
)
create table tbl_customers
(
customerid varchar(100) primary key,--should be email id
customername varchar(100) not null,
customercity varchar(1000) not null,
customermobileno varchar(100)not null,--unique
)
create table tbl_order_items
(
orderid int foreign key references tbl_orders(orderid),
itemid int foreign key references tbl_items(itemid),
itemqty int check(itemqty>0) not null,
itemprice int check(itemprice>0) not null,
primary key(orderid,itemid)
)

insert tbl_customers values('prathima@gmial.com','prrathima','bgl','8885999109')
insert tbl_customers values('prathima@gmail.com','pooja','chennai','9945367282')
insert tbl_customers values('poooja@gmail.com','priya','hyd','3454344567')
insert tbl_customers values('josh@gmail.com','josh','pune','0987678987')
insert tbl_customers values('josh@gmail.com','jodh','hyd','8675435698')
insert tbl_customers values('pp&gmail.com','pp','pune','2345678945')

select * from tbl_customers

insert tbl_items values('prathima',30)
insert tbl_items values('watch',5000)
insert tbl_items values('ring',40000)
insert tbl_items values('tv',50000)
insert tbl_items values('fridge',20000)

select * from tbl_items

insert tbl_orders values('prathima@gmail.com','','cod','12/3/2018')
insert tbl_orders values('josh@gmail.com','','cash','2/4/2018')
insert tbl_orders values('poooja@gmail.com','','cash','11/2/2019')
insert tbl_orders values('poooja@gmail.com','','cod','10/2/2019')
insert tbl_orders values('pp&gmail.com','','cash','10/3/2018')

select * from tbl_orders

insert tbl_order_items values(1000,1,6,2000)
insert tbl_order_items values(1001,1,4,3000)
insert tbl_order_items values(1001,3,5,1000)
insert tbl_order_items values(1001,4,5,4000)
insert tbl_order_items values(1000,5,3,1000)
insert tbl_order_items values(1000,4,3,2000)
insert tbl_order_items va

--subqueries

select * from tbl_customers where customerid
in (select customerid from tbl_orders)


select * from tbl_customers where customerid
not in (select customerid from tbl_orders)

select * from tbl_items where itemid
in (select itemid from tbl_order_items)

select * from tbl_items where itemid 
not in(select itemid from tbl_order_items)

select top 1 * from tbl_items order by itemprice desc

select top 1 * from tbl_items where itemid in (select top 2 itemid from tbl_items
 order by itemprice desc)order by itemprice asc

 select top 1 * from tbl_items where itemid in (select top 3 itemid from tbl_items 
 order by itemprice desc)order by itemprice asc


 select top 1 * from tbl_items where itemid in (select top 4 itemid from tbl_items
 order by itemprice desc)order by itemprice asc


 select * from tbl_orders
 select * from tbl_order_items
--joins

 select  tbl_orders .orderid,tbl_orders.ordercity,tbl_orders.orderdate,
 tbl_order_items.orderid,tbl_order_items.itemprice,tbl_order_items.itemqty,
 tbl_items.itemname
 from tbl_orders join tbl_order_items on 
 tbl_orders.orderid=tbl_order_items.orderid
 join tbl_items 
 on 
 tbl_order_items .itemid =tbl_items.itemid

 select tbl_Orders.orderid,tbl_orders.ordercity,tbl_orders .ordercity,tbl_orders.customerid,
 tbl_customers.customerid,tbl_customers.customername,tbl_customers.customermobileno,tbl_customers.customerid,

 from tbl_orders join tbl_customers on
 tbl_orders.customerid=tbl_customers.customerid

 select tbl_customers.customerid,tbl_customers.customername,tbl_customers.customermobileno,
 tbl_orders.orderid,tbl_orders.ordercity,tbl_orders.orderdate
 from tbl_customers left outer join tbl_orders on 
 tbl_customers.customerid=tbl_orders.customerid



select tbl_customers.customerid,tbl_customers.customername,tbl_customers.customermobileno,
 tbl_orders.orderid,tbl_orders.ordercity,tbl_orders.orderdate
 from tbl_customers right outer join tbl_orders on 
 tbl_customers.customerid=tbl_orders.customerid

 select tbl_customers.customerid,tbl_customers.customername,tbl_customers.customermobileno,
 tbl_orders.orderid,tbl_orders.ordercity,tbl_orders.orderdate
 from tbl_customers full join tbl_orders on 
 tbl_customers.customerid=tbl_orders.customerid

 select tbl_customers.customerid,tbl_customers.customername,tbl_customers.customermobileno,
 tbl_orders.orderid,tbl_orders.ordercity,tbl_orders.orderdate
 from tbl_customers full join tbl_orders on 
 tbl_customers.customerid=tbl_orders.customerid

 where tbl_orders.ordercity='pune'

 --cross join:
 select * from tbl_customers cross join tbl_orders

 --self join


 create table tbl_join
 ( 
 Employeeid int primary key,
 Name varchar(100) ,
 City varchar(100)not null,
 managerid int
  foreign key references tbl_join(employeeid ) 
 )

 insert tbl_join values(1,'john','BGL',null)
 insert tbl_join values(2,'smith','hyd',1)
select * from tbl_join 

 select e.Employeeid,e.name,e.managerid,m.name
 from tbl_join e left outer  join tbl_join m on
 e.managerid =m.Employeeid

 --Tsql(transact SQL)

 declare @count int=0
 set @count=100
 select @count
if (@count>0)
begin
select 'More than 0'
end
else
begin
select 'Less than 0'
end


declare @c int
while(@c<0)
begin
select @c
set @c=@c+1
end






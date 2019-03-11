create database food_DB

use food_DB

--Create a Table called Restaurants
--RestaurantID(PK,Auto), RestaurantName , RestaurantAddress , RestaurantCity , ContactNo

create table tbl_restaurants
(
restaurantid int identity(10,1) primary key,
restaurantName varchar(100),
restaurantaddress varchar(100),
restaurantcity varchar(100),
contactno varchar(100)
)
select * from tbl_restaurants
insert tbl_restaurants values('paradise','bgl','bgl','2234323')
insert tbl_restaurants values('mrcb','gachibowli','hyd','4865655')
insert tbl_restaurants values('mandi','secundrabad','hyd','28454552')
insert tbl_restaurants values('shadab','charminar','hyd','2246255')

--Create a Table called RMenuItems
	--MenuID (PK , Auto) ,RestID (FK), MenuName , MenuType , MenuCategory , MenuPrice , MenuDesc
	 create table tbl_RmenuItems
	 (
	 menuid int identity(20,1) primary key,
	 restaurantid int foreign key references tbl_restaurants(restaurantid) not null, 
	 menuname varchar(100) ,
	 menutype varchar(100),
	 menucategory varchar(100),
	 menuprice int ,
	 menudesc varchar(100)
	 )
select * from tbl_RmenuItems
insert tbl_RmenuItems values('11','non-veg','andhra-food','main ','2000','chicken')
insert tbl_RmenuItems values('11','non-veg','godavari food','starters ','3000','chicken')
insert tbl_RmenuItems values('12','veg','hyd','main ','1000','pannir')
insert tbl_RmenuItems values('13','veg','bgl','dessert ','6000','avacado')


--Create a Table called Customers
	--CustomerID (PK, Email) , CustomerName , CustomerCity , CustomerDOB , CustomerGender , CustomerPassword
create table tbl_customers
(
customerid varchar(100) primary key,--email
customername varchar(100),
customercity varchar(100),
customerdob varchar(100),
customergender varchar(100),
customerpassword varchar(100),
)
select * from tbl_customers

insert tbl_customers values('prati@gmail.com','prathima','hyd','3/12/1997','female','nanna')
insert tbl_customers values('priya1@gmail.com','priya','bgl','3/12/1997','female','23565426')
insert tbl_customers values('smith123@gmail.com','smith','kolkatta','8/2/1993','male','2365')
insert tbl_customers values('johngowd@gmail.com','john','pune','8/25/1990','male','nanna')


--Create a table called Orders
--OrderID (PK, Auto) , CustomerID (FK) , OrderDate , DeliveryAddress , OrderStatus

create table tbl_orders
(
orderid int identity(30,1) primary key,
customerid varchar(100) foreign key references tbl_customers(customerid) not null,
orderdate  varchar(100),
deliveryaddress varchar(100),
orderstatus varchar(100)
)
select * from tbl_orders
insert tbl_orders values('prati@gmail.com','1/2/2019','chanchala pg','delivered')
insert tbl_orders values('priya1@gmail.com','3/2/2019','exotica pg','delivered')
insert tbl_orders values('smith123@gmail.com','2/24/2019','btm','cancled')
insert tbl_orders values('johngowd@gmail.com','11/2/2018','manyatha','cancled')


--Create a table called OrderMenus
	--OrderID (FK) , MenuID(FK) , MenuQty , MenuPrice 
	--Note : OrderID & MenuID should be together primary key.

create table tbl_ordermenus
(
orderid int foreign key references tbl_orders(orderid) not null,
menuid int foreign key references tbl_RmenuItems(menuid) not null,
menuqty int,
menuprice int ,
primary key(orderid,menuid)
)
select * from tbl_ordermenus

insert tbl_ordermenus values(30,20,4,500)
insert tbl_ordermenus values(30,22,2,700)
insert tbl_ordermenus values(33,21,3,2500)
insert tbl_ordermenus values(32,20,6,1500)

--1. Show the list of Restaurant of specific city
select * from tbl_restaurants where restaurantcity='bgl'

--2. Show the list of all Restaurants along with menus (RestaurantID , RestaurantName ,MenuID , MenuName ,
-- MenuPrice)
select tbl_restaurants .restaurantid,tbl_restaurants .restaurantName,
tbl_RmenuItems.restaurantid,tbl_RmenuItems.menuid,tbl_RmenuItems.menuname,tbl_RmenuItems.menuprice
from tbl_restaurants join tbl_RmenuItems
on tbl_restaurants.restaurantid=tbl_RmenuItems.restaurantid

--3. Show the list of  Restaurants along with menus (RestaurantID , RestaurantName ,MenuID , MenuName , MenuPrice)
-- of specific city
select tbl_restaurants.restaurantid,tbl_restaurants.restaurantName,
tbl_RmenuItems.restaurantid,tbl_RmenuItems.menuid,tbl_RmenuItems.menuname,tbl_RmenuItems.menuprice
from tbl_restaurants join tbl_RmenuItems
on tbl_restaurants.restaurantid=tbl_RmenuItems.restaurantid
where restaurantcity='bgl'

--4. Show the list of Orders of a specific customer (based on customerid)
select * from tbl_orders where customerid ='prati@gmail.com'

--5. Show the list of orders along with ordermenus (OrderID , CustomerID , OrderDate , MenuID , MenuQty , MenuPrice)
select tbl_orders .orderid,tbl_orders.customerid,tbl_orders.orderdate,
tbl_ordermenus.orderid,tbl_ordermenus.menuid,tbl_ordermenus.menuqty,tbl_ordermenus.menuprice
from tbl_orders join tbl_ordermenus on
tbl_orders.orderid=tbl_ordermenus.orderid

--6. Show the list of latest 5 orders of a specific customer (based on CustomerID)
select top 5 * from tbl_orders where customerid='priya1@gmail.com'

--7. Show the list of menus in price ascending order.
select * from tbl_ordermenus  order  by menuprice asc

--8. Show the list of cities along with number of restaurants
select restaurantcity, count(*) from tbl_restaurants group by restaurantcity

--9. Show the list of customers who never placed any order.
select * from  tbl_customers where customerid not in(select orderid from tbl_orders)

----10. Show the menuitem details which has highest menuprice.(First)
select top 1 * from tbl_ordermenus order by menuprice  asc

--11. Show the menuitem details which has second highest menuprice.(Second)
select top 1 * from tbl_ordermenus where menuprice  in (select top 2 menuprice  from tbl_ordermenus
 order by menuprice desc)order by menuprice  asc





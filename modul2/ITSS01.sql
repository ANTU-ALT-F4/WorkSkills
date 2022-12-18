﻿CREATE DATABASE ITSS01DATA
GO
USE ITSS01DATA
GO
CREATE TABLE suppliers
( id int identity(1,1) primary key,
  name varchar(100)
)
go
 insert into suppliers (name) values('suppliers_1'),
									('suppliers_2'),
									('suppliers_3'),
									('suppliers_4'),
									('suppliers_5')
go
CREATE TABLE warehouses
( id int identity(1,1) primary key,
  name varchar(100)
)
go
 insert into warehouses(name) values ('warehouses_1'),
								('warehouses_2'),
								('warehouses_3'),
								('warehouses_4'),
								('warehouses_5')
go
CREATE TABLE transactiontype(
	id int identity(1,1) primary key,
	name varchar(100)
)
go
insert into transactiontype(name) values ('Purchase Order'),
											('Warehouse Management')
											
go
CREATE TABLE parts
(	id int identity(1,1) primary key,
	name varchar(100),
	effectivelife varchar(100),
	batchnumberhasrequired int,
	minimumamount int
)
go
insert into parts(name, effectivelife, batchnumberhasrequired, minimumamount )
 values ('parts_1', 'effectivelife_1', 1, 2 ),
		('parts_2', 'effectivelife_2', 0, 2 ),
		('parts_3', 'effectivelife_3', 1, 1 ),
		('parts_4', 'effectivelife_4', 1, 3 ),
		('parts_5', 'effectivelife_5', 0, 5 )
go
CREATE TABLE orders 
(	id int identity(1,1) primary key,
	transactiontypeid int,
	suppliersid int,
	sourcewarehouseid int,
	destinationwarehouseid int,
	date date,
	constraint fk_1 foreign key (transactiontypeid) references transactiontype(id),
	constraint fk_2 foreign key (suppliersid) references suppliers(id),
	constraint fk_3 foreign key (sourcewarehouseid) references warehouses(id),
	constraint fk_4 foreign key (destinationwarehouseid) references warehouses(id)
)
go
insert into orders(transactiontypeid,suppliersid,sourcewarehouseid,destinationwarehouseid, date) 
	values(1,1,1,3,'2022/07/03'),
		(2,2,3,2,'2022/07/02'),
		(1,1,4,5,'2022/07/01'),
		(1,2,4,5,'2022/07/01'),
		(2,1,4,5,'2022/07/01')
go
CREATE TABLE orderitems
( id int identity(1,1) primary key,
  orderid int,
  partid int,
  batchnumber varchar(20),
  amount FLOAT,
  constraint fk_5 foreign key (orderid) references orders(id),
  constraint fk_6 foreign key (partid) references parts(id)
)
go
--ALTER TABLE orderitems ALTER COLUMN amount FLOAT
--ALTER TABLE orderitems add constraint unq UNIQUE(batchnumber)
--DELETE orderitems
insert into orderitems(orderid,partid,batchnumber,amount )
values(1,2,'',3),
		(2,3,'BA11111',3),
		(1,3,'BA56789',3),
		(2,4,'BA44444',3),
		(3,5,'',6),
		(5,1,'BA88888',7)

---- Load dữ liệu lên form Managing Current Inventory -------
Select  orderitems.id as idorderitems, orders.id, parts.name as partname, transactiontype.name as transactiontype, orders.date as date, sw.name as source , dw.name as destination, amount from parts INNER JOIN orderitems ON parts.id = orderitems.partid
INNER JOIN orders ON orders.id = orderitems.orderid 
INNER JOIN transactiontype ON transactiontype.id = orders.transactiontypeid 
LEFT JOIN warehouses as sw ON sw.id = orders.sourcewarehouseid 
LEFT JOIN warehouses as dw ON dw.id = orders.destinationwarehouseid
ORDER BY orders.date ASC, transactiontype.id ASC ---Sắp xếp ngày cũ nhất lên trên, nếu ngày bằng nhau thì xếp theo loại

Select * from transactiontype
Select * from warehouses

----Nếu phần đã chọn trong CSDL là “BatchNumberHasRequired” được thiết lập là “True”, khi đó một giá trị batch number cần được ghi nhận, ngược lại thì bỏ qua trường dữ liệu này và không nên lưu trữ trong CSDL.
Select * from parts
Select * from orderitems
Select * from orders
select batchnumberhasrequired from parts, orderitems where orderitems.partid= parts.id and orderitems.partid = 2

Select * from suppliers

Select partid,name, batchnumber, amount, (Select COUNT(partid) from orderitems where orderid=2 ) as sodong from orderitems, parts where orderitems.orderid=2 and orderitems.partid = parts.id
Select partid,name, batchnumber, amount, (Select COUNT(partid) from orderitems where orderid=3 ) as sodong from orderitems, parts where orderitems.orderid=3 and orderitems.partid = parts.id

Select max(id) as id from orders
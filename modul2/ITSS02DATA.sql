create database ITS02DATA
go
use ITS02DATA
go
create table departments
(
 id varchar(20) primary key,
 name varchar(50)
)
go
insert into departments values ('d1','pb 1')
insert into departments values ('d2','pb 2')
insert into departments values ('d3','pb 3')
insert into departments values ('d4','pb 4')
select * from departments


create table locations
(
 id varchar(20) primary key,
 name varchar(50)
)
go
insert into locations values ('l1','nv')
insert into locations values ('l2','tp')
insert into locations values ('l3','gd')
insert into locations values ('l4','tl')
select * from locations

create table departmentlocations
(
id varchar(20) primary key,
departmentid varchar(20),
locationid varchar(20),
startdate date,
enddate date,
constraint fk_departments foreign key (departmentid) references departments(id) ON DELETE CASCADE ON UPDATE CASCADE,
constraint fk_locations foreign key (locationid) references locations(id)ON DELETE CASCADE ON UPDATE CASCADE,
)
go
insert into departmentlocations values('de1','d1','l1','2021-3-4','2021-6-5')
insert into departmentlocations values('de2','d2','l2','2021-8-3','2021-5-6')
insert into departmentlocations values('de3','d3','l3','2021-7-1','2021-9-5')
insert into departmentlocations values('de4','d4','l4','2021-4-1','2021-5-5')
select * from departmentlocations

create table assetgroups
(
 id varchar(20) primary key,
 name varchar(50)
)
go
insert into assetgroups values ('a1','asg1')
insert into assetgroups values ('a2','asg2')
insert into assetgroups values ('a3','asg3')
insert into assetgroups values ('a4','asg4')
select * from assetgroups

create table priorites
(
 id varchar(20) primary key,
 name varchar(50)
)
go
insert into priorites values('pr1','priorites1')
insert into priorites values('pr2','priorites2')
insert into priorites values('pr3','priorites3')
insert into priorites values('pr4','priorites4')
select * from priorites


create table parts
(
 id varchar(20) primary key,
 name varchar(50),
 effectivelife int
 )
 go
 insert into parts values ('p1','vp',1)
 insert into parts values ('p2','xt',2)
 insert into parts values ('p3','ns',3)
 insert into parts values ('p4','ns',4)
 select * from parts


 create table employees
 (
 id varchar(20) primary key,
 firstname varchar(50),
 lastname varchar(50),
 phone varchar(11),
 isadmin int,
 username varchar(50),
 password varchar(50),	
 )
 go
 insert into employees values('em1','Nguyen','DUY','09325841589',1,'em01','123456')
 insert into employees values('em2','Nguyen','NGOC','09874121545',0,'em02','123456')
 insert into employees values('em3','Nguyen','LAN','09325874154',1,'em03','123456')
 insert into employees values('em4','Nguyen','DAO','02685455555',0,'em04','123456')
 insert into employees values('em5','Nguyen','Han','02685455555',1,'em05','12345')
 select * from employees
 Select * from employees where username ='em05' and password= '12345'
 create table assets
 (
 id varchar(20) primary key,
 assetsn varchar(50),
 assetname varchar(50),
 departmentlocationid varchar(20),
 employeeid varchar(20),
 assetgroupid varchar(20),
 description varchar(50),
 warrantydate date,
 constraint fk_departmentlocations foreign key(departmentlocationid) references departmentlocations(id)ON DELETE CASCADE ON UPDATE CASCADE,
 constraint fk_employeeid foreign key(employeeid) references employees(id)ON DELETE CASCADE ON UPDATE CASCADE,
 constraint fk_assetgroupid foreign key(assetgroupid) references assetgroups(id)ON DELETE CASCADE ON UPDATE CASCADE
 )
 go
 insert into assets values ('ass1','03/05/009','moorning system','de1','em1','a1','good','2021/7/9')
 insert into assets values ('ass2','01/11/0014','suction line','de2','em2','a2','good','2021/5/1')
 insert into assets values ('ass3','03/05/0015','toyota hilux','de3','em3','a3','good','2021/3/4')
  insert into assets values ('ass4','06/05/0015','sento hix','de4','em4','a4','good','2021/7/4')
 select * from assets


 create table emergencymaintenances
 (
  id int identity(1,1) primary key,
  assetid varchar(20),
  priorityid varchar(20),
  descriptionemergency varchar(50),
  otherconsiderations varchar(50),
  emreportdate date,
  emstartdate date,
  emenddate date,
  emtechniciannote varchar(50),
  constraint fk_em_a foreign key(assetid) references assets(id),
  constraint fk_em_p foreign key(priorityid) references priorites(id),
 )
 go
 insert into emergencymaintenances(assetid,priorityid,descriptionemergency,otherconsiderations,emreportdate,emstartdate,emenddate,emtechniciannote) values ('ass1','pr1','hong','hong','2021/1/2','2021/3/2','2021/4/2','dung han')
 insert into emergencymaintenances(assetid,priorityid,descriptionemergency,otherconsiderations,emreportdate,emstartdate,emenddate,emtechniciannote) values ('ass2','pr2','hong','hong','2021/1/2','2021/4/3','2021/4/9','dung han')
 insert into emergencymaintenances(assetid,priorityid,descriptionemergency,otherconsiderations,emreportdate,emstartdate,emenddate,emtechniciannote)  values ('ass3','pr3','hong','hong','2021/5/2','2021/3/5','2021/8/6','dung han')
  insert into emergencymaintenances(assetid,priorityid,descriptionemergency,otherconsiderations,emreportdate,emstartdate,emenddate,emtechniciannote)  values ('ass4','pr4','hong','hong','2021/8/7','2021/1/5','2021/8/6','dung han')
 select * from emergencymaintenances

 --alter table emergencymaintenances alter column emreportdate varchar(50)
-- alter table emergencymaintenances alter column emstartdate varchar(50)
 --alter table emergencymaintenances alter column emenddate varchar(50)


 create table changedparts
 (
 id int identity(1,1) primary key,
 emergencymaintenanceid int,
 partid varchar(20),
 amount float,
 constraint fk_emr foreign key(emergencymaintenanceid) references emergencymaintenances(id)ON DELETE CASCADE ON UPDATE CASCADE,
 constraint fk_partid foreign key(partid) references parts(id)ON DELETE CASCADE ON UPDATE CASCADE
 )
 go
 insert into changedparts(emergencymaintenanceid, partid, amount) values (1,'p1',9)
 insert into changedparts(emergencymaintenanceid, partid, amount) values (2,'p2',7)
 insert into changedparts(emergencymaintenanceid, partid, amount) values (3,'p3',6)
  insert into changedparts(emergencymaintenanceid, partid, amount) values (4,'p4',5)
 select * from changedparts




-----/////////////////////////------
select * from employees
---Load dữ liệu lên Form danh sách-----
select distinct  a.id,assetsn,assetname,emstartdate,emenddate,(select count(*) from emergencymaintenances where assetid=em.assetid ) as numem 
	from assets a,emergencymaintenances em 
	where a.id=em.assetid and emenddate= (select max(emenddate) from emergencymaintenances where assetid=a.id)   order by assetid asc

select a.id
	from assets a,emergencymaintenances em 
	where a.id=em.assetid and emenddate IS NULL  order by assetid asc



	--- Lấy dữ liệu tài sản trên form danh sách để gửi sang form yêu cầu bảo trì----
select assets.id,assetsn, assetname, departments.name
	from assets, departmentlocations, departments
	where assets.departmentlocationid= departmentlocations.id AND assets.id = 'ass3' AND departments.id = departmentlocations.departmentid

	----Load dữ liệu lên combobox priorites ----
	select * from emergencymaintenances
	----Thêm yêu cầu vào bảng emergencymaintenances---
	insert into emergencymaintenances(assetid,priorityid,descriptionemergency,otherconsiderations,emreportdate,emstartdate,emtechniciannote) 
		values ('ass1','pr1','hong','hư tùm lum','2021/7/16','2021/7/17','')


﻿--create database cafe_shop_db
use cafe_shop_db

create table SizeTable(
	Size nvarchar(5) primary key
)

insert into SizeTable values('S');
insert into SizeTable values('M');
insert into SizeTable values('L');

create table Category(
	CategoryID int identity(1,1) primary key,
	CategoryName nvarchar(200)
)

insert into Category values(N'Cà phê')	
insert into Category values(N'Nước ép')
insert into Category values(N'Trà sữa')
insert into Category values(N'Trà')
insert into Category values(N'Cookie')
insert into Category values(N'Pizza & Hamburger')
insert into Category values(N'Bánh ngọt')


create table Product(
	ProductID int identity(1,1) primary key,
	ProductName nvarchar(100),
	Description nvarchar(4000),
	CategoryID int references Category(CategoryID)
)

insert into Product values (N'Phin di sữa đá','ădaw', 1);

create table Image(
	ImagePath nvarchar(1000) primary key,
	ProductID int references Product(ProductID),
)

insert into Image values('phindisuada2.jpg',1)
insert into Image values('phindisuada1.jpg',1)

create table Thumbnail (
	ProductID int references Product(ProductID) primary key,
	ImagePath nvarchar(1000),
)

create table SizeOfProduct(
	ProductID int references Product(ProductID),
	Size nvarchar(5) references SizeTable(Size),
	Price int,
	Quantity int,
	primary key (Size, ProductID)
)

create table Customer (
	CustomerID int identity(1,1) primary key,
	CustomerName nvarchar(200),
	Username nvarchar(100),
	Password nvarchar(100),
	Address nvarchar(200),
	Phone varchar(50),
	Mail varchar(100)
)

create table OrderStepTable (
	StepID int identity(1,1) primary key,
	OrderStep nvarchar(100)
)

insert into OrderStepTable values ('Đang chọn sản phẩm')
insert into OrderStepTable values ('Chờ lấy hàng')
insert into OrderStepTable values ('Đang giao hàng')
insert into OrderStepTable values ('Thành công')
insert into OrderStepTable values ('Đã hủy')

create table [Order] (
	OrderID int identity(1,1) primary key,
	CustomerID int references Customer(CustomerID),
	StepID int references OrderStepTable(StepID),
	CreatedDate date,
	TotalPrice int
)

create table ProductInOrder(
	OrderID int references [Order](OrderID),
	ProductID int references Product(ProductID),
	Quantity int
)

--use master
--ALTER DATABASE [cafe_shop_db] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
--drop database cafe_shop_db
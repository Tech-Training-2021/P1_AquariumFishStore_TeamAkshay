drop table Role;
create table Role(
	Id int identity(1,1) primary key,
	Name varchar(50) not null
);

insert into Role(Name) Values('Admin');
insert into Role(Name) Values('Customer');
--select * from Role;

drop table UserTable;
create table UserTable(
	UserId int identity(1,1) primary key,
	RoleId int foreign key references Role(Id) not null,
	Name varchar(50)  not null,
	email varchar(50) unique,
	password varchar(50) not null,
	mobileNo varchar(10) unique
);

insert into UserTable values(1,'Vishram','vishram@gmail.com','121212','7878567645');
insert into UserTable values(2,'Imam','imam@gmail.com','67755656','9876567645');
insert into UserTable values(2,'Shivani','shivani@gmail.com','125768742','7878566723');
insert into UserTable values(2,'Romila','romila@gmail.com','263876328763','6554567645');
insert into UserTable values(2,'Akshay','ak@gmail.com','1422434','8978567645');
select * from UserTable;


drop table LocationTable;
create table LocationTable(
	Id int identity(1,1) primary key,
	Branch varchar(50) not null
);

insert into LocationTable(Branch) Values('Mumbai');
insert into LocationTable(Branch) Values('Delhi');
insert into LocationTable(Branch) Values('Bangalore');
select * from LocationTable;

drop table ProductType;
create table ProductType(
	Id int identity(1,1) primary key,
	Category varchar(30) not null
);

insert into ProductType(Category) Values('Fish');
insert into ProductType(Category) Values('Food');
insert into ProductType(Category) Values('Tank');
select * from ProductType;

drop table Product;
create table Product(
	Id int identity(1,1) primary key,
	Name varchar(30) not null,
	Quantity int not null,
	Price decimal not null
);

insert into Product(Name,Quantity,Price) Values('GoldFish',5,120);
insert into Product(Name,Quantity,Price) Values('AngelFish',15,180);
insert into Product(Name,Quantity,Price) Values('JellyFish',30,200);

insert into Product(Name,Quantity,Price) Values('Flake Food',25,120);
insert into Product(Name,Quantity,Price) Values('FPellets',45,180);
insert into Product(Name,Quantity,Price) Values('Frozen',70,200);

insert into Product(Name,Quantity,Price) Values('Coldwater Aquarium',35,120);
insert into Product(Name,Quantity,Price) Values('Freshwater Tropical Aquarium',85,180);
insert into Product(Name,Quantity,Price) Values('Brackish Aquarium',70,200);

select * from Product;


drop table LocationJunction;
create table LocationJunction(
	Id int identity(1,1) primary key,
	LocationId int foreign key references Location(Id) not null,
	ProductId int foreign key references Product(Id) not null,

);

insert into LocationJunction(LocationId,ProductId) Values(1,1);
insert into LocationJunction(LocationId,ProductId) Values(2,2);
insert into LocationJunction(LocationId,ProductId) Values(3,3);
insert into LocationJunction(LocationId,ProductId) Values(1,4);
insert into LocationJunction(LocationId,ProductId) Values(2,5);
insert into LocationJunction(LocationId,ProductId) Values(3,6);
insert into LocationJunction(LocationId,ProductId) Values(1,7);
insert into LocationJunction(LocationId,ProductId) Values(2,8);
insert into LocationJunction(LocationId,ProductId) Values(3,9);
select * from LocationJunction;


drop table ProductJunction;
create table ProductJunction(
	Id int identity(1,1) primary key,
	ProductId int foreign key references Product(Id) not null,
	ProductTypeId int foreign key references ProductType(Id) not null,
);

insert into ProductJunction(ProductId,ProductTypeId) Values(1,1);
insert into ProductJunction(ProductId,ProductTypeId) Values(2,1);
insert into ProductJunction(ProductId,ProductTypeId) Values(3,1);
insert into ProductJunction(ProductId,ProductTypeId) Values(4,2);
insert into ProductJunction(ProductId,ProductTypeId) Values(5,2);
insert into ProductJunction(ProductId,ProductTypeId) Values(6,2);
insert into ProductJunction(ProductId,ProductTypeId) Values(7,3);
insert into ProductJunction(ProductId,ProductTypeId) Values(8,3);
insert into ProductJunction(ProductId,ProductTypeId) Values(9,3);

select * from ProductJunction;

drop table OrderTable;
create table OrderTable(
	Id int identity(1,1) primary key,
	LocationId int foreign key references LocationTable(Id) not null,
	UserId int foreign key references UserTable(UserId) not null,
	ProductId int foreign key references Product(Id) not null,
	Quantity int not null,
	TotalPrice decimal not null
);

insert into OrderTable Values(1,2,1,6,200);
insert into OrderTable Values(2,3,4,13,140);
select * from OrderTable;























create table Categories(
id int primary key auto_increment,
name nvarchar(50) unique,
description nvarchar(500) not null
);
create table Suppliers(
id int primary key auto_increment,
name nvarchar(100),
email varchar(50) unique,
phonerNumber varchar(50) not null,
address nvarchar(500)
);
create table Customers(
id varchar(50) primary key,
firstName nvarchar(50),
lastName nvarchar(50),
phoneNumber varchar(50) not null,
address nvarchar (500),
email varchar(50) unique,
birthDay date not null
);
create table Employees(
id varchar(50) primary key,
firstName nvarchar(50),
lastName nvarchar(50),
phoneNumber varchar(50) not null,
addres nvarchar(500),
email varchar(50) unique,
birthDay date not null
);
create table Products(
id int primary key auto_increment,
name nvarchar(50),
umageUrl nvarchar(1000),
price int default(0) check (price >=0),
discount int default(0) check (discount between 0 and 100),
stock int default(0),
categoryId int,
foreign key (categoryId) references Categories(id),
supplierId int,
foreign key(supplierId) references Suppliers(id),
description blob
);
create table Orders(
id int primary key auto_increment,
createdDate datetime default('getdate()'),
shippedDate datetime not null,
status varchar(50) default('waiting'),
description blob not null,
shippingAddress nvarchar(500),
shippingCity nvarchar(50),
paymentType varchar(20) default('cash'),
customerId varchar(50),
foreign key(customerId) references Customers(id),
employeeId varchar(50),
foreign key(employeeId) references Employees(id)
);
create table OrderDetails(
id int primary key auto_increment,
orderId int,
foreign key(orderId) references Orders(id),
productId int,
foreign key(productId) references Products(id),
quantity int
);
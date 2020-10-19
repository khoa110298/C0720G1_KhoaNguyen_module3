-- create database baitapvenha;
create table Products(
id int,
Name nvarchar(50),
UmageUrl nvarchar(1000),
Price int,
Discount int,
Stock int,
Categoryld int,
Supplierld int,
Description nvarchar(0)
);
insert into products(Name,UmageUrl) values(50,1000);
select * from products;
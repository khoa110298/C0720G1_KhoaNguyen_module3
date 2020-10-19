create table Orders(
id int,
CreatedData datetime,
ShippedData datetime,
Status varchar(50),
Description nvarchar(50),
ShippingAdress nvarchar(500),
ShippingCity nvarchar(50),
PaymentType varchar(20),
Customerld varchar(50),
Employeeld varchar(50)
);
insert into orders(Status,ShippingAdress,ShippingCity,PaymentType,Customerld,Employeeld) values(50,500,50,20,50,50);
select * from orders;
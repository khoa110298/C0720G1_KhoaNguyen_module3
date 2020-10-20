create database taokhoangoai;
create table customers(
id int auto_increment primary key,
name varchar(40),
address varchar(225),
email varchar(225)
);
create table orders	(
id int auto_increment,
staff varchar(50),
primary key(id),
customer_id int, FOREIGN key (customer_id) references customers(id)
);
create database taokhoachinh;
create table users(
user_id int auto_increment primary key,
useName varchar(50),
password varchar(225),
email varchar(225)
);
create table roles(
role_id int auto_increment,
role_name varchar(50),
primary key(role_id)
);
create table userroles(
user_id int not null,
role_id int not null,
PRIMARY KEY(user_id,role_id),
foreign key(user_id) references users(user_id),
foreign key(role_id) references roles(role_id)
);
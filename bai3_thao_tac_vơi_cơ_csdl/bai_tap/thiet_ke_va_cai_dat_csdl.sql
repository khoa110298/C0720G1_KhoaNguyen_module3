create table Book(
id int primary key auto_increment,
tensach varchar(50) not null,
nhaXuatBan varchar(50),
tacGia varchar(50),
namXuatBan date not null,
soLanXuatBan int,
gia double not null,
anh varchar(50),
categoryId int,
foreign key(categoryId) references  Category(id)
);
create table Category(
id int primary key auto_increment,
vanHoc varchar(50) not null,
tinHoc varchar(50) not null,
toanHoc varchar(50) not null
);
create table Student(
id varchar(15) primary key,
tenSinhVien varchar(50) unique,
diaChi nvarchar(500) not null,
email varchar(50) unique,
hinhAnh varchar(50),
ngaySinh date,
soDienThoai int(11) not null unique
);
create table BorrowOrder(
id int primary key auto_increment,
ngayMuon date not null,
ngayTra date not null,
studentId varchar(15),
foreign key(studentId) references Student(id)
);
create table BookOrder(
id int primary key,
bookId int,
orderId int,
foreign key (bookId) references Book(id),
foreign key(orderId) references BorrowOrder(id)
);
create database castudy;
create table nhanvien(
idNhanVien int primary key auto_increment,
hoten varchar(45),
idViTri int,
idTrinhDon int,
idBoPhan int,
foreign key(idViTri) references vitri(idvitri),
foreign key(idTrinhDon) references trinhdon(idtrinhdon),
foreign key(idBoPhan) references bophan(idbophan),
ngaysinh date,
soCMND varchar(45) unique,
luong varchar(45),
SDT varchar(45) unique,
email varchar(45),
diachi varchar(45)
);
create table vitri(
idvitri int primary key,
tenvitri varchar(45)
);
create table trinhdon(
idtrinhdon int primary key,
tentrinhdon varchar(45)
);
create table bophan(
idbophan int primary key,
tenbophan varchar(45)
);
create table khachhang(
idKhachHang int primary key auto_increment,
idLoaiKhach int,
foreign key(idLoaiKhach) references loaikhach(idloaikhach),
hoten varchar(45),
nagysinh date,
soCMND varchar(45) unique,
SDT varchar(45),
email varchar(45),
diachi varchar(45)
);
create table loaikhach(
idLoaiKhach int primary key,
tenLoaiKhach varchar(45)
);
create table hopdong(
idhopdong int primary key auto_increment,
idNhanVien int,
idKhachHang int,
idDichVu int,
foreign key (idNhanVien) references nhanvien(idnhanvien),
foreign key (idKhachHang) references khachhang(idkhachhang),
foreign key (idDichVu) references dichvu(iddichvu),
ngaylamhopdong date,
ngayketthuc date,
tiendatcoc int,
tongtien int
);
create table hopdongchitiet(
idhopdongchitiet int primary key,
idDichVuDiKem int,
idHopDong int,
foreign key(idHopDong) references hopdong(idhopdong),
foreign key(idDichVuDiKem) references dichvudikem(iddichvudikem),
soluong int
);
create table dichvudikem(
iddichvudikem int primary key,
tendichvudikem varchar(45),
gia int,
donvi int,
trangthaikhadung varchar(45)
);
create table dichvu(
iddichvu int primary key,
tendichvu varchar(45),
dientich int,
sotang int,
songuoitoida varchar(45),
chiphithue varchar(45),
idKieuThue int,
idLoaiDichVu int,
foreign key(idKieuThue) references kieuthue(idkieuthue),	
foreign key(idLoaiDichVu) references loaidichvu(idloaidichvu),
trangthai varchar(45)
);
create table kieuthue(
idkieuthue int primary key,
tenkieuthue varchar(45),
gia int
);
create table loaidichvu(
idloaidichvu int primary key,
tenloaidichvu varchar(45)
);

-- câu 2

select * from nhanvien
 where (nhanvien.hoten like'H%' or nhanvien.hoten like 'T%' or nhanvien.hoten like 'K%') 
 and length(nhanvien.hoten) <= 15;

-- câu 3

select * from khachhang 
where ((year(now())-year(khachhang.nagysinh)) >= 18 and (year(now())-year(khachhang.nagysinh)) <=50)
and (khachhang.diachi = 'da nang' or khachhang.diachi = 'quang tri');

-- câu 4


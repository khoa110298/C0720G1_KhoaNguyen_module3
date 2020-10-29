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
 select khachhang.hoten, count(hopdong.idhopdong) as solanthue from khachhang 
join hopdong on khachhang.idKhachHang = hopdong.idKhachHang
 join loaikhach on khachhang.idLoaiKhach = loaikhach.idLoaiKhach
 where loaikhach.tenLoaiKhach ='Diamond'
 order by solanthue desc;

-- câu 5

select khachhang.idkhachhang, khachhang.hoten, loaikhach.tenloaikhach, hopdong.idhopdong,
dichvu.tendichvu, ngaylamhopdong, ngayketthuc ,chiphithue,soluong,gia, 
(chiphithue + soluong*gia) as tongtien
from khachhang 
left join loaikhach on khachhang.idLoaiKhach = loaikhach.idLoaiKhach
left join hopdong on khachhang.idKhachHang = hopdong.idKhachHang
left join dichvu on hopdong.idDichVu = dichvu.iddichvu
left join hopdongchitiet on hopdong.idhopdong = hopdongchitiet.idhopdong
left join dichvudikem on hopdongchitiet.idDichVuDiKem = dichvudikem.iddichvudikem;
 
 -- câu 6
 
 select dichvu.iddichvu, dichvu.tendichvu,dichvu.dientich,dichvu.chiphithue,loaidichvu.tenloaidichvu
 from khachhang join hopdong on khachhang.idKhachHang = hopdong.idKhachHang
 join dichvu on hopdong.iddichvu = dichvu.iddichvu
 join loaidichvu on dichvu.idLoaiDichVu = loaidichvu.idLoaiDichVu  where not (month(ngaylamhopdong) in (1,2,3) and
 year(ngaylamhopdong) = 2019);

-- câu 7

 select dichvu.iddichvu, dichvu.tendichvu,dichvu.dientich,songuoitoida,dichvu.chiphithue,loaidichvu.tenloaidichvu,ngaylamhopdong
 from khachhang join hopdong on khachhang.idKhachHang = hopdong.idKhachHang
 join dichvu on hopdong.iddichvu = dichvu.iddichvu
 join loaidichvu on dichvu.idLoaiDichVu = loaidichvu.idLoaiDichVu  where
 (year(ngaylamhopdong) = 2018) and
 ( year(ngaylamhopdong) <> 2019);
  
-- câu 8

select khachhang.hoten,count(khachhang.hoten) as solanlap from khachhang
group by khachhang.hoten;
select distinct khachhang.hoten from khachhang;
select khachhang.hoten from khachhang
union 
select khachhang.hoten from khachhang;

-- câu 9

select month(hopdong.ngaylamhopdong) as thang,count(month(ngaylamhopdong)) as songuoidatphong
from hopdong where
year(ngaylamhopdong) = 2019
group by month(ngaylamhopdong)
order by month(ngaylamhopdong);

-- câu 10

select hopdong.idhopdong,ngaylamhopdong,ngayketthuc,tiendatcoc,hopdongchitiet.soluong,
count(idhopdongchitiet) as soluongdichvudikem
from hopdong join hopdongchitiet on
hopdong.idhopdong = hopdongchitiet.idhopdong
join dichvudikem on hopdongchitiet.iddichvudikem = dichvudikem.iddichvudikem
group by idhopdong
order by idhopdong;

-- câu 11

select dichvudikem.iddichvudikem,dichvudikem.tendichvudikem,
dichvudikem.gia,dichvudikem.donvi,khachhang.hoten
from khachhang join loaikhach on
khachhang.idLoaiKhach = loaikhach.idLoaiKhach
join hopdong on khachhang.idKhachHang = hopdong.idKhachHang
join hopdongchitiet on hopdong.idhopdong = hopdongchitiet.idhopdong
join dichvudikem on hopdongchitiet.iddichvudikem = dichvudikem.iddichvudikem
where tenLoaiKhach = 'Diamond' and (diachi = 'quang ngai' or diachi = 'vinh')
order by iddichvudikem;

-- câu 12

select hopdong.idhopdong,nhanvien.hoten,khachhang.hoten,khachhang.sdt,
dichvu.tendichvu,hopdongchitiet.soluong,tiendatcoc from hopdong
join nhanvien on hopdong.idNhanVien = nhanvien.idNhanVien
join khachhang on hopdong.idKhachHang = khachhang.idKhachHang
join dichvu on hopdong.idDichVu = dichvu.iddichvu
join hopdongchitiet on hopdong.idhopdong = hopdongchitiet.idhopdong
where (year(ngaylamhopdong) = 2019 and month(ngaylamhopdong) in(10,11,12)) 
and not (year(ngaylamhopdong) = 2019 and month(ngaylamhopdong) in(1,2,3,4,5,6));

-- câu 13 

select * FROM 
(select dichvudikem.iddichvudikem,dichvudikem.tendichvudikem,dichvudikem.gia,dichvudikem.donvi,
dichvudikem.trangthaikhadung,count(tendichvudikem) as solansudung from khachhang 
join hopdong on khachhang.idKhachHang = hopdong.idKhachHang
join hopdongchitiet on hopdong.idhopdong = hopdongchitiet.idhopdong
join dichvudikem on hopdongchitiet.idDichVuDiKem = dichvudikem.iddichvudikem 
group by tendichvudikem
order by count(tendichvudikem) desc) as abc
where solansudung = 
(select  count(tendichvudikem) from khachhang 
join hopdong on khachhang.idKhachHang = hopdong.idKhachHang
join hopdongchitiet on hopdong.idhopdong = hopdongchitiet.idhopdong
join dichvudikem on hopdongchitiet.idDichVuDiKem = dichvudikem.iddichvudikem
group by tendichvudikem
order by count(tendichvudikem) desc limit 1);

-- câu 14
 
select hopdong.idhopdong, loaidichvu.tenloaidichvu,dichvudikem.tendichvudikem,
count(hopdongchitiet.iddichvudikem) as solansudung from khachhang
join hopdong on khachhang.idKhachHang = hopdong.idKhachHang
join dichvu on hopdong.iddichvu = dichvu.iddichvu
join loaidichvu on dichvu.idLoaiDichVu = loaidichvu.idLoaiDichVu
join hopdongchitiet on hopdong.idhopdong = hopdongchitiet.idhopdong 
join dichvudikem on hopdongchitiet.iddichvudikem = dichvudikem.iddichvudikem
group by hopdongchitiet.iddichvudikem
having count(hopdongchitiet.iddichvudikem) = 1
order by idhopdong;

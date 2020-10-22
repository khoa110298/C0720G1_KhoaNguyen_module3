SELECT * FROM cachamthongdung.student;
select * from student where ten = 'Huong';
select sum(soTien) from student where ten = 'Huong';
select ten,count(ten) from student
group by ten;
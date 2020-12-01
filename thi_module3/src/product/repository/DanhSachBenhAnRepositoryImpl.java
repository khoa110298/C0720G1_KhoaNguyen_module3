package product.repository;

import product.model.DanhSachBenhAn;
import product.model.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DanhSachBenhAnRepositoryImpl implements DanhSachBenhAnRepository {
    private String jdbcURL = "jdbc:mysql://localhost:3306/thimodule3";
    private String jdbcUsername = "root";
    private String jdbcPassword = "12345678";

    private static final String SELECT_ALL_DANHSACHBENHAN= "select * from thongtinbenhan";
    private static final String SELECT_DANHSACHBENHAN_BY_ID = "select * from thongtinbenhan where  STT = ?";
    private static final String DELETE_DANHSACHBENHAN_SQL = "delete from thongtinbenhan where STT = ?";
    private static final String UPDATE_DANHSACHBENHAN_SQL = "update thongtinbenhan set ten_benh_nhan = ?,ngay_nhap_ven =?, ngay_ra_vien =?,ly_do_nhap_vien=? where STT = ?";



    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }




    @Override
    public List<DanhSachBenhAn> getAllDanhSachBenhAn() {
        List<DanhSachBenhAn> danhSachBenhAnList = new ArrayList<>();
        try(Connection connection = getConnection();
            PreparedStatement statement =connection.prepareStatement(SELECT_ALL_DANHSACHBENHAN)) {
            ResultSet rs =statement.executeQuery();
            while (rs.next()){
                int stt = rs.getInt("STT");
                String maBenhAn = rs.getString("id_benh_an");
                String mabenhNhan = rs.getString("id_benh_nhan");
                String tenBenhnhan = rs.getString("ten_benh_nhan");
                String ngayNhapVen = rs.getString("ngay_nhap_ven");
                String ngayRaVien = rs.getString("ngay_ra_vien");
                String lyDoNhapVien = rs.getString("ly_do_nhap_vien");
                danhSachBenhAnList.add(new DanhSachBenhAn(stt,maBenhAn,mabenhNhan,tenBenhnhan,ngayNhapVen,ngayRaVien,lyDoNhapVien));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                getConnection().close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return danhSachBenhAnList;
    }

    @Override
    public boolean deleteDanhSachBenhAnt(int id) throws SQLException {
        boolean check;
        try(Connection connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(DELETE_DANHSACHBENHAN_SQL)) {
            statement.setInt(1,id);
            check = statement.executeUpdate()>0;
        }finally {
            getConnection().close();
        }
        return check;
    }

    @Override
    public boolean updateDanhSachBenhAn(DanhSachBenhAn danhSachBenhAn) throws SQLException {
        boolean check;
        try(Connection connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(UPDATE_DANHSACHBENHAN_SQL)) {
            statement.setString(1,danhSachBenhAn.getTenBenhNhan());
            statement.setString(2,danhSachBenhAn.getNgayNhapVien());
            statement.setString(3,danhSachBenhAn.getNgayRaVien());
            statement.setString(4,danhSachBenhAn.getLyDo());
            statement.setInt(5,danhSachBenhAn.getSTT());
            check = statement.executeUpdate()>0;
        }finally {
            getConnection().close();
        }
        return check;
    }

    @Override
    public DanhSachBenhAn selectDanhSachBenhAn(int id) {
        DanhSachBenhAn danhSachBenhAn = null;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(SELECT_DANHSACHBENHAN_BY_ID)){
            statement.setInt(1,id);
            ResultSet rs= statement.executeQuery();
            while (rs.next()){
                String maBenhAn = rs.getString("id_benh_an");
                String mabenhNhan = rs.getString("id_benh_nhan");
                String tenBenhnhan = rs.getString("ten_benh_nhan");
                String ngayNhapVen = rs.getString("ngay_nhap_ven");
                String ngayRaVien = rs.getString("ngay_ra_vien");
                String lyDoNhapVien = rs.getString("ly_do_nhap_vien");
                danhSachBenhAn = new DanhSachBenhAn(id,maBenhAn,mabenhNhan,tenBenhnhan,ngayNhapVen,ngayRaVien,lyDoNhapVien);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return danhSachBenhAn;
    }
}

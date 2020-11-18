package product.repository;

import product.model.Category;
import product.model.MuonSach;
import product.model.Sach;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SachRepositoryImpl implements SachRepository {
    private String jdbcURL = "jdbc:mysql://localhost:3306/thimodule3";
    private String jdbcUsername = "root";
    private String jdbcPassword = "12345678";

    private static final String SELECT_ALL_SACH = "select * from sach";

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
    public List<Sach> getAllSach() {
        List<Sach> sachList = new ArrayList<>();
        try(Connection connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(SELECT_ALL_SACH)) {
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                int maSach = rs.getInt("idsach");
                String tenSach = rs.getString("tensach");
                String tacgia = rs.getString("tacgia");
                 String soluong = rs.getString("soluong");
                 String mota = rs.getString("mota");
                sachList.add(new Sach(maSach,tenSach,tacgia,soluong,mota));
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
        return sachList;
    }

    @Override
    public void insertMuonSach(MuonSach muonSach) throws SQLException {

    }
}

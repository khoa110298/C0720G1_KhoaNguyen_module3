package product.repository;

import product.model.MuonSach;
import product.model.Sach;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MuonSachRepositoryImpl implements MuonSachRepository {

    private String jdbcURL = "jdbc:mysql://localhost:3306/thimodule3";
    private String jdbcUsername = "root";
    private String jdbcPassword = "12345678";

    private static final String SELECT_ALL_MUONSACH= "select * from themuonsach";
    private static final String INSERT_MUONSACH_SQL = "INSERT INTO " +
            "themuonsach(idmuonsach, tensach,tacgia,tenhocsinh,lop,ngaymuon,ngaytra) VALUES (?, ?, ?,?,?,?,?);";
    private static final String DELETE_MUONSACH_SQL = "delete from themuonsach where mamuonsach = ?";

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
    public List<MuonSach> getAllMuonSach() {
        List<MuonSach> muonSachList = new ArrayList<>();
        try(Connection connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(SELECT_ALL_MUONSACH)) {
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                int maSach = rs.getInt("mamuonsach");
                String tenSach = rs.getString("tensach");
                String tacgia = rs.getString("tacgia");
                String tenhs = rs.getString("tenhocsinh");
                String lop = rs.getString("lop");
                String ngaymuon = rs.getString("ngaymuon");
                String ngayTra = rs.getString("ngaytra");
                muonSachList.add(new MuonSach(maSach,tenSach,tacgia,tenhs,lop,ngaymuon,ngayTra));
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
        return muonSachList;
    }

    @Override
    public void insertMuonSach(MuonSach muonSach) throws SQLException {
        try(Connection connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(INSERT_MUONSACH_SQL)) {
            statement.setInt(1,muonSach.getMaMuonSach());
            statement.setString(2,muonSach.getTenSach());
            statement.setString(3,muonSach.getTacGia());
            statement.setString(4,muonSach.getTenHocSinh());
            statement.setString(5,muonSach.getLop());
            statement.setString(6,muonSach.getNgayMuon());
            statement.setString(7,muonSach.getNgayTra());
            statement.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    @Override
    public boolean deleteMuonSach(int id) throws SQLException {
        boolean check;
        try(Connection connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(DELETE_MUONSACH_SQL)) {
            statement.setInt(1,id);
            check = statement.executeUpdate()>0;
        }finally {
            getConnection().close();
        }
        return check;
    }
}

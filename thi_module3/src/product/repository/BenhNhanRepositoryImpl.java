package product.repository;

import product.model.BenhAn;
import product.model.BenhNhan;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BenhNhanRepositoryImpl implements BenhNhanRepository  {
    private String jdbcURL = "jdbc:mysql://localhost:3306/thimodule3";
    private String jdbcUsername = "root";
    private String jdbcPassword = "12345678";

    private static final String SELECT_ALL_BENHNHAN= "select * from benhnhan";


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
    public List<BenhNhan> getAllBenhNhan() {
        List<BenhNhan> benhNhanList = new ArrayList<>();
        try(Connection connection = getConnection();
            PreparedStatement statement =connection.prepareStatement(SELECT_ALL_BENHNHAN)) {
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                String id =resultSet.getString("id_benh_nhan");
                String name = resultSet.getString("ten_benh_nhan");
                benhNhanList.add(new BenhNhan(id,name));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return benhNhanList;
    }

}

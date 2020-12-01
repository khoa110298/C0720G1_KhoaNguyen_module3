package product.repository;

import product.model.Category;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoryRepositoryImpl implements CategoryRepository {
    private String jdbcURL = "jdbc:mysql://localhost:3306/thimodule3";
    private String jdbcUsername = "root";
    private String jdbcPassword = "12345678";
    private static final String SELECT_ALL_CATEGORY = "select * from category";

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
    public List<Category> getAllCategory() {
       List<Category> categoryList = new ArrayList<>();
       try(Connection connection = getConnection();
           PreparedStatement statement =connection.prepareStatement(SELECT_ALL_CATEGORY)) {
           ResultSet resultSet = statement.executeQuery();
           while (resultSet.next()){
               int id =resultSet.getInt("category_id");
               String name = resultSet.getString("category_name");
               categoryList.add(new Category(id,name));
           }
       } catch (SQLException e) {
           e.printStackTrace();
       }
       return categoryList;
    }
}

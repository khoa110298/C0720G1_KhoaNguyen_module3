package product.repository;

import product.model.Product;

import javax.xml.transform.Result;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductRepositoryImpl implements ProductRepository {
    private String jdbcURL = "jdbc:mysql://localhost:3306/thimodule3";
    private String jdbcUsername = "root";
    private String jdbcPassword = "12345678";

    private static final String INSERT_PRODUCT_SQL = "INSERT INTO `thimodule3`.`product` (`product_name`, `price`, `category_id`) VALUES (?, ?, ?);";
    private static final String SELECT_ALL_PRODUCT = "select * from product";
    private static final String SELECT_PRODUCT_BY_ID = "select * from product where  product_id = ?";
    private static final String SELECT_PRODUCT_BY_NAME = "select * from product where product_name like ?";
    private static final String DELETE_PRODUCT_SQL = "delete from product where product_id = ?";
    private static final String UPDATE_PRODUCT_SQL = "update product set product_name = ?,price =?, category_id =? where product_id = ?";



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
    public List<Product> getAllProduct() {
        List<Product> productList = new ArrayList<>();
        try(Connection connection = getConnection();
            PreparedStatement statement =connection.prepareStatement(SELECT_ALL_PRODUCT)) {
            ResultSet rs =statement.executeQuery();
            while (rs.next()){
                int idProduct = rs.getInt("product_id");
                String nameProduct = rs.getString("product_name");
                String price = rs.getString("price");
                int categoryId = rs.getInt("category_id");
                productList.add(new Product(idProduct,nameProduct,price,categoryId));
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
        return productList;
    }

    @Override
    public void insertProduct(Product product) throws SQLException {
        try(Connection connection = getConnection();
        PreparedStatement statement = connection.prepareStatement(INSERT_PRODUCT_SQL)) {
            statement.setString(1,product.getName());
            statement.setString(2,product.getPrice());
            statement.setInt(3,product.getCategoryId());
            statement.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    @Override
    public List<Product> searchProductByName(String name) {
        List<Product> productList = new ArrayList<>();
        try(Connection connection = getConnection();
        PreparedStatement statement = connection.prepareStatement(SELECT_PRODUCT_BY_NAME)) {
            statement.setString(1,"%"+name+"%");
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                int idProduct = rs.getInt("product_id");
                String nameProduct = rs.getString("product_name");
                String price = rs.getString("price");
                int categoryId = rs.getInt("category_id");
                productList.add(new Product(idProduct,nameProduct,price,categoryId));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }

    @Override
    public boolean deleteProduct(int id) throws SQLException {
        boolean check;
        try(Connection connection = getConnection();
        PreparedStatement statement = connection.prepareStatement(DELETE_PRODUCT_SQL)) {
            statement.setInt(1,id);
            check = statement.executeUpdate()>0;
        }finally {
            getConnection().close();
        }
        return check;
    }

    @Override
    public boolean updateProduct(Product product) throws SQLException {
        boolean check;
        try(Connection connection = getConnection();
        PreparedStatement statement = connection.prepareStatement(UPDATE_PRODUCT_SQL)) {
            statement.setString(1,product.getName());
            statement.setString(2,product.getPrice());
            statement.setInt(3,product.getCategoryId());
            statement.setInt(4,product.getId());
            check = statement.executeUpdate()>0;
        }finally {
            getConnection().close();
        }
        return check;
    }

    @Override
    public Product selectProduct(int id) {
        Product product = null;
        try (Connection connection = getConnection();
        PreparedStatement statement = connection.prepareStatement(SELECT_PRODUCT_BY_ID)){
            statement.setInt(1,id);
            ResultSet rs= statement.executeQuery();
            while (rs.next()){
                String nameProduct = rs.getString("product_name");
                String price = rs.getString("price");
                int categoryId = rs.getInt("category_id");
                product = new Product(id,nameProduct,price,categoryId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }
}

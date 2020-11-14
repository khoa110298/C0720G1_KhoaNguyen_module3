package customer.repository;

import customer.model.Customer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerDaoIml implements CustomerDao {
    private String jdbcURL = "jdbc:mysql://localhost:3306/casestudy2";
    private String jdbcUsername = "root";
    private String jdbcPassword = "12345678";

    private static final String INSERT_CUSTOMER_SQL = "INSERT INTO " +
            "customer(customer_id,customer_type_id, customer_name, customer_birthday,customer_gender,customer_id_card,customer_phone,customer_email,customer_address) " +
            "VALUES(?,?,?,?,?,?,?,?,?)";
    private static final String SELECT_ALL_CUSTOMER = "select * from customer";
    private static final String SELECT_CUSTOMER_BY_NAME = "select * from customer where customer_name like ?";
    private static final String DELETE_CUSTOMER_SQL = "delete from customer where customer_id = ?";
    private static final String UPDATE_CUSTOMER_SQL = "update customer set customer_type_id = ?,customer_name= ?, customer_birthday = ?," +
            "customer_gender = ?,customer_id_card = ?,customer_phone= ?, customer_email = ?,customer_address = ? where customer_id = ?";
    private static final String SELECT_CUSTOMER = "select * from customer where  customer_id = ?";


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
    public List<Customer> getAllCustomer() {
        List<Customer> customerList = new ArrayList<>();
        try(Connection connection=getConnection();
            PreparedStatement statement = connection.prepareStatement(SELECT_ALL_CUSTOMER)) {
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                int id = rs.getInt("customer_id");
                int typeId = rs.getInt("customer_type_id");
                String name = rs.getString("customer_name");
                String birthday = rs.getString("customer_birthday");
                int gender = rs.getInt("customer_gender");
                String idCard = rs.getString("customer_id_Card");
                String phone = rs.getString("customer_phone");
                String email = rs.getString("customer_email");
                String address = rs.getString("customer_address");
                customerList.add(new Customer(id,typeId,name,birthday,gender,idCard,phone,email,address));
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
        return customerList;
    }

    @Override
    public void insertCustomer(Customer customer) throws SQLException {
        try(Connection connection = getConnection();
        PreparedStatement statement = connection.prepareStatement(INSERT_CUSTOMER_SQL)) {
            statement.setInt(1,customer.getId());
            statement.setInt(2,customer.getTypeId());
            statement.setString(3,customer.getName());
            statement.setString(4,customer.getBirthday());
            statement.setInt(5,customer.getGender());
            statement.setString(6,customer.getIdCard());
            statement.setString(7,customer.getPhone());
            statement.setString(8,customer.getEmail());
            statement.setString(9,customer.getAddress());
            System.out.println(statement);
            statement.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    @Override
    public List<Customer> searchCustomerByName(String name) {
        List<Customer> customerList = new ArrayList<>();
        try(Connection connection = getConnection();
        PreparedStatement statement = connection.prepareStatement(SELECT_CUSTOMER_BY_NAME)) {
            statement.setString(1,"%"+name+"%");
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                int id = rs.getInt("customer_id");
                int typeId = rs.getInt("customer_type_id");
                String name1 = rs.getString("customer_name");
                String birthday = rs.getString("customer_birthday");
                int gender = rs.getInt("customer_gender");
                String idCard = rs.getString("customer_id_Card");
                String phone = rs.getString("customer_phone");
                String email = rs.getString("customer_email");
                String address = rs.getString("customer_address");
                customerList.add(new Customer(id,typeId,name1,birthday,gender,idCard,phone,email,address));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;
    }

    @Override
    public boolean deleteCustomer(int id) throws SQLException {
        boolean check;
        try(Connection connection = getConnection();
        PreparedStatement statement = connection.prepareStatement(DELETE_CUSTOMER_SQL)) {
            statement.setInt(1,id);
            check = statement.executeUpdate() > 0;
        }finally {
            getConnection().close();
        }
        return check;
    }

    @Override
    public boolean updataCustomer(Customer customer) throws SQLException {
        boolean check;
        try(Connection connection = getConnection();
        PreparedStatement statement = connection.prepareStatement(UPDATE_CUSTOMER_SQL)) {
            statement.setInt(1,customer.getTypeId());
            statement.setString(2,customer.getName());
            statement.setString(3,customer.getBirthday());
            statement.setInt(4,customer.getGender());
            statement.setString(5,customer.getIdCard());
            statement.setString(6,customer.getPhone());
            statement.setString(7,customer.getEmail());
            statement.setString(8,customer.getAddress());
            statement.setInt(9,customer.getId());
            check = statement.executeUpdate() > 0;
        }finally {
            getConnection().close();
        }
        return check;
    }

    @Override
    public Customer selectCustomer(int id) {
        Customer customer = null;
        try(Connection connection = getConnection();
        PreparedStatement statement = connection.prepareStatement(SELECT_CUSTOMER)) {
            statement.setInt(1,id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                int typeId = rs.getInt("customer_type_id");
                String name = rs.getString("customer_name");
                String birthday = rs.getString("customer_birthday");
                int gender = rs.getInt("customer_gender");
                String idCard = rs.getString("customer_id_Card");
                String phone = rs.getString("customer_phone");
                String email = rs.getString("customer_email");
                String address = rs.getString("customer_address");
                customer = new Customer(id,typeId,name,birthday,gender,idCard,phone,email,address);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }
}

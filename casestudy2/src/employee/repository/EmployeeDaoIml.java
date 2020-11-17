package employee.repository;

import employee.model.Employee;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDaoIml implements EmployeeDao {

    private String jdbcURL = "jdbc:mysql://localhost:3306/casestudy2";
    private String jdbcUsername = "root";
    private String jdbcPassword = "12345678";

    private static final String INSERT_EMPLOYEE_SQL = "INSERT INTO " +
            "employee(employee_name, employee_birthday, employee_id_card,employee_salary,employee_phone,employee_email,employee_address" +
            ",position_id,education_degree_id,division_id,username) " +
            "VALUES(?,?,?,?,?,?,?,?,?,?,?)";
    private static final String SELECT_ALL_EMPLOYEE = "select * from employee";
    private static final String SELECT_EMPLOYEE_BY_NAME = "select * from employee where employee_name like ?";
    private static final String DELETE_EMPLOYEE_SQL = "delete from employee where employee_id = ?";
    private static final String UPDATE_EMPLOYEE_SQL = "update employee set employee_name = ?,employee_birthday= ?, employee_id_card = ?," +
            "employee_salary = ?,employee_phone = ?,employee_email= ?, employee_address = ?,position_id = ?,education_degree_id=?" +
            ",division_id= ?, username = ? where employee_id = ?";
    private static final String SELECT_EMPLOYEE = "select * from employee where  employee_id = ?";


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
    public List<Employee> getAllEmplyee() {
        List<Employee> employeeList = new ArrayList<>();
        try(Connection connection=getConnection();
            PreparedStatement statement = connection.prepareStatement(SELECT_ALL_EMPLOYEE)) {
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                int id = rs.getInt("employee_id");
                String employee_name = rs.getString("employee_name");
                String employee_birthday = rs.getString("employee_birthday");
                String employee_id_card = rs.getString("employee_id_card");
                double employee_salary = rs.getDouble("employee_salary");
                String employee_phone = rs.getString("employee_phone");
                String employee_email = rs.getString("employee_email");
                String employee_address = rs.getString("employee_address");
                int position_id = rs.getInt("position_id");
                int education_degree_id = rs.getInt("education_degree_id");
                int division_id = rs.getInt("division_id");
                String username = rs.getString("username");
                employeeList.add(new Employee(id,employee_name,employee_birthday,employee_id_card,employee_salary,employee_phone,employee_email,
                        employee_address,position_id,education_degree_id,division_id,username));
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
        return employeeList;
    }

    @Override
    public void insertEmplyee(Employee emplyee) throws SQLException {
        try(Connection connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(INSERT_EMPLOYEE_SQL)) {
//            statement.setInt(1,emplyee.getId());
            statement.setString(1,emplyee.getName());
            statement.setString(2,emplyee.getBirthday());
            statement.setString(3,emplyee.getIdCard());
            statement.setDouble(4,emplyee.getSalary());
            statement.setString(5,emplyee.getPhone());
            statement.setString(6,emplyee.getEmail());
            statement.setString(7,emplyee.getAddress());
            statement.setInt(8,emplyee.getPositionId());
            statement.setInt(9,emplyee.getEducationDegreeId());
            statement.setInt(10,emplyee.getDivisionId());
            statement.setString(11,emplyee.getUserName());
            statement.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    @Override
    public List<Employee> searchEmplyeeByName(String name) {
        List<Employee> employeeList = new ArrayList<>();
        try(Connection connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(SELECT_EMPLOYEE_BY_NAME)) {
            statement.setString(1,"%"+name+"%");
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                int id = rs.getInt("employee_id");
                String employee_name = rs.getString("employee_name");
                String employee_birthday = rs.getString("employee_birthday");
                String employee_id_card = rs.getString("employee_id_card");
                double employee_salary = rs.getDouble("employee_salary");
                String employee_phone = rs.getString("employee_phone");
                String employee_email = rs.getString("employee_email");
                String employee_address = rs.getString("employee_address");
                int position_id = rs.getInt("position_id");
                int education_degree_id = rs.getInt("education_degree_id");
                int division_id = rs.getInt("division_id");
                String username = rs.getString("username");
                employeeList.add(new Employee(id,employee_name,employee_birthday,employee_id_card,employee_salary,employee_phone,employee_email,
                        employee_address,position_id,education_degree_id,division_id,username));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employeeList;
    }

    @Override
    public boolean deleteEmplyee(int id) throws SQLException {
        boolean check;
        try(Connection connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(DELETE_EMPLOYEE_SQL)) {
            statement.setInt(1,id);
            check = statement.executeUpdate() > 0;
        }finally {
            getConnection().close();
        }
        return check;
    }

    @Override
    public boolean updataEmplyee(Employee emplyee) throws SQLException {
        boolean check;
        try(Connection connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(UPDATE_EMPLOYEE_SQL)) {
            statement.setString(1,emplyee.getName());
            statement.setString(2,emplyee.getBirthday());
            statement.setString(3,emplyee.getIdCard());
            statement.setDouble(4,emplyee.getSalary());
            statement.setString(5,emplyee.getPhone());
            statement.setString(6,emplyee.getEmail());
            statement.setString(7,emplyee.getAddress());
            statement.setInt(8,emplyee.getPositionId());
            statement.setInt(9,emplyee.getEducationDegreeId());
            statement.setInt(10,emplyee.getDivisionId());
            statement.setString(11,emplyee.getUserName());
            statement.setInt(12,emplyee.getId());
            check = statement.executeUpdate() > 0;
        }finally {
            getConnection().close();
        }
        return check;
    }

    @Override
    public Employee selectEmplyee(int id) {
        Employee employee = null;
        try(Connection connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(SELECT_EMPLOYEE)) {
            statement.setInt(1,id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                String employee_name = rs.getString("employee_name");
                String employee_birthday = rs.getString("employee_birthday");
                String employee_id_card = rs.getString("employee_id_card");
                double employee_salary = rs.getDouble("employee_salary");
                String employee_phone = rs.getString("employee_phone");
                String employee_email = rs.getString("employee_email");
                String employee_address = rs.getString("employee_address");
                int position_id = rs.getInt("position_id");
                int education_degree_id = rs.getInt("education_degree_id");
                int division_id = rs.getInt("division_id");
                String username = rs.getString("username");
                employee = new Employee(id,employee_name,employee_birthday,employee_id_card,employee_salary,employee_phone,employee_email,
                        employee_address,position_id,education_degree_id,division_id,username);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employee;
    }
}

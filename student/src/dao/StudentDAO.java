package dao;

import model.Student;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO implements IStudentDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/demo";
    private String jdbcUserName = "root";
    private String jdbcPassword = "12345678";

    private static final String INSERT_STUDENT_SQL = "INSERT INTO student (name, phoneNumber, address,gender) VALUES (?, ?, ?,?);";
    private static final String SELECT_STUDENT_BY_ID = "select id,name, phoneNumber, address,gender from student where id =?";
    private static final String SELECT_ALL_STUDENT = "select * from student";
    private static final String DELETE_STUDENT_SQL = "delete from student where id = ?";
    private static final String UPDATE_STUDENT_SQL = "update student set name = ?,phoneNumber= ?, address = ?,gender = ? where id = ?";
    private static final String SELECT_STUDENT_BY_NAME = "select * from student where name like ?";

    public StudentDAO() {
    }
    protected Connection getConnection(){
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL,jdbcUserName,jdbcPassword);

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    @Override
    public void inserStudent(Student student) throws SQLException {
        try(Connection connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(INSERT_STUDENT_SQL)) {
            statement.setString(1,student.getName());
            statement.setString(2,student.getPhoneNumber());
            statement.setString(3,student.getAddress());
            statement.setString(4,student.getGender());
            statement.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            getConnection().close();
        }
    }

    @Override
    public Student selectStudent(int id) {
        Student student = null;
        try(Connection connection = getConnection();
        PreparedStatement statement = connection.prepareStatement(SELECT_STUDENT_BY_ID)) {
            statement.setInt(1,id);

            ResultSet rs =statement.executeQuery();
            while (rs.next()){
                String name = rs.getString("name");
                String phoneNumber = rs.getString("phoneNumber");
                String address = rs.getString("address");
                String gender = rs.getString("gender");
                student = new Student(id,name,phoneNumber,address,gender);
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
        return student;
    }

    @Override
    public List<Student> selectAllStudent() {
        List<Student> studentList = new ArrayList<>();
        try(Connection connection = getConnection();
        PreparedStatement statement = connection.prepareStatement(SELECT_ALL_STUDENT)) {
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String phoneNumber = rs.getString("phoneNumber");
                String address = rs.getString("address");
                String gender = rs.getString("gender");
                studentList.add(new Student(id,name,phoneNumber,address,gender));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                getConnection().close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return studentList;
    }

    @Override
    public boolean deleteStudent(int id) throws SQLException {
        boolean check;
        try(Connection connection = getConnection();
        PreparedStatement statement = connection.prepareStatement(DELETE_STUDENT_SQL)) {
            statement.setInt(1,id);
            check = statement.executeUpdate() > 0;
        }finally {
            getConnection().close();
        }
        return check;
    }

    @Override
    public boolean updateStudent(Student student) throws SQLException {
        boolean check;
        try(Connection connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(UPDATE_STUDENT_SQL)) {
            statement.setString(1,student.getName());
            statement.setString(2,student.getPhoneNumber());
            statement.setString(3,student.getAddress());
            statement.setString(4,student.getGender());
            statement.setInt(5,student.getId());
            check = statement.executeUpdate() > 0;
        }finally {
            getConnection().close();
        }
        return check;
    }

    @Override
    public List<Student> seachStudent(String name) {
        List<Student> studentList = new ArrayList<>();
        try(Connection connection = getConnection();
        PreparedStatement statement = connection.prepareStatement(SELECT_STUDENT_BY_NAME)) {
            statement.setString(1,"%"+name+"%");
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                int id = rs.getInt("id");
                String name1 = rs.getString("name");
                String phoneNumber = rs.getString("phoneNumber");
                String address = rs.getString("address");
                String gender = rs.getString("gender");
                studentList.add(new Student(id,name1,phoneNumber,address,gender));
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
        return studentList;
    }
}

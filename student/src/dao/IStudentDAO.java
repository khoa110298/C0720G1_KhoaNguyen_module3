package dao;

import model.Student;

import java.sql.SQLException;
import java.util.List;

public interface IStudentDAO {
    public void inserStudent(Student student) throws SQLException;
    public Student selectStudent(int id);
    public List<Student> selectAllStudent();
    public boolean deleteStudent(int id) throws SQLException;
    public boolean updateStudent(Student student) throws SQLException;
    public List<Student> seachStudent(String name);
}
